<?php

class IndexController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        $examSession = new Zend_Session_Namespace('examSession');
    	if($examSession->username && $examSession->password)
		{
			header('Location: ./'.$examSession->action.'/');
		}
    }
}