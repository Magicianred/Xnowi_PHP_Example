<?php
require_once __DIR__ . './../vendor/autoload.php'; // Autoload files using Composer autoload

use Xnowi\Engine as xnowiEngine;
/**
*
* This is a example file to testing xnowi
* Switch cookie for change theme (xsl), mode (view), style (css)
*
*/
	require_once("./../config.php");

	$root = uriFunction2::get_path_to_root().PATH_TO_APP;
	// require_once($root.PATH_TO_XONOWI."configs/config.php");
	// require_once($root.PATH_TO_XONOWI."xnowiEngine.php");
	
	$engine = new xnowiEngine();
		
	if(isset($_GET["mode"])) {
		$mode = $_GET["mode"];
		switch ($mode) {
			case "web":
			case "mobile":
			case "onlytext":
			  break;
			  
			default:
			  $mode = "";
			  break;
		}
		
		if($mode != "") {
		/*	$engine.set_PathTheme("/themes/". $mode ."/");
			$enngine.set_PathStyle("/themes/". $mode ."/styles/");
		*/	
			setcookie("path_theme", "/themes/". $mode ."/", time()+3600,"/");
			setcookie("path_style", "/themes/". $mode ."/styles/", time()+3600,"/");
			setcookie("view_mode", $mode, time()+3600,"/");
		} else {
			
			setcookie("path_theme", $engine->get_PathTheme(), time()+3600,"/");
			setcookie("path_style", $engine->get_PathStyle(), time()+3600,"/");
			setcookie("view_mode", $DefaultTheme, time()+3600,"/");
		}
	}
		
	$root = str_replace("/logics","",AppSettings::get_pathUrl());
	$referrer = ($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] :  "/". $root ."index.php" ;
	header('Location: '. $referrer);
	
?>
