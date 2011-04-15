<?php
//Paper.php

/**
 * Paper Modle Class
 * @version 1.0
 * @copyright 2011-? Guangxi University Jiwang081
 * @author Login.Qin 
 * @license All rights reserved.
 */
class Paper extends Zend_db
{
    protected $db;

    public function __construct()
    {
        $this->db = Zend_Registry::get('db');
	}

	/**
	 * Get  Paper Category
	 */ 
	public function getpapercategory($where, $sort, $limit)
   	{
		$sql = "SELECT id, name FROM papercategory $where $sort $limit";
		$result = $this->db->query($sql);
		if($result) return $result->fetchAll();
		else return FALSE;
	}

}
