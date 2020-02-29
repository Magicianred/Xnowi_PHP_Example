<?php
require_once __DIR__ . './../vendor/autoload.php'; // Autoload files using Composer autoload

use Xnowi\Engine as xnowiEngine;
/**
*
* This is a example file to testing xnowi
* Set parameter and call the function of xnowiEngine
*
*/
	header('Content-type: text/html; charset=ISO-8859-1');
	header('Cache-Control: private, no-cache="set-cookie"');
	header('Expires: 0');
	header('Pragma: no-cache');		

	require_once("../config.php");	

	$root = uriFunction2::get_path_to_root().PATH_TO_APP;
	// require_once($root.PATH_TO_XONOWI."configs/config.php");
	// require_once($root.PATH_TO_XONOWI."xnowiEngine.php");
	
	//config_debug();
	
	$engine = new xnowiEngine();
	
	$pageName = "donate";
	$pageExt = ".php";
	
	$lang = "it";
	$lang_mode = "uri";
	
	$xmlPath = AppSettings::get_pathToWebRoot(). "data/core/data.xml";
	if(!file_exists($xmlPath)) {
		trigger_error('Error loading file XML: '. $xmlPath, E_USER_ERROR);
	}
    	$xmlPathDebug = $root. "debug/root.xml";
    	$fileOutput = $root. "html/index.htm";
    	
    	// Verifico se è stato effettuato l'accesso
	if( isset($_COOKIE["user_isLoggin"]) && isset($_COOKIE["user_name"]) ) {
		$isLoggin = $_COOKIE["user_isLoggin"];
		$username = $_COOKIE["user_name"];
	} else {
		$isLoggin = 0;
		$username = 'ospite';
	}
	
    	// Verifico se è impostata il mode
	if(isset($_COOKIE["view_mode"])) {
		$mode = $_COOKIE["view_mode"];
		$engine->set_Mode($mode);
	} 
    	// Verifico se è impostata il theme
	if(isset($_COOKIE["path_theme"])) {
		$pathTheme = $_COOKIE["path_theme"];
		$engine->set_PathTheme($pathTheme);
	} 
    	// Verifico se è impostata lo style
	if(isset($_COOKIE["path_style"])) {
		$pathStyle = $_COOKIE["path_style"];
		$engine->set_PathStyle($pathStyle);
	}	
    	// Gestione del Theme
	$xslPath = AppSettings::get_pathToWebRoot(). $engine->get_PathTheme() . $pageName . ".xsl";	
	//$xslPath = CF_PATH_VIRTUAL . $engine->get_PathTheme() . "core/debug.xsl";	
	if(!file_exists($xslPath)) {
		trigger_error('Error loading file XSL: '. $xslPath, E_USER_ERROR);
	}
    	
    // Setto la lingua
	setcookie("user_lang", $lang, time()+3600,"/");
	$engine->set_Lang($lang);
	
	// Gestione della lingua del contenuto e del theme
	$xmlFileLang = AppSettings::get_pathToWebRoot(). "data/langs/". $pageName .".". $engine->get_Lang() .".content";
	if(!file_exists($xmlFileLang)) {
		trigger_error('Error loading file content language: '. $xmlFileLang, E_USER_ERROR);
	}
	$xslFileLang = AppSettings::get_pathToWebRoot().$engine->get_PathTheme() ."../langs/". $engine->get_Lang() . ".content";
	if(!file_exists($xslFileLang)) {
		trigger_error('Error loading file interface language: '. $xmlFileLang, E_USER_ERROR);
	}
			
    	// Setto i parametri da passare allo stylesheet
    	$params = /* null; */ array(
			'pageName' => $pageName,
			'pageExt' => $pageExt,
    		'isLoggin' => $isLoggin,
    		'username' => $username,
    		'language' => $engine->get_Lang(),
    		'lang_mode' => $lang_mode,
    		'mode' => $engine->get_Mode(),
    		'urlRoot' => AppSettings::get_pathUrl(),
    		'pathRoot' => $root
    		);
    		
    // echo $engine->xTransformSimple( $xmlPath, $xslPath);
    
    // echo $engine->xTransformSimpleWithParams( $xmlPath, $xslPath, $params );
    
     echo $engine->xTransformIntlSimpleWithParams( $xmlPath, $xslPath, $xmlFileLang, $xslFileLang, $params );
?>
