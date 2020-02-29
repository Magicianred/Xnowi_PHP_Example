<?php
require_once __DIR__ . './../vendor/autoload.php'; // Autoload files using Composer autoload

use Xnowi\Engine as xnowiEngine;
/**
*
* This is a example file to testing xnowi
* Switch cookie for change language
*
*/
	require_once("./../config.php");	

	$root = uriFunction2::get_path_to_root().PATH_TO_APP;
	// require_once($root.PATH_TO_XONOWI."configs/config.php");
	// require_once($root.PATH_TO_XONOWI."xnowiEngine.php");
	
	$engine = new xnowiEngine();
	
	$defaultLang = $engine->get_DefaultLang();
	
	// Verifico se è impostata la lingua
	if(isset($_GET["lang"])) {
		$lang = $_GET["lang"];
		switch($lang) {
		case "en":
		case "es":
		case "it":
			setcookie("user_lang", $_GET["lang"], time()+3600,"/");
			break;
		default:
			setcookie("user_lang", $defaultLang, time()+3600,"/");
			break;
		} 
	} else {		
		setcookie("user_lang", $defaultLang, time()+3600,"/");
	}
	
	$root = str_replace("/logics","",AppSettings::get_pathUrl());
	$referrer = ($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] :  $root ."index.php" ;
	/* Start change langs uri or referer
	$referrer = str_replace("/en/","/",$referrer);
	$referrer = str_replace("/es/","/",$referrer);
	$referrer = str_replace("/it/","/",$referrer);
	End change langs uri or referer */
	$referrer = (strpos($referrer, "/en/")) ? $root ."index.php" : $referrer ;
	$referrer = (strpos($referrer, "/it/")) ? $root ."index.php" : $referrer ;
	$referrer = (strpos($referrer, "/es/")) ? $root ."index.php" : $referrer ;
	header('Location: '. $referrer);
	
?>
