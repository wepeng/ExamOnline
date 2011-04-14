<?php
/**
 * 
 * 学生类：
 * @author jac,wepeng
 * @access public
 * @copyright 广西大学计网081
 * @version 0.1
 */
class Student extends Zend_Db
{
	protected $db;
	
	/**
	 * 
	 * 构造函数
	 */
	function __construct()
	{
		$this->db = Zend_Registry::get('db');
	}
	
	/**
	 * 
	 * 检查用户名（学号）是否存在
	 * @param unknown_type $username
	 */
	public function checkStudent($username)
	{
		$sql = "select id from student where username='".$username."'";
		$resutl = $this->db->query($sql)->fetchAll();
		if(count($resutl)>0)
			return true;
		else return false;
	}
	
}