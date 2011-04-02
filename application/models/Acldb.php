<?php
/**
 * Zend_Acl_Db 类继承自 Zend_Acl 类
 * 实现访问控制列表从数据库表中加载
 *
 * @author monyxie <monyxie@gmail.com>
 * @copyright (c)2011 Guangxi University Jiwang081
 * @version 0.1
 *
 */

/**
 * @see Zend_Acl 
 */
require_once 'Zend/Acl.php';
require_once 'Zend/Acl/Role.php';
require_once 'Zend/Acl/Resource.php';

/**
 * 
 * @version 1.0
 * @copyright 2011-? Guangxi University Jiwang081
 * @author monyie <monyxie@gmail.com> 
 * @license All rights reserved.
 */
class Acldb extends Zend_Acl
{
    /**
     * 
     * @var Zend_Db
     * @access protected
     */
    protected $db;

    protected $tablename_role,
        $tablename_resource,
        $tablename_privilege,
        $tablename_rule;


    /**
     * 
     * @access public
     * @return void
     */
    public function __construct()
    {

        $this->db = Zend_Registry::get('db');
        //$this->addRole('tea');
        //$tablename_role = 'acl_table';
        //$tablename_resource = 'acl_resource';
        //$tablename_privilege = 'acl_privilege';
        //$tablename_rule = 'acl_rule';
        $this->load();
    }

    /**
     * 从数据库加载访问控制表
     * @access public
     * @return void
     */
    public function load()
    {
        $this->removeRoleAll();
        $this->removeAll();
        $sql = "SELECT * FROM `acl_role`";
        $result = $this->db->query($sql)->fetchAll();
        if (is_array($result))
        {
            foreach ($result as $value)
            {
                $this->addRole($value['name'], null);
                
            }
        }

        $sql = "SELECT * FROM `acl_resource`";
        $result = $this->db->query($sql)->fetchAll();
       
        if (is_array($result))
        {
            foreach ($result as $value)
            {
               $this->addResource(new Zend_Acl_Resource($value['name']));
            }
        }
        
        $sql = "SELECT * FROM `acl_rule`";
        $result = $this->db->query($sql)->fetchAll();
        if (is_array($result))
        {
            foreach ($result as $value)
            {
                if ($value['allow'])
                {
                	$this->allow($value['role'], $value['resource'], $value['privilege'], null);
                }
            }
        }
        
        return true;
    }

    public function update()
    {
        //$sql = 

    }

    /**
     * 返回allow数组
     * @param string $role
     * @param string $privilege
     * @return array 
     */
    public function listAllow($role, $privilege)
    {
        if (null !== $role)
        {
            $roler = $this->_getRoleRegistry()->get($role);
        } else {
            $roler = null;
        }
        
        if (null !== $roler)
        {
            $allowlist = array(array());
             
            foreach($this->_resources as $key => $value)
            {
            	$resource  = $this->get($key);
                $resallowlist = array();
                $rules =& $this->_getRules($resource, $roler, true);
                if ( isset($rules['byPrivilegeId'][$privilege]))
                {
                    if ('TYPE_ALLOW' === $this->_getRuleType($resource, $roler, $privilege))
                        array_push($allowlist, $resource->getResourceId());
                }
            }
            return $allowlist;
        }
        else
        {
            return null;
        }

    }

} //class
