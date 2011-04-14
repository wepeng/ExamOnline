<?php
/**
 *  Class Name : Choice 
 *  @Describe: This Class is used to format  data:array to  select or checkbox html,
 *  Your give array_data will show by select or  checkbox in use html;
 *  @Acthor: Qinwei
 *  @Example:
 * $data = array(
 * 	array("class_id" => 1 , "class_name" => "081班"),	
 *	array("class_id" => 2 , "class_name" => "082班"),
 * 	array("class_id" => 3 , "class_name" => "083班"),
 * 	array("class_id" => 4 , "class_name" => "084班"),
 *	array("class_id" => 5 , "class_name" => "085班"),
 *	array("class_id" => 6 , "class_name" => "086班")
 *	);
 *	$defaults = array(1,2,3,5);
 *	$checkKey = 'class_id';
 *	$c = new Choice($data);
 *	$c->id('select_class')->valueByDataKey('class_id')->textByDataKey('class_name')->name('class_id');
 *	$c->setShowType('select');
 *	$c->setDefaultDataMark($checkKey, $defaults);
 *	echo $c->getHtml() //or $c->show();
 *
 */
class Choice {
	private $_id = '';
	private $_name = '';
	private $_valueKey = '';
	private $_textValueKey = '';
	private $showtype =  'checkbox';
	private $data = array();
	private $html = '';

	public function __construct($data) {
		$this->data = $data;	
	}

	public function id() {
		if(func_num_args() > 0 ) {
			$this->_id = func_get_arg(0);
			return $this;
		}
		return $this->_id;
	}

	public function name(){
		if(func_num_args() > 0 ) {
			$this->_name = func_get_arg(0);
			return $this;
		}
		return $this->_name;
	}

	public function valueByDataKey() {
		if(func_num_args() > 0 ) {
			$this->_valueKey = func_get_arg(0);
			return $this;
		}
		return $this->_valueKey;
	}

	public function textByDataKey() {
		if(func_num_args() > 0 ) {
			$this->_textValueKey = func_get_arg(0);
			return $this;
		}
		return $this->_textValueKey;
	}

	private function selectHtml() {
		$this->html = '';
		$this->html .= '<select ';
		if($this->_id) $this->html .= 'id="'.$this->_id.'"'; 
		if($this->_name)	$this->html .= ' name ="'.$this->_name.'" '; 
		$this->html .= ' >';
		foreach($this->data as $value) {
			$this->html .=	'<option ';
			if($this->_valueKey)	$this->html .= ' value="'.$value[$this->_valueKey].'"';
			if(isset($value['default']))
			{
				$this->html .= $value['default'] ? ' selected="selected"' : ''; 
			}
			$this->html .= '>';
			if($this->_textValueKey) $this->html .= $value[$this->_textValueKey].'</option>';
		}
		$this->html .= '</select>';
		return $this;
	}

	private function checkBoxHtml() {
		$this->html = '';
		foreach($this->data as $value) {
		$this->html .=	 '<input type="checkbox" ';
			if($this->_name) $this->html .= ' name="'.$this->_name.'[]" '; 
			if($this->_valueKey) $this->html .= ' value="'.$value[$this->_valueKey].'" ';

			if(isset($value['default'])){
				$this->html .= $value['default'] ? ' checked="checked"': ' ';
			}
			$this->html .= '> ';
			if($this->_textValueKey) $this->html .= $value[$this->_textValueKey].'</input>';
		}
		return $this;
	}

	public function setShowType($type) {
		$this->showtype = strtolower($type);
		return $this;
	}

	public function show() {
		echo $this->getHtml();
	}

	public function getHtml() {
	switch($this->showtype) {
		case 'select':
			$this->selectHtml();
			return $this->html;
			break;

		case 'checkbox':
			$this->checkBoxHtml();
			return $this->html;
			break;

		default:
			$this->checkBoxHtml();
			return $this->html;
			break;
	}
	}

	public function setDefaultDataMark($checkKey, $defaultValues) {
		$only = $this->showtype == 'select' && count($defaultValues) > 1; //if show type is select , only need one dedault value
		if($only) array_splice($defaultValues, 0, -1); //   so keep the last one value  
		foreach($this->data as &$value)
		{
			if($defaultValues) 
			{
				$key = array_search($value[$checkKey], $defaultValues);
				$value['default'] = $key === 0 || $key  ?  1  :  0; //Maybe will return the first key 0 , so is true
				if($key === 0 || $key) unset($defaultValues[$key]);  //remove the checked value
			}
			else
			{
				$value['default'] = 0;
			}
		}
		return $this;
	}

}


?>
