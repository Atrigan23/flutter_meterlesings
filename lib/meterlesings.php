<?php

$dbhost        = '172.16.3.97';
$dbuser        = 'sa';
$dbpass        = '#nwk!';
$database      = 'online';

$conn = new mysql($dbhost,$dbuser,$dbpass,$database)
$remoteDb = new MysqliDb_Remote($dbhost, 'sa', '#nwk!', 'online');
if(!empty($_REQUEST['id'])){
$remoteDb->where('m_Id',$_REQUEST['id']);


$users = $remoteDb->getOne('meterlesings');
}






?>