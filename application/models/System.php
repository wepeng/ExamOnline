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
		$sql = "DELETE FROM `$table` WHERE `username` = $username ";
		$result = $this->db->query($sql);	
		if($result) 
		{
			return TRUE	;
		}else 
		{
			return FALSE;
		}
	}
	
}
