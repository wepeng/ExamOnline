<?php 
require_once 'Zend/Controller/Action.php';
/**
 * 
 * 试卷控制类
 * @author Login.Qin
 * 
 */
class PaperController extends Zend_Controller_Action
{
	function init()
	{
		Zend_Loader::loadClass('Paper',realpath(dirname(__FILE__) . '/../models'));	
		Zend_Loader::loadClass('Teacher',realpath(dirname(__FILE__) . '/../models'));	
		$this->paper = new Paper();
		$this->teacher = new Teacher();
		$this->examSession = new Zend_Session_Namespace('examSession');
	}

	/**
	 * Manage Paper Category Update , Use The Flexigird
	 */
	function managepapercategoryAction() 
	{
		
	}

	/** 
	 * Get Paper Category Json Data For Flexigird
	 */
	function getpapercategoryjsondataAction()
	{
		error_reporting(0);
		$page = isset($_POST['page']) ? $_POST['page'] : '';
		$rp = isset($_POST['rp']) ? $_POST['rp'] : '';
		$sortname = isset($_POST['sortname']) ? $_POST['sortname'] : '';
		$sortorder = isset($_POST['sortorder']) ? $_POST['sortorder'] : '';
		if (!$sortname) $sortname = 'id';
		if (!$sortorder) $sortorder = 'desc';
		if($_POST['query'] != '') //to search
		{
			$where = "WHERE `".$_POST['qtype']."` LIKE '%".$_POST['query']."%'";
		} 
		else 
		{
			$where =" ";
		}
		$sort = "ORDER BY $sortname $sortorder";
		if (!$page) $page = 1;
		if (!$rp) $rp = 60;
		$start = (($page-1) * $rp);
		$limit = "LIMIT $start, $rp";
		$result = $this->paper->getpapercategory($where, $sort, $limit);
		$total = count($result);
		header("Expires: Mon, 26 Jul 1997 05:00:00 GMT" );
		header("Last-Modified: " . gmdate( "D, d M Y H:i:s" ) . "GMT" );
		header("Cache-Control: no-cache, must-revalidate" );
		header("Pragma: no-cache" );
		header("Content-type: text/x-json");
		$json = "";
		$json .= "{\n";
		$json .= "page: $page,\n";
		$json .= "total: $total,\n";
		$json .= "rows: [";
		$rc = false;
		foreach ($result as $row ) {
			if ($rc) $json .= ",";
			$json .= "\n{";
			$json .= "id:'".$row['id']."',";
			$json .= "cell:['".$row['id']."','".$row['name']."']";
			$json .= "}";
			$rc = true;
		}
		$json .= "]\n";
		$json .= "}";
		echo $json;
	}
	
	/**
	 * Insert Or Update Paper Category By Ajax
	 */ 
	function addorupdatepapercateAction() {
		$table = 'papercategory';
		if(empty($_POST['name'])) {
			echo 'no';
			die();
		}
		if(isset($_POST['id'])) //if get the 'id'，means to update
		{

			$data = array(
				'id'          => trim($_POST['id']),
				'name'  => trim($_POST['name']),
			);

			$where = "WHERE `".$table."`.`id` = ".$_POST['id']."";
			$result = $this->teacher->update($data, $where, $table);
			if($result)	$this->view->msg = 'yes';
			else 	$this->view->msg = 'no';
		}
		else                   //if not get 'id', means to add
		{
			$data = array(
				'name' => trim($_POST['name'])
			);
			$result = $this->teacher->insert($data, $table); //return the last insert id;
			if($result === '0' || $result ) { $this->view->msg =  "yes";
			}
			else
			{
				$this->view->msg = 'no';
			}
		}
	}

	/*
	 * Delete paper category and move the paper to the default category
	 * And if not have dafault category creat it.
	 */
	function deletepapercategoryAction()
	{
		$postid = trim($_POST['id']);
		$defaultid = '';
		$sql = "SELECT id FROM `papercategory` WHERE  name='默认'";
		$result = $this->paper->runSQL($sql);
		$result  = $result->fetchAll();
		if(count($result) > 0) {
			$defaultid = $result[0]['id'];
			if($defaultid == $postid) {
				echo 'no';
				die();
			}
		}
		else 
		{
			$data = array( 'name'=> '默认');	
			$defaultid =  $this->teacher->insert($data, 'papercategory');
		}
		$data = array('category_id' => $defaultid);
		$whereupdate = 'WHERE `category_id` = '.$postid.'';
		$ifupdatepaper = $this->teacher->update($data, $whereupdate ,'paper');
		$ifupdateexam  = $this->teacher->update($data, $whereupdate ,'examination');
		$wheredel = "WHERE `id` = $postid" ;
		$ifdelete = $this->teacher->delete($wheredel,'papercategory');
		if($ifupdateexam && $ifupdatepaper && $ifdelete) {
			echo 'yes';
		}
		else 
		{
			echo 'no';
		}
		die();
		if(!empty($_POST['id'])) {
			$post_id = $_POST['id'];
			$result = $this->paper->deletecategory($post_id);
			if($result) echo 'yes';
			else echo 'no';
		}else {
			echo 'no';
		}
	}



}
