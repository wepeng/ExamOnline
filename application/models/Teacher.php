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
}