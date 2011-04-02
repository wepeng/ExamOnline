<?php
/**
 * 
 * 系统类
 * @author jac,wepeng
 * @access public
 * @copyright 广西大学计网081
 * @version 0.1
 */
class System
{
	protected $db;
	
	public function __construct()
	{
		$this->db = Zend_Registry::get('db');
	}
	public function login($username, $password, $key)
	{
		if($key == 'student')
		{
			$sql = $this->db->quoteInto('Select * from student where username =?',$username);
			$result = $this->db->query($sql)->fetchAll();
		}
		elseif ($key == 'teacher')
		{
			$sql = $this->db->quoteInto('Select * from teacher where username =?',$username);
			$result = $this->db->query($sql)->fetchAll();
		}
		
		if(!empty($result))
		{
			if($username == $result[0]['username'] && $password == $result[0]['password'])
			{
				return $result;
			}
		}

		return false;
	}
	
	public function checkLogined()
	{
		$examSession = new Zend_Session_Namespace('examSession');	
		if(!($examSession->username && $examSession->password))
		{
			$examSession->unsetAll();
			header('Location: ../');
		}
	}

	function resetPassword($username, $newpassword, $key)
	{
		$bind = array('password'=>$newpassword);
		$where = "username='".$username."'";
		if($this->db->update($key, $bind, $where))
		{
			return true;
		}
		else 
		{
			return false;
		}
		
	}
	function deleteperson($username, $table)
	{
		switch($table) 
		{
		case 'student':
			$sql_1 = "SELECT `id` FROM `student` WHERE `username` = '$username' ";
			$id = $this->db->query($sql_1)->fetchAll();
			$id = $id[0]['id'];
			$sql_1 = "DELETE FROM `class_student` WHERE `student_id` = $id";
			$sql_2 = "DELETE FROM `examed` WHERE `student_id` = $id";
			$sql_3 = "DELETE FROM `examination_student` WHERE `student_id` = $id";
			$sql_4 = "DELETE FROM `reexamination` WHERE `student_id` = $id";
			$sql_5 = "DELETE FROM `savereexamination` WHERE `student_id` = $id";
			$sql_6 = "DELETE FROM `score` WHERE `student_id` = $id";
			$sql_7 = "DELETE FROM `student_answer` WHERE `student_id` = $id";
			$sql_final = "DELETE FROM `student` WHERE `id` = $id";
			$check = $this->db->query($sql_1) &&
				$this->db->query($sql_2) &&
				$this->db->query($sql_3) &&
				$this->db->query($sql_4) &&
				$this->db->query($sql_5) &&
				$this->db->query($sql_6) &&
				$this->db->query($sql_7) &&
				$this->db->query($sql_final);
			if($check) return TRUE;
			else return FALSE;
			break;

		case 'teacher':
			$sql = "DELETE FROM `teacher` WHERE `username` = '$username'";
			$check = $this->db->query($sql);
			if($check) return TRUE;
			else return FALSE;
			break;
		default:
			return FALSE;
		}

	}
}
