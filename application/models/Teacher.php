<?php
/**
 * 
 * 教师类：
 * @author jac,wepeng
 * @access public
 * @copyright 广西大学计网081
 * @version 0.1
 */
class Teacher extends Zend_Db
{
	protected $db;
	
	public function __construct()
	{
		$this->db = Zend_Registry::get('db');
	}
	
	public function isLeader($id)
	{
		$sql = "select level_id from teacher where id='".$id."'";
		$result = $this->db->query($sql)->fetchAll();
		if($result[0]['level_id'] == 2)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	
	public function isAdmin($id)
	{
		$sql = "select level_id from teacher where id='".$id."'";
		$result = $this->db->query($sql)->fetchAll();
		if($result[0]['level_id'] == 3)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	
	public function searchLeader($name)
	{
		$sql = "select id,username,password,name,sex  from teacher where level_id='2' and name='".$name."'";
		$result = $this->db->query($sql)->fetchAll();
		if(count($result)>0)
		{	return $result;
			//print_r($result);
		}
		return NULL;
	}
	
	public function getLeaderList()
	{
		$sql = "select *  from teacher where level_id='2'";
		$result = $this->db->query($sql)->fetchAll();
		if(count($result)>0)
			return $result;
		return NULL;
	}
	
	public function searchStudentInfo($value,$key)
	{
		$sql = "select * from student where ".$key."='".$value."'";
		$result = $this->db->query($sql)->fetchAll();
		if(count($result)>0)
			return $result;
		return NULL;
	}
	
	public function addstudent($username,$name,$sex,$password)
	{
		$sql = "insert into student (username,name,sex,password) 
			values ('".$username."','".$name."','".$sex."','".$password."')";
		$result = $this->db->query($sql);
		if(!$result)
			return NULL;
		else
			return 1;
			
	}
//login-qin
	public function getStudentByClassID($class_id)
	{
		$result = array();
		$sql = 'SELECT s.id, s.username, s.name, s.sex, s.password, c.class_name
			FROM Student s, class c, class_student cs
			WHERE s.id = cs.student_id
			AND c.id = cs.class_id
			AND c.id = '.$class_id.''
			;
		$result = $this->db->query($sql);
		if($result) {
			return $result->fetchAll();
		}else {
			return FALSE;
		}
	}

	public  function getClass($teacher_id, $level_id) 
	{
		$result = array();
		switch ($level_id)
		{
		case 3: //Admin and Leader return all classes
			$sql = 'SELECT c.id, c.class_name FROM class c ORDER BY c.class_name';
			break;
		case 2: //Admin and Leader return all classes
			$sql = 'SELECT c.id, c.class_name FROM class c ORDER BY c.class_name';
			break;
		case 1: //teacher return his class 
			$sql = 'SELECT c.id, c.class_name FROM class c WHERE c.teacher_id = '.$teacher_id.'';
			break;
		default:
			$result = NULL;
			break;
		}
		$result = $this->db->query($sql);
		if($result) {
			return $result->fetchAll();
		} else {
			return FALSE;
		}
	}

	function getTeacher()
	{
		$sql = 'SELECT t.id, t.username, t.name, t.sex, t.level_id 
			FROM teacher t 
			WHERE t.level_id = 1';
		$result = $this->db->query($sql);
			if($result) {
				return $result->fetchAll();
			}else {
				return FALSE;
			}
	}

	function getAllClass() 
	{
		$sql = 'SELECT id, class_name, teacher_id FROM `class`';
		$result =  $this->db->query($sql);
			if($result) {
				return $result->fetchAll();
			}else {
				return FALSE;
			}
	}

	function insert($data, $table)         //insert data to database by tablename
	{
		$columns = '(';
		$values = '(';
		foreach($data as $key => $value) 
		{
			$columns .= '`'.$key.'`,';     //use '`' to distinguish which is columns
			$values .= '"'.$value.'",';    //use '"' to distinguish which is value, if not it can't  working 
		}
		$volumns = substr($columns, 0 , -1);  //remove the last ','
		$values = substr($values, 0, -1);
		$volumns .= ')';
		$values .= ')';
		$sql = "INSERT $table $volumns VALUES $values";
		$result = $this->db->query($sql);
		if($result) {
			return $this->db->lastInsertId(); //return last insert id
		}
		else {
			return FALSE;
		}

	}

	function update($data, $where, $table)
	{
		$values = '';
		foreach($data as $key => $value) 
		{
			$values .= '`'.$key.'` = "'.$value.'",';
		}
		$values = substr($values, 0, -1);
		$sql = "UPDATE $table SET $values $where";
		if($result = $this->db->query($sql)) {
			return TRUE;
		}else{
			return FALSE;
		}	
	}

	function delete($where, $table) 
	{
		$sql = "DELETE FROM $table $where";
		$result = $this->db->query($sql);
		if($result) return TRUE;
		else return FALSE;
	}

	function getStudent($where, $sort, $limit)
	{
		$sql = "SELECT student.id,username,name,sex,password, class_name FROM student,class,class_student  $where 
			student.id=class_student.student_id AND class.id=class_student.class_id $sort $limit";
		if($result = $this->db->query($sql)) {
			return $result->fetchAll();
		}else {
			return FALSE;
		}
	}

	function runSQL($sql)
	{
		return $result = $this->db->query($sql);
	}

	function getAllTeacher()
	{
		$sql = "SELECT id, username, name FROM teacher";
		$result = $this->db->query($sql);
		if($result) {
			return $result->fetchAll();	
		}else {
			return FALSE;
		}
	}

	function deleteclass($class_id) 
	{
		$where = "WHERE `class`.`id` = $class_id";
		$ifclass = $this->delete($where, 'class'); //Delete class

		$where = " WHERE `id` IN (SELECT `student_id` FROM  `class_student` WHERE `class_id` = $class_id )";
		$ifstudent = $this->delete($where, 'student'); //Delete student belong the class

		$where = " WHERE `class_id` = $class_id";
		$ifclass_student = $this->delete($where, 'class_student'); //Delete class and student mapping table data

		$where = "WHERE `class_id` = $class_id";
		$ifexamination_class = $this->delete($where, 'examination_class'); //Delete examination class record
		if($ifclass && $ifstudent && $ifclass_student && $ifexamination_class) return TRUE;
		else return FALSE;
	}

}
