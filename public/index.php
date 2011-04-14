<?php

// Define path to application directory
defined('APPLICATION_PATH')
    || define('APPLICATION_PATH', realpath(dirname(__FILE__) . '/../application'));

// Define application environment
defined('APPLICATION_ENV')
    || define('APPLICATION_ENV', (getenv('APPLICATION_ENV') ? getenv('APPLICATION_ENV') : 'production'));

// Ensure library/ is on include_path
set_include_path(implode(PATH_SEPARATOR, array(
    realpath(APPLICATION_PATH . '/../library'),
    get_include_path(),
)));

/** Zend_Application */
require_once 'Zend/Loader.php';

Zend_Loader::loadClass('Zend_Controller_Front');
Zend_Loader::loadClass('Zend_Session_Namespace');
Zend_Loader::loadClass('Zend_Application');
Zend_Loader::loadClass('Zend_Config_Ini');
Zend_Loader::loadClass('Zend_Db');
Zend_Loader::loadClass('Zend_Db_Table');
Zend_Loader::loadClass('Zend_Registry');
//Zend_Loader::loadClass('Zend_View');
Zend_Loader::loadClass('Zend_Acl');
Zend_Loader::loadClass('Zend_Acl_Role');
Zend_Loader::loadClass('Zend_Acl_Resource');

//Zend_Session::setOptions(array('strict'=>true));
Zend_Session::start();
$examSession = new Zend_Session_Namespace('examSession');


$cfg = new Zend_Config_Ini('./../application/configs/application.ini', 'general');

$db = Zend_Db::factory($cfg->db->adapter, $cfg->db->config->toArray());
Zend_Registry::set('db', $db);
Zend_Db_Table::setDefaultAdapter($db);
Zend_Registry::set('INDEX_FILE',dirname(__FILE__));


$front = Zend_Controller_Front::getInstance();
$front->setControllerDirectory(APPLICATION_PATH."/controllers");
$front->addModuleDirectory(APPLICATION_PATH."/models");
$front->dispatch();

// Create application, bootstrap, and run
/*$application = new Zend_Application(
    APPLICATION_ENV,
    APPLICATION_PATH . '/configs/application.ini'
);
$application->bootstrap()
            ->run();*/
    