<?php
require_once __DIR__ . './../vendor/autoload.php'; // Autoload files using Composer autoload

use Xnowi\Engine as xnowiEngine;
/**
*
* This is a example file to testing xnowi
* Set cookie for login / logout, !!! is not really working !!!
*
*/
	if(isset($_POST["txtUser"])) {
			setcookie("user_isLoggin", '1', time()+3600,"/");
			setcookie("user_name", $_POST["txtUser"], time()+3600,"/");
	} else {
		setcookie("user_isLoggin", '0', time()+3600,"/");
		setcookie("user_name", '', time()+3600,"/");
	}
	
	$referrer = $_SERVER['HTTP_REFERER'];
	header('Location: '. $referrer);
?>