<?php

use Xnowi\Engine as xnowiEngine;
/**
*
* This is a example file to testing xnowi
* set some parameters
*
*/
	error_reporting(E_ALL);
	
	/* Change with own configuration */
	define('PATH_TO_APP',"/"); /* Path from webroot to approot */
	// if you don't use Composer autoload
	// define('PATH_TO_XONOWI',"xnowi/"); /* Path from approot to folder xnowi */
	/* End Change */
	
	//config_debug();		
		
	// Manage setting application	
	class AppSettings {
		// Return app client path root
		static public function get_pathRoot() {
			return uriFunction2::get_path_to_root();
		}
		
		// Return the webroot path root
		static public function get_pathToWebRoot() {
			// current directory
			(defined('__DIR__')) ? $currentDirectory = __DIR__ : $currentDirectory = dirname(__FILE__);
			$currentDirectory = rtrim($currentDirectory, "/");
			$currentDirectory = $currentDirectory;
			$currentDirectory = uriFunction2::normalize_uri($currentDirectory);
			return $currentDirectory;
		}		
		
		// Return path from root to app
		static public function get_pathFromRootToApp() {
			$pathFromRootToApp = ltrim(dirname($_SERVER['PHP_SELF']),"/")."/";
			return $pathFromRootToApp;
		}
		
		// Return path url
		static public function get_pathUrl() {
			$urlRoot =  "http://{$_SERVER['HTTP_HOST']}";
			$urlRoot = uriFunction2::normalize_uri($urlRoot).self::get_pathFromRootToApp();
			return $urlRoot;
		}

	}
		
	class uriFunction2 {
		// Function normalize uri with last slash
		static public function normalize_uri($uri) {
			$uri = rtrim($uri, "/");
			$uri = $uri . "/";
			return $uri;	
		}

		
		// Function that return the relative path to root
		static public function get_path_to_root() {
			$parsedUri = dirname($_SERVER['PHP_SELF']);
			$parsedUri .= substr($parsedUri, -1) != '/' ? '/' : '';
			$relativeUri = str_replace('/', '', $parsedUri);
			$relativePath = strlen($parsedUri) - strlen($relativeUri) - 1;
			if ($relativePath < 0){ $relativePath = 0; }
			$relativePath = str_repeat('../', $relativePath);
			if (!$relativePath){ $relativePath = './'; }
			return $relativePath;
		}
	}
	
	
	function config_debug() {
		echo "------- DEBUG CONFIG APP -----------<br>";
		echo "Path to Root: ". AppSettings::get_pathRoot() ."<br>";
		echo "Path to WebRoot: " . AppSettings::get_pathToWebRoot() . "<br>";	
		echo "Path from Root to App: " . AppSettings::get_pathFromRootToApp() . "<br>";
		echo "Path URL: ". AppSettings::get_pathUrl() ."<br>";
		echo "------- END DEBUG CONFIG APP -----------<br>";
		echo "<br>";
	}
?>
