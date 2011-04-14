<?php
//Answer.php

/**
 * 答案类
 * @version 1.0
 * @copyright 2011-? Guangxi University Jiwang081
 * @author monyie <monyxie@gmail.com> 
 * @license All rights reserved.
 */
class Answer extends Zend_Db
{
    protected $db;

    public function __construct()
    {
        $this->db = Zend_Registry::get('db');
    }

    /**
     * 判断一个题目是否是选择题
     * @param integer $part_id 
     * @access public
     * @return bool
     */
    public function isSelection($part_id)
    {
        $sql = "SELECT `selection_id` FROM `part_selection` WHERE `part_id`='$part_id'";
        $result = $this->db->query($sql)->fetchAll();
        if ($result != null) return true;
        else return false;
    }

    /**
     * 获取试卷答案
     * @param integer $paper_id 
     * @access public
     * @return string
     */
    public function getPaperAnswer($paper_id)
    {
        $sql = "SELECT `answer` FROM `paper_answer` WHERE `paper_id`='$paper_id'";
        $result = $this->db->query($sql)->fetchAll();

        if (null == $result) return null;
        else return $result[0]['answer'];
    }

    /**
     * 根据考试id获取试卷id
     * @param integer $exam_id 
     * @access public
     * @return integer
     */
    public function getPaperIdByExamId($exam_id)
    {
        $sql = "SELECT `paper_id` FROM `examination` WHERE `id`='$exam_id'";
        $result = $this->db->query($sql)->fetchAll();

        if (null == $result) return null;
        else return $result[0]['paper_id'];
    }

    /**
     * 获取某次考试答案
     * @param integer $examination_id 
     * @access public
     * @return string
     */
    public function getExamAnswer($examination_id)
    {
        $paperId = $this->getPaperIdByExamId($examination_id);
        return $this->getPaperAnswer($paperId);
    }

    /**
     * 获取某学生答案
     * @param integer $student_id 
     * @param integer $examination_id 
     * @access public
     * @return array
     */
    public function getStudentAnswer($student_id, $examination_id)
    {
        $sql = "SELECT `answer` FROM `student_answer` WHERE `examination_id`='$examination_id' AND `student_id`='$studnet_id'";
        $result = $this->db->query($sql)->fetchRow();
        return $result;
    }

    /**
     * 获取学生答案,可以指定获取的行数
     * @param integer $exam_id 
     * @param integer $limit 
     * @param integer $offset 
     * @access public
     * @return array
     */
    public function getAllStudentAnswerByExamId($exam_id, $limit = false, $offset = null)
    {
        //TODO:
        //添加对重复记录的处理(只取后一次)
        //monyxie:
        //需要另写函数,逐条记录读取
        //放弃
        static $l_offset;
        if (null !== $offset) $l_offset = $offset;
        $sql = "SELECT `student_id`,`answer` FROM `student_answer` WHERE `examination_id`='$exam_id'";
        if (false !== $limit) $sql .= " LIMIT " . (int)$l_offset . ",$limit";
        $result = $this->db->query($sql)->fetchAll();

        $l_offset += count($result);
        return $result;
    }

}//class
