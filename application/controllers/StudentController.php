<?php
require_once 'Zend/Controller/Action.php';
/**
 * 
 * 学生控制类
 * @author Jac,wepeng
 * 
 */
class StudentController extends Zend_Controller_Action
{
	/**
	 * (non-PHPdoc)
	 * @see Zend_Controller_Action::init()
	 */
	function init()
	{
		Zend_Loader::loadClass('Student',realpath(dirname(__FILE__) . '/../models'));	
		Zend_Loader::loadClass('System',realpath(dirname(__FILE__) . '/../models'));
		Zend_Loader::loadClass('Examination',realpath(dirname(__FILE__) . '/../models'));
		$this->sys = new System();
		$this->examSession = new Zend_Session_Namespace('examSession');
		$this->examination = new Examination();
	}
	
	
	/**
	 * 
	 * 学生首页
	 */
	function indexAction()
	{
		$this->sys->checkLogined();
	}
	
	/**
	 * 
	 * 学生登录函数
	 */
	function loginAction()
	{
		if(!($this->examSession->username && $this->examSession->password))
		{
			if(isset($_POST['username']) && isset($_POST['password']))
			{
				$result = $this->sys->login($_POST['username'], $_POST['password'], 'student');
				if($result)
				{
					$this->examSession->username = $_POST['username'];
					$this->examSession->password = $_POST['password'];
					$this->examSession->student_id = $result[0]['id'];
					$this->examSession->name = $result[0]['name'];
					$this->examSession->action = 'student';
				}	
			}
		}
		
		header('Location: ./');
	}

	/**
	 * 
	 * 修改学生密码
	 */
	function resetpasswordAction()
	{
		$this->sys->checkLogined();
					
		$this->view->username = $this->examSession->username;
		if(isset($_POST['newpassword']) && !empty($_POST['newpassword']))
		{
			if($this->examSession->password == $_POST['password'])
			{			
				$this->sys->resetPassword($this->examSession->username, $_POST['newpassword'], 'student');
				$this->view->text = '修改密码成功。';
			}
			else 
			{
				$this->view->text = '您的旧密码不正确！';
			}
		}
	}

	
	/**
	 * 
	 * 显示将要进行的考试
	 */
	function showexamtimeAction()
	{
		$result = $this->examination->showExamTime($this->examSession->student_id); 
		if(count($result)>0)
			$this->view->result = $result;
		else 
			$this->view->result = '没有将要进行的考试';
	}
	
	/**
	 * 
	 * 显示已考的试题
	 */
	function showexamrecordAction()
	{
		$result = $this->examination->showExamRecord($this->examSession->student_id);
		if(count($result)>0)
			$this->view->result = $result;
		else 
			$this->view->result = '没有已考记录';
	}
	
	/**
	 * 
	 * 进行考试
	 */
	function doexamAction()
	{	
		if(!$this->examSession->examStep)
		{
			$this->examSession->examStep = 1;
			$temp = array(1,2,3,4);
			shuffle($temp);
			$this->view->examfile = Zend_Registry::get('INDEX_FILE')."\\exam\\".$_GET['paper_id']."_".$this->examSession->examStep."_".$temp[0].".html";	

			$this->examSession->examination_id = $_GET['examination_id'];
			if(!$this->examination->canDoExamOnce($this->examSession->examination_id, $this->examSession->student_id)){
				header("Location: ./");
			}
		}			
		elseif(isset($_POST['submit']))
		{
			if(isset($_GET['paper_id']))
			{
				//存储答案
				$post_flag = true;
				$answer = '<part:';
				foreach($_POST as $key => $value )
				{
					if(strpos( $key, ':exam:')!== false)
					{
						if($post_flag)
						{
							$answer = $answer.substr($key, strpos( $key, ':exam:')+6, strlen($key)-strpos($key, ':exam:')).'>';
							if(is_array($value))
							{
								foreach ($value as $key2 => $value2)
								{
									$answer = $answer.$value2."#";
								}
							}
							else 
							{
								$answer = $answer.$value;
							}
							$post_flag = false;
						}
						else 
						{
							if(is_array($value))
							{
								foreach ($value as $key2 => $value2)
								{
									$answer = $answer.$value2."#";
								}
							}
							else 
							{
								$answer = $answer.$value.'#';
							}
						}
					}
				}
				$answer = substr($answer, 0, strlen($answer)-1).'</part>';
				$this->examination->saveStuAnswers($this->examSession->student_id, $this->examSession->examination_id, $answer);

				$this->examSession->examStep++;
				$temp = array(1,2,3,4);
				shuffle($temp);
				$this->view->examfile = Zend_Registry::get('INDEX_FILE')."\\exam\\".$_GET['paper_id']."_".$this->examSession->examStep."_".$temp[0].".html";
				if(!file_exists($this->view->examfile))
				{
					unset($this->examSession->examStep);
					unset($this->examSession->examination_id);
					header("Location: ./doexamend");	
				}
			}
			else 
			{
				unset($this->examSession->examStep);
				header("Location: ./");
			}
			
		}
		else 
		{
			unset($this->examSession->examStep);
			header("Location: ./");
		}
	}
	
	function doexamendAction()
	{
		if(isset($_GET['paper_id']))
		{
			
		}
	}
	
	function reexamAction()
	{
		$result = $this->examination->getReExam($this->examSession->student_id);
		if(is_array($result))
			$this->view->result = $result;
		else 
			$this->view->result = "您没有需要重考的试卷";
	}
	
	function doreexamAction()
	{
		if(isset($_GET['paper_id']) )
		{
			if(!$this->examSession->examStep)
			{
				$result = $this->examination->getReExamParts($_GET['examination_id'], $this->examSession->student_id);
				if(is_array($result))
				{
					if(strpos($result[0]['parts'], ',')){
						$this->examSession->examStep = substr($result[0]['parts'], 0, strpos($result[0]['parts'], ','));
						$this->examSession->examSteps = substr($result[0]['parts'], strpos($result[0]['parts'], ','));
					}
					else 
					{
						$this->examSession->examStep = $result[0]['parts'];
					}
					$temp = array(1,2,3,4);
					shuffle($temp);
					$this->view->examfile = Zend_Registry::get('INDEX_FILE')."\\exam\\".$_GET['paper_id']."_".$this->examSession->examStep."_".$temp[0].".html";
					$this->examination->saveReExamData($_GET['examination_id'], $this->examSession->student_id);
				}
				else
				{
					header("Location: ../");
				}
			}
			else 
			{
				if(!$this->examSession->examSteps)
				{
					unset($this->examSession->examStep);
					header("Location: ./doexamend");
				}
				$this->examSession->examStep = substr($this->examSession->examSteps, 0, strpos($this->examSession->examSteps, ','));
				if(strpos($examSession->examSteps, ','))
				{
					$this->examSession->examSteps = substr($this->examSession->examSteps, strpos($this->examSession->examSteps, ','));
				}
				else
				{
					unset($this->examSession->examSteps);
				}
				$temp = array(1,2,3,4);
				shuffle($temp);
				$this->view->examfile = Zend_Registry::get('INDEX_FILE')."\\exam\\".$_GET['paper_id']."_".$this->examSession->examStep."_".$temp[0].".html";
			}
		}
	}
	
	function showpaperandanswerAction()
	{
		$this->view->tpaper = $_GET['paper_id']."_1_1.html";
	}
	
	/**
	 * 
	 * 退出
	 */
	function quitAction()
	{
		$this->examSession->unsetAll();
		header('Location: ../');
	}	
}
