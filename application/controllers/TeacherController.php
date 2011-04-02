<?php
require_once 'Zend/Controller/Action.php';
/**
 * 
 * 教师控制类,包含普通教师、系主任和管理员
 * @author Jac,wepeng
 * 
 */
class TeacherController extends Zend_Controller_Action
{   
 
	function init()
	{
		Zend_Loader::loadClass('Teacher',realpath(dirname(__FILE__) . '/../models'));
		Zend_Loader::loadClass('System',realpath(dirname(__FILE__) . '/../models'));
		Zend_Loader::loadClass('Examination',realpath(dirname(__FILE__) . '/../models'));
		$this->sys = new System();
		$this->teacher = new Teacher();
		$this->examSession = new Zend_Session_Namespace('examSession');
		$this->examination = new Examination();
		$this->view->showlist = file_get_contents("../application/views/scripts/teacher/teacher".$this->examSession->level_id.".phtml");
	}
	
	function indexAction()
	{
		$this->sys->checkLogined();
	}
	
	function loginAction()
	{
		if(!($this->examSession->username && $this->examSession->password))
		{
			if(isset($_POST['username']) && isset($_POST['password']))
			{
				$result = $this->sys->login($_POST['username'], $_POST['password'], 'teacher');
				if($result)
				{
					$this->examSession->username = $_POST['username'];
					$this->examSession->password = $_POST['password'];
					$this->examSession->teacher_id = $result[0]['id'];
					$this->examSession->name = $result[0]['name'];
					$this->examSession->level_id = $result[0]['level_id'];
					$this->examSession->action = 'teacher';
				}	
			}
		}
		
		header('Location: ./');
	}
	
	/**
	 * 
	 * 设置考试
	 */
	function setexamAction()
	{	
		$this->sys->checkLogined();
		

		//显示试卷所有分类名
		$result = $this->examination->getPaperCategory();
		$categoryList = "";
		if(count($result)>0)
		{
			$this->view->categoryList = $result;
		}
		//查看试卷分类
		if(isset($_POST['category_id']))
		{
			$paperList = $this->examination->getPaperListByCategory($_POST['category_id']);
			if(is_array($paperList))
			{
				foreach($paperList as $value)
				{
					echo "<a href=\"JavaScript:setPaperName('".$value['title']."','".$value['id']."')\">".$value['title']."</a><br/>";
				}
			}
			exit;
		}
		//搜索试卷
		if(isset($_POST['searchByName']))
		{
			$searchPaperList = $this->examination->searchPaper($_POST['searchByName']);
			if(!is_array($searchPaperList))
			{
				echo  "没有找到!";
			}
			else 
			{
				foreach($searchPaperList as $value) 
				{
					echo "<a href=\"JavaScript:setPaperName('".$value['title']."','".$value['id']."')\">".$value['title']."</a><br/>";
				}
			}
			exit;
		}
	
		//显示教师管理的班级
		$classList = $this->examination->getClassOfTeacher($this->examSession->teacher_id);
		$this->view->showClassList = $classList;
		
		//提交考试设置数据
		if(isset($_POST['paperId']) && isset($_POST['paperCategoryID']) )
		{
			$paper_name = $_POST['paperName'];
			$paper_id = $_POST['paperId'];
			$category_id = $_POST['paperCategoryID'];
			$rejectStus = "";
			if(isset($_POST['rejectStus']))
				$rejectStus = $_POST['rejectStus'];
			$otherStus = "";
			if(isset($_POST['otherStus']))
				$otherStus = $_POST['otherStus'];
			$startTime = $_POST['startTime'];
			$endTime = $_POST['endTime'];
			$class_ids = "";
			if(isset($_POST['class_id']))
			{
				$class_ids = $_POST['class_id'];
			}
			echo "<div>";
			echo "试卷名：".$paper_name."<br/>";
			echo "类别：".$category_id."<br/>";
			if(isset($_POST['class_id']))
			{
				foreach ($_POST['class_id'] as $value)
				{
					echo "班级：".$value."<br/>";
				}
			}
			echo "排除的学生：".$rejectStus."<br/>";
			echo "另外允许的学生：".$otherStus."<br/>";
			echo "开始时间：".$startTime."<br/>";
			echo "结束时间：".$endTime."<br/>";
			echo "</div>";
			
			$this->examination->saveExamSetData($paper_id, $paper_name, $category_id, $startTime, $endTime, $class_ids, $rejectStus, $otherStus);
			
		}
	}
	
	/**
	 * 
	 * 设置重考
	 */
	function setreexamAction()
	{	
		$this->sys->checkLogined();
		
		$result = $this->examination->getRecentlyExam();
		$this->view->getRecentlyExamList = $result;
		
		if(isset($_GET['exam_id']))
		{
			$paperParts = $this->examination->getPaperParts($_GET['exam_id']);
			if(is_array($paperParts))
			{
				foreach($paperParts as $value)
				{
					echo "&nbsp;&nbsp;<input name='parts[]' type=\"checkbox\" value='".$value['id']."' />".$value['name'];
				}
			}
			exit;
		}
		
		if(isset($_POST['studentNums']) && isset($_POST['examId']) && isset($_POST['parts']))
		{
			$exam_id = $_POST['examId'];
			$parts = "";
			foreach($_POST['parts'] as $value)
			{
				$parts .= $value."#";
			}
			$parts = substr($parts, 0, strlen($parts)-1);
			$studentNums = $_POST['studentNums'];
			$this->examination->saveReExamSetData($exam_id, $parts, $studentNums, $this->examSession->teacher_id);
			
			echo "添加成功。";
		}
	}
	
	/**
	 * 
	 * 管理系主任
	 */
	function manageleaderAction()
	{
		if(isset($_POST['leaderName']))
		{
			$result = $this->teacher->searchLeader($_POST['leaderName']);
			
			if(count($result)>0)
			{
				$this->view->leaderList = $result;
			}
			else
			{
				$this->view->leaderList = "没有找到。";
			}
		}
		/*elseif(isset($_POST['addLeader'])){
			
		}*/
		else 
		{
			$result = $this->teacher->getLeaderList();
			if(count($result)>0)
			{
				$this->view->leaderList = $result;
			}
			else
			{
				$this->view->leaderList = "没有系主任！";
			}
		}
		
		
	}
	
	/**
	 * 
	 * 上传试题
	 */
	function addexamAction()
	{
		if(isset($_POST['partType']))
		{
			switch ($_POST['partType'])
			{
				//写作
				case 'writing':
					if(isset($_POST['writing']) && isset($_POST['writing_answer']) )
					{				
						$this->examination->insertSelOrFill('fillblank', $this->examination->addFlag('writing', 
						$_POST['writing']), $_POST['writing_answer'], false, 'writing', $this->examSession->teacher_id);
					}
					break;
				
				//快速阅读
				case 'fastReading':
					if(isset($_POST['editor1']) && isset($_POST['startNum']) && isset($_POST['endNum']) 
						&& isset($_POST['answers']))
					{		
						$content = $this->examination->readingPaper($_POST['editor1'], $_POST['fendNum'], $_POST['startNum']);
						$content = addslashes($content);  //转义
						$answers = $this->examination->linkAnswer($_POST['answers']);
						$this->examination->insertSelOrFill('selection', $this->examination->addFlag('fastReading', $content), $answers, false, 'fastReading', $this->examSession->teacher_id);
					}
					break;

				//听力听写
				case 'dictation':
					if(isset($_POST['editor1']) && isset($_POST['startNum']) && isset($_POST['endNum']) 
						&& isset($_POST['answers']))
					{		
						$content = $this->examination->fillblankPaper($_POST['editor1']);
						$content = addslashes($content);  //转义
						$answers = $this->examination->linkAnswer($_POST['answers']);
						$this->examination->insertSelOrFill('fillblank', $this->examination->addFlag('dictation', $content), $answers, false, 'dictation', $this->examSession->teacher_id);
					}
					break;
				
				//听力短对话	
				case 'shortListening':
					if(isset($_POST['editor1']) && isset($_POST['startNum']) && isset($_POST['endNum']) 
						&& isset($_POST['answers']) && isset($_FILES['audio']) )
					{
						$content = $this->examination->readingPaper($_POST['editor1'], $_POST['endNum'], $_POST['startNum']);
						$content = addslashes($content);  //转义
						$answers = $this->examination->linkAnswer($_POST['answers']);
						$newAudioName = $this->examination->saveAudioFile($_FILES['audio'], $this->examSession->teacher_id);
						$this->examination->insertSelOrFill('selection', $this->examination->addFlag('shortListening', $content), $answers, TRUE, 'shortListening', $this->examSession->teacher_id,$newAudioName);
					}
					break;
					
				//听力长对话或短文	
				case 'longListening':
					if(isset($_POST['editor1']) && isset($_POST['startNum']) && isset($_POST['endNum']) 
						&& isset($_POST['answers']) && isset($_FILES['audio']) )
					{
						$content = $this->examination->readingPaper($_POST['editor1'], $_POST['endNum'], $_POST['startNum']);
						$content = addslashes($content);  //转义
						$answers = $this->examination->linkAnswer($_POST['answers']);
						$newAudioName = $this->examination->saveAudioFile($_FILES['audio'], $this->examSession->teacher_id);
						$this->examination->insertSelOrFill('selection', $this->examination->addFlag('longListening', $content), $answers, TRUE, 'longListening', $this->examSession->teacher_id,$newAudioName);
					}
					break;
				
				//阅读
				case 'reading':
					if(isset($_POST['editor1']) && isset($_POST['startNum']) && isset($_POST['endNum']) 
						&& isset($_POST['answers']))
					{		
						$content = $this->examination->readingPaper($_POST['editor1'], $_POST['endNum'], $_POST['startNum']);		
						$content = addslashes($content);  //转义
						$answers = $this->examination->linkAnswer($_POST['answers']);
						$this->examination->insertSelOrFill('selection', $this->examination->addFlag('reading', $content), $answers, false, 'reading', $this->examSession->teacher_id);
					}
					break;
					
				//完形填空
				case 'cloze':
					if(isset($_POST['editor1']) && isset($_POST['startNum']) && isset($_POST['endNum']) 
						&& isset($_POST['answers']))
					{		
						$content = $this->examination->clozePaper($_POST['editor1'], $_POST['endNum'], $_POST['startNum']);
						$content = addslashes($content);  //转义
						$answers = $this->examination->linkAnswer($_POST['answers']);
						$this->examination->insertSelOrFill('selection', $this->examination->addFlag('cloze', $content), $answers, false, 'cloze', $this->examSession->teacher_id);
					}
					break;

				//翻译
				case 'translation':
					if(isset($_POST['editor1']) && isset($_POST['startNum']) && isset($_POST['endNum']) 
						&& isset($_POST['answers']))
					{		
						$content = $this->examination->fillblankPaper($_POST['editor1']);
						$content = addslashes($content);  //转义
						$answers = $this->examination->linkAnswer($_POST['answers']);
						$this->examination->insertSelOrFill('selection', $this->examination->addFlag('translation', $content), $answers, false, 'translation', $this->examSession->teacher_id);
					}
					break;
			}
			echo "上传成功";
		}
		//更新显示已上传部分的名称
		$temporaryRart = $this->examination->getTemporaryRart($this->examSession->teacher_id); 			
		if(count($temporaryRart)>0)
		{
			$this->view->temporaryRartList = $temporaryRart;
		}
	}
	
	/**
	 * 
	 * 上传试题预览
	 */
	function previewAction()
	{	
		exit;
	}
	
	/**
	 * 
	 * 编辑上传的试题分页
	 */
	function editupexamAction()
	{
		$this->view->showPaperCategory = $this->examination->getPaperCategory();  //试卷类别
		
		$temporaryPart = $this->examination->getTemporaryRart($this->examSession->teacher_id);
		$this->view->temporaryPartList = $temporaryPart;
		
		if(isset($_POST['pageIndex']))
		{
			$paper_id = $this->examination->insertPaper($_POST['title'], $_POST['paperCategoryId']);
			foreach ($_POST['pageIndex'] as $value)
			{
				$this->examination->insertPart($value, $paper_id, NULL,NULL, NULL);
			}
			echo "上传试卷成功";
		}
	}
	
	/**
	 * 
	 * 搜索学生
	 */
	function searchstudentAction()
	{
		if(isset($_POST['value']) && isset($_POST['key']))
		{
			$result = $this->teacher->searchStudentInfo($_POST['value'], $_POST['key']);
			if (!$result)
			{
				echo "没有搜索到您输入的关键字,请确认关键字是有效的";
			}
			else
			{
				foreach($result as $value){
				 	echo "学号：".$value['username']." 姓名：".$value['name']." 性别："
				 		.$value['sex']." 密码：".$value['password'];
				}
			}
			exit;
		}
	}
	
	/**
	 * 
	 * 添加学生
	 */
	function addstudentAction()
	{
			
		if(isset($_POST['username']) && isset($_POST['name']) 
				&& isset($_POST['sex']) && isset($_POST['password']))
		{
			$result = $this->teacher->addstudent
									($_POST['username'], $_POST['name'], $_POST['sex'], $_POST['password']);
			if(!$result)
			{
				echo $_POST['name']."添加失败";
			}
			else echo $_POST['name']."添加成功";
		exit;
		}	
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
	//login-qin
	function manageteacherAction()
	{
		$this->sys->checkLogined();
		//	$result = $this->teacher->getTeacher();
		//	if(is_array($result)) {
		//		$this->view->result = $result;
		//	}

		if(isset($_POST['Name']))
		{
			$result = $this->teacher->searchTeacher($_POST['Name']);
			if(count($result) > 0)
			{
				$this->view->teacherlist = $result;
			}
			else
			{
				$this->view->teacherlist = "没有找到。";
			}
		}
		else 
		{
			$result = $this->teacher->getTeacher();
			if(count($result) > 0)
			{
				$this->view->teacherlist = $result;
			}
			else
			{
				$this->view->teacherlist = "没有教师！";
			}
		}
	}

	function managestudentAction() 
	{
		$controlclasses = array(); 
		$students = array();
		if(isset($this->examSession->level_id) && isset($this->examSession->teacher_id)) 
		{ 
			$level_id = $this->examSession->level_id;
			$teacher_id = $this->examSession->teacher_id;
		}
		else 
		{
			header('Loacation:../');
			exit();
		}
		$controlclasses =  $this->teacher->getClass($teacher_id, $level_id); //根据等级获取教师可控班级
		$this->view->classes = $controlclasses;
		$this->showstudenttablelistAction($controlclasses);

	}

	function showstudenttablelistAction() 
	{
		if(func_num_args() > 0) $class = func_get_arg(0); //如果调用该函数有参数传递，赋值给$class
		if(empty($_POST)) //没有Ajax传来的参数，则显示第一个班级信息
		{
			if(is_array($class))
			{
				$students = $this->teacher->getStudentByClassId($class[0]['id']); //根据页面传来班级参数获取学生
				$this->view->classname = $class[0]['class_name'];
			}
			else 
			{
				$student = array();
			}
			$this->view->result = $students;
		} 
		else //if has POST	
		{
			if(is_numeric($_POST['classid']))
		   	{
				$students = $this->teacher->getStudentByClassId($_POST['classid']);
				$this->view->classname = $_POST['classname'];
				$this->view->result = $students;
			}
			else 
			{
				echo '你丫，想蒙我，你传的参数根本不对！';
			}

		}
	}

	function resetpwAction() {
		switch ($_POST['type'])
		{ 
		case 's': //修改学生密码为空
			if($this->sys->resetPassword($_POST['username'], "123", 'student'))
		   	{
				echo '成功设置'.$_POST['username'].'密码为123。';
			}
			else 
			{
				echo '修改失败！';
			}
			break;
		case 't'://修改教师密码为空
			if($this->sys->resetPassword($_POST['username'], "123", 'teacher'))
			{
				echo '成功设置'.$_POST['username'].'密码为123。';
			}
			else
			{
				echo '修改失败';
			}

			break;
		}
	}
	function deletepersonAction() {
		switch ($_POST['type'])
		{ 
		case 's': //修改学生密码为空
			if($this->sys->deleteperson($_POST['username'], 'student'))
			{
				echo '成功删除'.$_POST['username'];
			}
			else 
			{
				echo '删除失败！';
			}
			break;
		case 't'://修改教师密码为空
			if($this->sys->deleteperon($_POST['username'], 'teacher'))
			{
				echo '成功删除'.$_POST['username'];
			}
			else
			{
				echo '删除失败';
			}

			break;
		}
	}
}
