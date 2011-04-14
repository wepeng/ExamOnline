<?php
//Score.php

/**
 * 成绩类
 * @version 1.0
 * @copyright 2011-? Guangxi University Jiwang081
 * @author monyie <monyxie@gmail.com> 
 * @license All rights reserved.
 */
class Score extends Zend_db
{
    protected $db;

    public function __construct()
    {
        $this->db = Zend_Registry::get('db');
    }

    /**
     * 获取成绩
     * @param integer $student_id 
     * @param integer $examination_id 
     * @access public
     * @return array
     */
    public function getScore($student_id, $examination_id)
    {
        $sql = "SELECT `parts_score`, `total_score` FROM `score` WHERE `student_id`='$student_id' AND `examination_id`='$examination_id'";
        $result = $this->db->query($sql)->fetchAll();
        return $result;
    }


    /**
     * 添加/更新成绩
     * @param integer $student_id 
     * @param integer $examination_id 
     * @param string $parts_score 
     * @param integer $total_score 
     * @access public
     * @return mixed
     */
    public function updateScore($student_id, $examination_id, $parts_score, $total_score)
    {
        if ($this->getScore($student_id, $examination_id) == null)
        {
            //insert
            $sql = "INSERT INTO `score` (`student_id`, `examination_id`, `parts_score`, `total_score`) VALUES";
            $sql .= "('$studnet_id', '$examination_id', '$parts_score, '$total_score')";
            $result = $this->db->query($sql);
        }
        else
        {
            //update
            $sql = "UPDATE `score` SET `parts_score`='$parts_score', `total_score`='$total_score' 
                WHERE `student_id`='$student_id' AND `examination_id`='$examination_id'";
            $result = $this->db->query($sql);
        }
        return $result;
    }

    /**
     * 将一组学生成绩添加到数据库(无重复检查)
     * @param integer $examination_id 
     * @param array $arrScore 
     * @access public
     * @return bool
     */
    public function addScoreArray($examination_id, $arrScore)
    {
        if ( !is_array($arrScore)) return -1;
        $sql = "INSERT INTO `score` (`student_id`, `examination_id`, `parts_score`, `total_score`) 
            VALUES";
        $sqlvalues = "";

        //处理传入的所有学生成绩
        foreach($arrScore as $student_id => $oneScore)
        {
            //处理单个学生成绩
            if ($sqlvalues != "") $sqlvalues .= ',';
            $sqlvalues .= " ('" . $student_id . "', '" . $examination_id . "', '" . $oneScore['parts_score'] . "', '" . $oneScore['total_score'] . "')";

            $sql .= $sqlvalues . ';';

            $result = $this->db->query($sql);

            if (!$result)
            {
                return false;
            }
            else 
            {
                return true;
            }
        }  //foreach
    }  //function

}  //class
