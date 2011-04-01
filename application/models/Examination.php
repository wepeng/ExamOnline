<?php

class Examination extends Zend_Db
{
	protected $db;
	/**
	 * 
	 * Enter description here ...
	 * @param int $student_id
	 * @return array $result
	 */
	public function __construct()
	{
		$this->db = Zend_Registry::get('db');
	}
	
	/**
	 * 
	 * 显示该学生将要进行的考试
	 * @param unknown_type $student_id
	 */
	function showExamTime($student_id) {
	
		/**
		 * Actor: Qinwei 2011/3/27
		 * SQL解释：也可以拆分UNION分别执行再将结果集合并
		 * UNION 语句前：按学生ID查询出其班级的考试信息，并且排除掉已考和被限制而不能考试的学生
		 * UNION 语句后：按学生ID查询出非本班但可以参考学生的考试信息，并排除掉已考和被限制考试的学生
		 * 最后将两个结果集合并返回。
		 *
		 */
		$sql = "SELECT e.id, e.paper_id, e.name, e.startTime, e.endTime, pc.name pcategory_name
			FROM examination e, class_student cs, examination_class ec,
			papercategory pc
			WHERE UNIX_TIMESTAMP(e.endTime) > UNIX_TIMESTAMP(NOW()) 
			AND e.id=ec.examination_id
			AND ec.class_id=cs.class_id
			AND e.category_id=pc.id
			AND cs.student_id='".$student_id."'
			AND e.id NOT IN (SELECT examination_id FROM examed) 
			AND e.id NOT IN (SELECT es2.examination_id FROM examination_student es2
			WHERE es2.qualification='0') 
		UNION
		(
			SELECT e2.id, e2.paper_id, e2.name, e2.startTime, e2.endTime, pc2.name  pcategory_name
			FROM examination e2 ,examination_student es3, papercategory pc2
			WHERE e2.id=es3.examination_id 
			AND es3.qualification='1' 
			AND es3.student_id='".$student_id."' 
			AND  UNIX_TIMESTAMP(e2.endTime) > UNIX_TIMESTAMP(NOW()) 
			AND e2.id NOT IN (SELECT examination_id FROM examed) 
			AND e2.category_id=pc2.id 
		)";
		$result = $this->db->query($sql)->fetchAll();
		return $result;
	
	}
	
	/**
	 * 
	 * 显示该学生已考记录
	 * @param unknown_type $student_id
	 */
	function showExamRecord($student_id) {
		// 改掉time()函数，而使用数据库时间。
		$sql = "SELECT DISTINCT  paper_id,name,startTime,endTime,category_id 
			FROM examination e,class_student c ,examination_class ec,examed 
			WHERE (UNIX_TIMESTAMP(e.endTime) < UNIX_TIMESTAMP(NOW()) OR  (examed.examination_id=e.id 
			AND examed.student_id='".$student_id."'))
			AND e.id=ec.examination_id 
			AND ec.class_id=c.class_id 
			AND c.student_id='".$student_id."' ";
		$result = $this->db->query($sql)->fetchAll();
		return $result;
	}
	
	/**
	 * 
	 * 获取该学生将要进行的重考
	 * @param unknown_type $student_id
	 */
	public function getReExam($student_id)
	{
		$sql = "select examination_id,name,paper_id,parts,time from examination as e,reexamination as re
				where e.id=re.examination_id and re.student_id='".$student_id."'";
		$result = $this->db->query($sql)->fetchAll();
		return $result;
	}
	
	public function canDoExam()
	{
		
	}
	
	/**
	 * 
	 * 设置该学生对此考试只能考一次
	 * @param unknown_type $examination_id
	 * @param unknown_type $student_id
	 */
	public function canDoExamOnce($examination_id, $student_id)
	{
		$sql = "select examination_id from examed 
				where examination_id='".$examination_id."' and student_id='".$student_id."'";
		if(count($this->db->query($sql)->fetchAll())>0)
		{
			
			return false;
		}
		$sql = "insert into examed values ('".$examination_id."','".$student_id."')";
		$this->db->query($sql);
		return true;
	}
	
	public function getReExamParts($examination_id, $student_id)
	{
		$sql = "select parts from reexamination 
				where examination_id='".$examination_id."' and student_id='".$student_id."'"; 
		return $this->db->query($sql)->fetchAll();
	}
	
	public function saveReExamData($examination_id, $student_id)
	{
		$sql = "insert into savereexamination select * from reexamination where examination_id='".$examination_id."' and student_id='".$student_id."'";
		if($this->db->query($sql))
		{
			$sql = "delete from reexamination where examination_id='".$examination_id."' and student_id='".$student_id."'";
			if(!$this->db->query($sql))
			{
				return false;
			}
		}
		else
		{
			return false;
		}
		return true;
	}
	
	public function getPaperCategory()
	{
		$sql = "select * from papercategory";
		$result = $this->db->query($sql)->fetchAll();
		if(count($result)>0)
		{
			return $result;
		}
		return NULL;
	}
	
	/**
	 * 
	 * 获取最近进行的考试
	 */
	public function getRecentlyExam()
	{
		//最近进行的50场考试
		$sql = "select * from examination order by id DESC limit 50";
		$result = $this->db->query($sql)->fetchAll();
		
		if(count($result)>0)
		{
			return $result;
		}
		return NULL;	
	}	
	
	/**
	 * 
	 * 按类别获取试卷列表
	 * @param int $category_id
	 * @return Array|NULL
	 */
	public function getPaperListByCategory($category_id)
	{
		//分类搜索最近录入的100条	
		$sql = "select * from paper where category_id='".$category_id."' order by id desc limit 100";
		$result = $this->db->query($sql)->fetchAll();
		if(count($result)>0)
		{
			return $result;
		}
		return NULL;	
	}
	
	/**
	 * 
	 * 
	 * 按标题搜索试卷
	 * @param string $title
	 * @return Array|NULL
	 */
	public function searchPaper($title)
	{
		$sql = "select * from paper where title='".$title."'";
		$result = $this->db->query($sql)->fetchAll();
		if(count($result)>0)
		{
			return $result;
		}
		return NULL;
	}
	
	/**
	 * 
	 * 获取试卷的各个部分
	 * @param unknown_type $paper_id
	 * @return Array|NULL
	 */
	public function getPaperParts($exam_id)
	{
		$sql = "select id,name from part where id in(
				select part_id from paper_part where paper_id in (
					select paper_id from examination where id='".$exam_id."'))";
		$result = $this->db->query($sql)->fetchAll();
		if(count($result)>0)
		{
			return $result;
		}
		return NULL;
	}
	
	/**
	 * 
	 * 获取教师管理的班级
	 * @param unknown_type $teacher_id
	 * @return Array|NULL
	 */
	public function getClassOfTeacher($teacher_id)
	{
		$sql = "select id,class_name from class where teacher_id='".$teacher_id."'";
		$result = $this->db->query($sql)->fetchAll();
		if(count($result)>0)
		{
			return $result;
		}
		return NULL;
	}
	
	/**
	 * 保存考试设置数据
	 */
	public function saveExamSetData($paper_id,$paper_name,$category_id,$startTime,$endTime,$class_ids,$rejectStus,$otherStus)
	{
		//添加一场考试
		$sql = "insert into examination(paper_id,name,startTime,endTime,category_id)
				values('".$paper_id."','".$paper_name."','".$startTime."','".$endTime."','".$category_id."')";
		$this->db->query($sql);
		$lastExamId = $this->db->lastInsertId();
		
		//添加可以参加考试的班级
		if($class_ids)
		{	
			foreach($class_ids as $class_id)
			{
				$sql = "insert into examination_class(examination_id,class_id) 
						values('".$lastExamId."','".$class_id."')";
				$this->db->query($sql);
			}
		}
		
		
		//添加排除的学生
		if($rejectStus != "")
		{
			$rejectStus =str_replace('，', ',', $rejectStus);
			$rejects = explode(',', $rejectStus);
			if(count($rejects)>0)
			{
				foreach($rejects as $value)
				{
					$sql = "insert into examination_student(examination_id,student_id,qualification)
							values('".$lastExamId."', (select id from student where username='".$value."'), '0')";
					$this->db->query($sql);
				}
			}
		}

		//添加其他可以参加此考试的学生
		if($otherStus != "")
		{
			$otherStus =str_replace('，', ',', $otherStus);
			$others = explode(',', $otherStus);	
			if(count($others)>0)
			{
				foreach($others as $value)
				{
					$sql = "insert into examination_student(examination_id,student_id,qualification)
							values('".$lastExamId."', (select id from student where username='".$value."'), '1')";
					$this->db->query($sql);
				}
			}
		}
		
		
	}

	/**
	 * 
	 * 保存重考设置
	 * @param unknown_type $exam_id
	 * @param unknown_type $parts
	 * @param unknown_type $studentNums
	 * @param unknown_type $teacher_id
	 */
	public function saveReExamSetData($exam_id,$parts,$studentNums,$teacher_id)
	{
		$studentNums = str_replace('，', ',', $studentNums);
		$stuNums = explode(',',$studentNums);
		foreach($stuNums as $value)
		{
			$sql = "insert into reexamination(examination_id,student_id,parts,teacher_id) 
					values ('".$exam_id."','".$value."','".$parts."','".$teacher_id."')";
			$this->db->query($sql);
		}
	}
	
	/**
	*输入一个小题（最小题目单元），分解出题目与选项，在数组a中保存.a[4] to a[0]为题目+A)+B)+C)+D)
	*在题目前后分别添加标识符<eo:question></eo:question>
	*若是填空题，在前后添加标识符<eo:fillblank></eo:fillblank>
	*若是选择题在选项前后分别添加标识符<eo:question></eo:question>
	*然后合并 返回一个字符串
	*/
    public function selectPaper($question)
	{
		for($i='4';$i>='0';$i--)
		{
			/*
			*数组最末储存题目
			*/
			if($i==0)								
			{
				$question=substr($question,strpos($question,'.')+1);
				$t[]="<eo:question>".$question."</eo:question>"; 
			}
			/*
			*若')'符号出现次数小于4，则可判断为填空题
			*/
			else if( $i==4 && substr_count($question,')')<3)		
			{
				$t[]="<eo:fillblank>".ereg_replace('[_+]{2,7}','<eo:blank>',substr($question,strpos($question,'.')+1))."</eo:fillblank>";   break;
			}
			/*选择题*/
			else
			{	
				$p=strrpos($question,')');
				$t[]="<eo:selection>".substr($question,$p-1)."</eo:selection>";
				$question=substr($question,0,$p-1);
			}
		}
		$str="";
		for($j=count($t)-1;$j>=0;$j--)
		{
			$str=$str.$t[$j]; 
		}
			 
		return $str;
	}
	
	/**
	 * 
	 * 处理填空题
	 * @param unknown_type $text
	 */
	function fillblankPaper($text)
	{
		$str=ereg_replace('[_+]{2,77}','<eo:blank>',$text);
		$str=ereg_replace('[((0-9*).)]','',$str);
		return $str;
	}
	
	function clozeLink($text)
	{
		$text = eregi_replace("_.[0-9]+._", "<eo:blank>", $text);
		return $text;
	}
	
	function clozePaper($text, $max, $min){
		/*代替数字*/
		$middleNum=$max;
		
		for($i=$max; $i>=$min; $i--)
		{
			$text=str_replace("$i","^$i",$text);
		}
		$text=str_replace("^^","^",$text);
		$a=explode("^",$text);
		$d1=count($a)-1;
		

		do{
			$d2=$d1-1;
			$arr=array($a[$d2],$a[$d1]);
			static $direction=0;
			/*判断，若第三点不为 '.' 或者 找不到'.' 或者 '.'后为数字（还可加'.'前数字上下文大小比较）
			* 3个条件均为false时基本可以判断此为一条题目
			*有一个条件为true时把此段字符串与下一个判断的字符串结合
			*/
			if((strpos($a[$d1],'.')>=3  ||  !strpos($a[$d1],'.')  ||  $a[$d1][(strpos($a[$d1],'.')+1)] !="A" ))//== '[0-9]')
			{     
				$direction = $a[$d2] = implode("",$arr);
			}
			else if (substr($a[$d1],0,strpos($a[$d1],"."))!=$middleNum)
				{$direction = $a[$d2] = implode("",$arr);}
			else {
				$f[] = $this->selectPaper($a[$d1]);
				$direction = $a[$d2];
				$middleNum--;
			}
			$d1=$d1-1;
			
		}while($d1!=0);
		$f[]=$this->clozeLink($direction);
		
		
		$numf=count($f)-1;
		$f[$numf]="<es:content>".$f[$numf]."</eo:content>";
		
		$str = "";
		for($i=$numf;$i>=0;$i--){
			$str .= $f[$i];
		}
		return $str;
	}
	/**
	 * 
	 * 处理阅读题字符串
	 * @param unknown_type $text
	 * @param unknown_type $startNum
	 * @param unknown_type $endNum
	 */
	function readingPaper($text, $max, $min){
		/*代替数字*/
		$middleNum=$max;
		
		for($i=$max; $i>=$min; $i--)
		{
			$text=str_replace($i,"^".$i,$text);
		}
		$text=str_replace("^^","^",$text);
		$a=explode("^",$text);
		$d1=count($a)-1;
		
		if($d1>0){
				do{
					$d2=$d1-1;
					$arr=array($a[$d2],$a[$d1]);
					static $direction=0;			
					/*判断，若第三点不为 '.' 或者 找不到'.' 或者 '.'后为数字（还可加'.'前数字上下文大小比较）
					* 3个条件均为false时基本可以判断此为一条题目
					*有一个条件为true时把此段字符串与下一个判断的字符串结合
					*/
					if(  (strpos($a[$d1],'.')>=3)  ||  (!strpos($a[$d1],'.')) 
						//||  (!ereg('^[A-Z]',substr($a[$d1],strpos($a[$d1],'.')+1)) )
						|| ( ($a[$d1][(strpos($a[$d1],'.')+1)] !="&")  &&  ($a[$d1][(strpos($a[$d1],'.')+1)] !="<")  
							&&  ($a[$d1][(strpos($a[$d1],'.')+1)] !=" " ) &&(!ereg('^[A-Z]',substr($a[$d1],strpos($a[$d1],'.')+1)) ))
					  )
					{     
						$direction = $a[$d2] = implode("",$arr);
					}
					else if ( substr($a[$d1],0,strpos($a[$d1],"."))!=$middleNum )
						{$direction = $a[$d2] = implode("",$arr);}
					else {
						$f[] = "<eo:question>".$this->selectPaper($a[$d1])."</eo:question>";
						$direction = $a[$d2];
						$middleNum--;
					}
					$d1=$d1-1;
					
				}while($d1!=0);
				$f[]=$direction;
				
				$numf=count($f)-1;
				$f[$numf]="<es:content>".$f[$numf]."</eo:content>";
				
				$str = "";
				for($i=$numf;$i>=0;$i--){
					$str .= $f[$i];
				}
				
				return $str;
		}
		else return NULL;
	}
	
	/**
	 * 
	 * 将标记的字符串转成数组 
	 * @param unknown_type $str
	 */
	public function strtoarray($str)
	{
		$arr=explode('<eo:question>',$str);
		$i = 0;
		foreach($arr as $value)
		{
			$arr[$i]=explode('<eo:selection>',$value);
			$i++;
		}
		return $arr;	
	}
	
	/**
	 * 
	 * 插入选择题
	 * @param unknown_type $content
	 * @param unknown_type $answer
	 * @param unknown_type $hasAudio
	 * @param unknown_type $name
	 * @param unknown_type $teacher_id
	 */
	public function insertSelOrFill($type,$content,$answer,$hasAudio,$name,$teacher_id,$audio=NULL)
	{	
		//查询某个部分已上传的题数
		$sql = "SELECT count( * )+1 as num
				FROM `temporary_part`
				WHERE name LIKE '".$name."%' and teacher_id='".$teacher_id."'";
		$num = $this->db->query($sql)->fetchAll();
		
		$data = array(
			'content' => $content,
			'answer' => $answer,
			'hasAudio' => $hasAudio,
			'category' => $name);
		$this->db->insert($type,$data);
		$lastId = $this->db->lastInsertId();
		
		$name = $name.$num[0]['num'];
		$overview = substr($content, 0, 30);
		$data = array(
			'selorfill_id' => $lastId,
			'overview' => $overview,
			'name' => $name,
			'teacher_id' => $teacher_id,
			'type' => $type );
		$this->db->insert('temporary_part',$data);
		
		if($hasAudio)
		{
			$data = array(
				$type.'_id' => $lastId,
				'audio' => $audio);
			$this->db->insert('audio_'.$type, $data);
		} 
	}
	
	/**
	 * 
	 * 获取此教师在临时表保存的部分
	 * @param unknown_type $teacher_id
	 */
	public function getTemporaryRart($teacher_id)
	{
		$sql = "select * from temporary_part where teacher_id='".$teacher_id."' order by id ASC";
		$result = $this->db->query($sql)->fetchAll();
		return $result;	
	}
	
	
	/**
	 * 
	 * 上传音频文件
	 * @param unknown_type $audioFile
	 * @param unknown_type $teacher_id
	 */
	public function saveAudioFile($audioFile,$teacher_id)
	{
		$index_file = Zend_Registry::get('INDEX_FILE');
		$newname = $teacher_id.mktime().".mp3";
		$upfile = $index_file."/audio/".$newname;
		if(is_uploaded_file($audioFile['tmp_name']))
		{
			if(!move_uploaded_file($audioFile['tmp_name'], $upfile))
			{
				echo "音频文件上传出错！";
				exit;
			}
		}
		else 
		{
			echo "音频文件上传出错！";
			exit;
		}
		return $newname;		
	}
	
	/**
	 * 
	 * 插入一套试卷
	 * @param unknown_type $introduction
	 * @param unknown_type $listening_test
	 * @param unknown_type $title
	 * @param unknown_type $category_id
	 */
	public function insertPaper($title,$category_id,$introduction=NULL,$listening_test=NULL,$time=NULL)
	{
		$data = array(
			'introduction' => $introduction,
			'listening_test' => $listening_test,
			'title' => $title,
			'category_id' => $category_id,
			'time' => $time);
		$this->db->insert('paper',$data);
		return $this->db->lastInsertId();
	}
	
	/**
	 * 
	 * 插入试卷的各部分并生成试题静态页面
	 * @param unknown_type $tempPartIds
	 * @param unknown_type $paper_id
	 * @param unknown_type $name
	 * @param unknown_type $direction
	 * @param unknown_type $time
	 */
	public function insertPart($tempPartIds,$paper_id,$partName,$direction=NULL,$time=NULL)
	{
		$index_file = Zend_Registry::get('INDEX_FILE');
		$partType = "";
		static $j = 1;
		
		$selorfill_id = "";
		$data = array(
			'direction' => $direction,
			'name' => $partName,
			'time' => $time);
		$this->db->insert('part',$data);
		$part_id = $this->db->lastInsertId();
		$partAnswer = "<part:".$part_id.":".$j.">";
		
		$sql = "select count(*)+1 as num from paper_part where paper_id='".$paper_id."'";
		$result = $this->db->query($sql)->fetchAll();
		$index = $result[0]['num'];
		
		$data = array(
			'paper_id' => $paper_id,
			'part_id' => $part_id,
			'index' => $index
			);
		$this->db->insert('paper_part',$data);
		
		$tempPartIds = str_replace('，', ',', $tempPartIds);
		$tempIds = explode(',',$tempPartIds);
		$i = 0;
		$content = "";
		$music = '';
		$pagehtml = "";
		$ii = 0; 
		foreach ($tempIds as $value)
		{//一个页面中的几个部分的ID
			$i++;
			$sql = "select type,selorfill_id from temporary_part where id='".$value."'";
			$result = $this->db->query($sql)->fetchAll();
			$partType = $result[0]['type'];
			$selorfill_id = $result[0]['selorfill_id'];
			if(count($result)>0)
			{
				$data = array(
					'part_id' => $part_id,
					$result[0]['type']."_id" => $value,
					'index' => $i);
				$this->db->insert("part_".$result[0]['type'], $data);
				
				$sql = "delete from temporary_part where id='".$value."'";
				$this->db->query($sql);     //删除临时表
			}	
			
			$sql = "select content,answer,hasAudio from ".$partType." where id='".$selorfill_id."'";
			$result = $this->db->query($sql)->fetchAll();
			$partAnswer  = $partAnswer.(($ii==0)?"":"#").$result[0]['answer'];
			$ii++;
		
			$content = $result[0]['content'];
			$pagehtml .= $this->contentToHtml($content, $paper_id, $part_id, $selorfill_id, $this->getFlag($content),$j);
			
			if($result[0]['hasAudio'])
			{//查找音频
				$sql = "select audio from audio_".$partType." where ".$partType."_id='".$selorfill_id."'";
				$result = $this->db->query($sql)->fetchAll();
				if(count($result)>0)
				{
					$music = $music."<media src='./../".$result[0]['audio']."'/>";
				}
			}	
		}
		$partAnswer = $partAnswer."</part>";
		//插入答案
		$sql = "select * from paper_answer where paper_id='".$paper_id."'";
		$paper_result = $this->db->query($sql)->fetchAll();
		if(count($paper_result)<=0)
		{
			$data = array(
				'paper_id' => $paper_id,
				'answer' => $partAnswer);
			$this->db->insert('paper_answer', $data);
		}
		else 
		{
			$sql = "update paper_answer set answer='".$paper_result[0]['answer'].$partAnswer."' where paper_id='".$paper_id."'";
			$this->db->query($sql);
		}
		
		//生成试题静态页面
		$pagehtml = file_get_contents($index_file."/temp/header.html").$pagehtml.file_get_contents($index_file."/temp/footer.html");
		
		$wpl = file_get_contents($index_file."/temp/wpl.wpl");
		$wpl = str_replace("<exam:wpl_music>", $music, $wpl);
		if($music != "")
		{//写入音频
			$wplfilename = $paper_id.$part_id.time().".wpl";
			$fo = fopen($index_file."/audio/wpl/".$wplfilename, 'w+');
			fwrite($fo, $wpl);
			fclose($fo);
			
			$audioTemp = file_get_contents($index_file."/temp/audio.html");
			$audioTemp = str_replace("<exam:wplname>", "./../audio/wpl/".$wplfilename, $audioTemp);
			
			$pagehtml = str_replace("<exam:audio>", $audioTemp, $pagehtml);
		}
		
		
		for($i=1; $i<=4; $i++)
		{
			$filename = $paper_id."_".$j."_".$i.".html";
			$fo = fopen($index_file."/exam/".$filename, 'w+');
			$pagehtml = str_replace("<exam:paperId>",  $paper_id, $pagehtml);
			fwrite($fo, $pagehtml);
			fclose($fo);
		}
		$j++;
	}
	
	/**
	 * 
	 * 字符串转换为HTML页面内容
	 * @param unknown_type $arr
	 */
	public function contentToHtml($str,$paper_id, $part_id, $selorfill_id, $flag, $j)
	{
		
		$index_file = Zend_Registry::get('INDEX_FILE');
		$html = file_get_contents($index_file."/temp/page.html");
		$blank = '<input type="text"  value="" name="'.$selorfill_id.'<exam:id>" />';
		switch($flag)
		{
			//写作
			case 'writing':		
				$html = str_replace("<exam:content>", $str,$html);
				$html = str_replace("<exam:question>", '<textarea class="ckeditor" id="writing_answer" name="<exam:id>"></textarea>',$html);
				$html = str_replace("<exam:paperId>",  $paper_id, $html);
				break;
				
			//快速阅读
			case 'fastReading':
				$arr = $this->strtoarray($str);
				$question = '<div> <exam:title> <exam:option></div>';
				
				$first = true;
				$option = array('A','B','C','D');
				for($i=0; $i<count($arr); )
				{
					if($first == true)
					{
						$html = str_replace("<exam:content>", $arr[0][0],$html);
						$first = false;
					}
					else
					{
						$temp = '';
						for($j=0; $j<count($arr[$i]); $j++)
						{
							if($j == 0)
							{
								$temp = str_replace('<exam:title>', (($i<=14)?($i/2):($i-7)).'.'.$arr[$i][$j], $question);
							}
							else 
							{
								$replace = "<input type='radio' id='".$selorfill_id.$i.$j."' name='".$selorfill_id.$i."<exam:id>' value='".$option[$j-1]."' />
											<label for='".$selorfill_id.$i.$j."'>".$arr[$i][$j]."</label>";
								$temp = str_replace('<exam:option>', $replace."<exam:option>", $temp);
								
							}
						}
						$temp = str_replace('<exam:option>', "", $temp);
						$hidden = '';
						if($i < 14)
						{
							$hidden = '<p style="display:none;"> <input type="radio" checked="checked" name="'.$selorfill_id.$i.'<exam:id>" value="NULL" /></p>';
						}
						$html = str_replace("<exam:question>", $temp.$hidden."<exam:question>", $html);
					}
					if($i < 14)
					{
						$i= $i+2;
					}
					else 
					{
						$i++;
					}
				}		
				$html = str_replace("<exam:paperId>",  $paper_id, $html);
				$html = str_replace("<exam:question>",  "", $html);
				$html = str_replace("<eo:blank>", $blank, $html);
				break;
				
			//听力短对话
			case 'shortListening':
				$arr = $this->strtoarray($str);
				$question = '<div> <exam:title> <exam:option></div>';
				$first = true;
				$option = array('A','B','C','D');		
				for($i=0; $i<count($arr); $i= $i+2)
				{
					if($first == true)
					{
						$html = str_replace("<exam:content>", $arr[0][0],$html);
						$first = false;
					}
					else
					{
						$temp = '';
						for($j=0; $j<count($arr[$i]); $j++)
						{
							if($j == 0)
							{
								$temp = str_replace('<exam:title>', ($i/2).".".$arr[$i][$j], $question);
							}
							else 
							{
								$replace = "<input type='radio' id='".$selorfill_id.$i.$j."' name='".$selorfill_id.$i."<exam:id>' value='".$option[$j-1]."' />
											<label for='".$selorfill_id.$i.$j."'>".$arr[$i][$j]."</label>";
								$temp = str_replace('<exam:option>', $replace."<exam:option>", $temp);
								
							}
						}
						$temp = str_replace('<exam:option>', "", $temp);
						$hidden = '<p style="display:none;"> <input type="radio" checked="checked" name="'.$selorfill_id.$i.'<exam:id>" value="NULL" /></p>';
						$html = str_replace("<exam:question>", $temp.$hidden."<exam:question>", $html);
					}
				}		
				$html = str_replace("<exam:paperId>",  $paper_id, $html);
				$html = str_replace("<exam:question>",  "", $html);
				break;
				
			//听力长对话或短文	
			case 'longListening':
				$arr = $this->strtoarray($str);
				$question = '<div> <exam:title> <exam:option></div>';
				$first = true;
				$option = array('A','B','C','D');		
				for($i=0; $i<count($arr); $i= $i+2)
				{
					if($first == true)
					{
						$html = str_replace("<exam:content>", $arr[0][0],$html);
						$first = false;
					}
					else
					{
						$temp = '';
						for($j=0; $j<count($arr[$i]); $j++)
						{
							if($j == 0)
							{
								$temp = str_replace('<exam:title>', ($i/2).".".$arr[$i][$j], $question);
							}
							else 
							{
								$replace = "<input type='radio' id='".$selorfill_id.$i.$j."' name='".$selorfill_id.$i."<exam:id>' value='".$option[$j-1]."' />
											<label for='".$selorfill_id.$i.$j."'>".$arr[$i][$j]."</label>";
								$temp = str_replace('<exam:option>', $replace."<exam:option>", $temp);
								
							}
						}
						$temp = str_replace('<exam:option>', "", $temp);
						$hidden = '<p style="display:none;"> <input type="radio" checked="checked" name="'.$selorfill_id.$i.'<exam:id>" value="NULL" /></p>';
						$html = str_replace("<exam:question>", $temp.$hidden."<exam:question>", $html);
					}
				}		
				$html = str_replace("<exam:paperId>",  $paper_id, $html);
				$html = str_replace("<exam:question>",  "", $html);
				break;	
				
			//听力听写	
			case 'dictation':
				$html = str_replace("<eo:blank>", $blank, $str);
				$html = str_replace("<exam:paperId>",  $paper_id, $html);
				break;
					
			//阅读
			case 'reading':
				$arr = $this->strtoarray($str);
				$question = '<div> <exam:title> <exam:option></div>';
				$first = true;
				$option = array('A','B','C','D');		
				for($i=0; $i<count($arr); $i= $i+2)
				{
					if($first == true)
					{
						$html = str_replace("<exam:content>", $arr[0][0],$html);
						$first = false;
					}
					else
					{
						$temp = '';
						for($j=0; $j<count($arr[$i]); $j++)
						{
							if($j == 0)
							{
								$temp = str_replace('<exam:title>', ($i/2).".".$arr[$i][$j], $question);
							}
							else 
							{
								$replace = "<input type='radio' id='".$selorfill_id.$i.$j."' name='".$selorfill_id.$i."<exam:id>' value='".$option[$j-1]."' />
											<label for='".$selorfill_id.$i.$j."'>".$arr[$i][$j]."</label>";
								$temp = str_replace('<exam:option>', $replace."<exam:option>", $temp);
								
							}
						}
						$temp = str_replace('<exam:option>', "", $temp);
						$hidden = '<p style="display:none;"> <input type="radio" checked="checked" name="'.$selorfill_id.$i.'<exam:id>" value="NULL" /></p>';
						$html = str_replace("<exam:question>", $temp.$hidden."<exam:question>", $html);
					}
				}		
				$html = str_replace("<exam:paperId>",  $paper_id, $html);
				$html = str_replace("<exam:question>",  "", $html);		
				break;
				
			//完形填空
			case 'cloze':
				$arr = $this->strtoarray($str);
				$html = $arr[0][0];		
				for($i=1; $i<count($arr); $i++)
				{
					$options = "<b>".$i."</b>.<select name='<exam:id>'><option>".$arr[$i][1]."</option><option>".$arr[$i][2]."</option>
								<option>".$arr[$i][3]."</option><option>".$arr[$i][4]."</option></select>";
					$html = substr_replace($html, $options, strpos($html,"<eo:blank>"), 10);
				}	
				break;
				
			//翻译
			case 'translation':
				$html = str_replace("<eo:blank>", $blank, $str);
				$html = str_replace("<exam:paperId>",  $paper_id, $html);
				break;		
		}
		$html = str_replace("<exam:id>", ":exam:".$part_id.':'.$j.'[]', $html);
		return $html;
	}
	/**
	 * 
	 * 添加内容类别标签
	 * @param unknown_type $flag
	 * @param unknown_type $str
	 */
	public function addFlag($flag, $str)
	{
		return "<exam:flag=".$flag.">".$str;
	}
	
	/**
	 * 
	 * 取内容类别标签
	 * @param unknown_type $str
	 */
	public function getFlag($str)
	{
		return substr($str, 11, strpos($str, '>')-11);
	}
	
	/**
	 * 
	 * 保存学生考试答案
	 * @param unknown_type $student_id
	 * @param unknown_type $examination_id
	 * @param unknown_type $answer
	 */
	public function saveStuAnswers($student_id, $examination_id, $answer)
	{
		$sql = "select * from student_answer 
				where student_id='".$student_id."' and examination_id='".$examination_id."'";
		$result = $this->db->query($sql)->fetchAll();
		if(count($result)>0)
		{
			//print_r($result);
			$sql = "update student_answer set answer='".$result[0]['answer'].$answer."' 
					where student_id='".$student_id."' and examination_id='".$examination_id."'";
			$this->db->query($sql);
		}
		else
		{
			$data = array(
				'student_id' => $student_id,
				'examination_id' => $examination_id,
				'answer' => $answer);
			$this->db->insert('student_answer', $data);
		}
	}
	
	/**
	 * 
	 * 连接提交的答案
	 * @param unknown_type $answer
	 */
	public function linkAnswer($answer)
	{
		$answers = "";
		foreach ($answer as $value)
		{
			$answers .= $value."#";
		}
		return substr($answers, 0, strlen($answers)-1);
	}
}






