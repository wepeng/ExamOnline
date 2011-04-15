<?php
//AnswerController.php

//require_once "Zend/Controller/Action.php";

/**
 * 答案控制类
 * @version 1.0
 * @copyright 2011-? Guangxi University Jiwang081
 * @author monyie <monyxie@gmail.com> 
 * @license All rights reserved.
 */
class AnswerController extends Zend_Controller_Action
{
    protected $m_answer;
    protected $m_score;

    function init()
    {
        Zend_Loader::loadClass('Answer', realpath(dirname(__FILE__) . '/../models'));
        Zend_Loader::loadClass('System',realpath(dirname(__FILE__) . '/../models'));
        Zend_Loader::loadClass('Score',realpath(dirname(__FILE__) . '/../models'));
        $this->m_answer = new Answer();
        $this->m_score = new Score();

    }

    protected function _isSelection($part_id)
    {
        return $this->m_answer->isSelection($part_id);
    }

    /**
     * 
     * 解析答案
     * @param string $answer 
     * @access protected
     * @return void
     */
    protected function _resolveanswer($answer)
    {
		echo "s:".$answer."\n";
        $str = strtok($answer, "<");
		echo "str~:".$str."\n";
        while (false !== $str)
        {
//echo "str:".$str."\n";
            $token = strtok($str, ">");
            $label = explode(':', $token);
			echo $token;
            if (count($label) != 3) return null; //非法的标签

            $labelname = $label[0];  // "part"
            $id = $label[1];        // part_id
            $index = $label[2];     // index

            $token = strtok("</" . $labelname . ">");
			//echo "token:".$token."\n";

            //跳过非选择题
            if ($this->_isSelection($id))
            {
                $answer = explode('#', $token);
                $resolved[$id] = $answer;
            }
            else 
            {
                //非选择题答案设为空串
                $resolved[$id] = "";
            }
            $str = strtok("<");
			//echo "str~~:".$str."\n";
        }
        return $resolved;
    }

    /**
     * 此动作执行对某次考试的全部学生的改卷
     * @access public
     * @return void
     */
    public function checkexamanswerAction()
    {
        //获取GET请求参数
        if ($this->_hasParam('examination_id'))
        {
            $examination_id = $this->_getParam('examination_id');
            $this->_checkexamanswer($examination_id);
        }
        else
        {
            //没有指定考试id
            //TODO:请协助完善这里
            echo "未指定考试!";
        }
        //TODO:(完成改卷后)做其他事情
    }


    /**
     * 此函数执行改卷动作(只对客观题改卷)
     * @param integer $examination_id 
     * @access protected
     * @return void
     */
    protected function _checkexamanswer($examination_id)
    {
        $limit = 50;  //限制每次请求获取的行数

        $examAnswer = $this->m_answer->getExamAnswer($examination_id);
        if (null == $examAnswer) return -1;  //标准答案不存在

        $examAnswer = $this->_resolveanswer($examAnswer);
		var_dump($examAnswer);exit;
        //$examPartCount = count($examAnswer);  //标准答案的part数

        $allStudentsAnswer = $this->m_answer->getAllStudentAnswerByExamId($examination_id, $limit);
        while (0 != count($allStudentsAnswer))
        {

            if (null == $allStudentsAnswer) return -2;  //学生答案不存在

            if (!is_array($allStudentsAnswer)) $allStudentsAnswer = array($allStudentsAnswer);

            //处理一次请求获取的全部学生答案
            $arrAllStudent = array();  //array( array([student_id] => "Score String"))
            foreach($allStudentsAnswer as $studentAnswer)
            {

                //处理单个学生的答案
                $tmp = $this->_resolveanswer($studentAnswer['answer']);
				echo $studentAnswer['answer'];
				//print_r($tmp);exit;
                //if (count($tmp) !== $examPartCount) return -3;  //学生答案的part数
                $strScore = "";
                $totalScore = 0;
                foreach($examAnswer as $part_id => $partAnswer)
                {
                    if (!array_key_exists($part_id, $tmp)) 
                    {
                        //学生答案没有与之对应的part, 跳过
                        if ($strScore != "") $strScore .= '#';
                        $strScore .= '0';
                        continue;
                    }

                    //处理单个part的答案

                    $partCorrectCount = 0;
                    $partScore = 0;

                    //跳过非选择题
                    if ($partAnswer != "")
                    {
                        foreach($partAnswer as $key => $value)
                        {
                            //if (!array_key_exists($key, $examAnswer[$part_id])) continue; 
                            if (array_key_exists($key, $tmp[$part_id]) && $tmp[$part_id][$key] == $value)
                            {
                                //小题正确
                                $partCorrectCount++;
                            }
                            else
                            {
                                //小题错误
                            }

                        }
                        //TODO:
                        //此处应乘上每小题的分值
                        //monyxie:
                        //需要修改数据库
                        //已放弃,分值全设为1
                        $partScore = $partCorrectCount;
                        $totalScore += $partScore;
                    }
                    if ($strScore != "") $strScore .= '#';
                    $strScore .= $partScore;

                }  //foreach 2
                $arrAllStudent[$studentAnswer['student_id']]['parts_score'] = $strScore;
                $arrAllStudent[$studentAnswer['student_id']]['total_score'] = $totalScore;

                //更新学生成绩
                $this->m_score->updateScore($studentAnswer['student_id'], $examination_id, $strScore, $totalScore);

            }  //foreach 1

            //这句是执行无重复检查的添加
            //$this->m_score->addScoreArray($examination_id, $arrAllStudent);
            $allStudentsAnswer = $this->m_answer->getAllStudentAnswerByExamId($examination_id, $limit);
        }  //while

    }  //function

    /**
     * 此动作执行单个学生的改卷
     * @access public
     * @return void
     */
    public function checkoneanswerAction()
    {
        //TODO:
    }

    public function setscoreAction()
    {

    }
}  //class
