<?php

/**
 * Front controller
 *
 * PHP version 7.0
 */

/**
 * Composer
 */
require dirname(__DIR__) . '/vendor/autoload.php';


/**
 * Error and Exception handling
 */
error_reporting(E_ALL);
set_error_handler('Core\Error::errorHandler');
set_exception_handler('Core\Error::exceptionHandler');


/**
 * Routing
 */
$router = new Core\Router();

// Add the routes
$router->add('students', ['controller' => 'Student', 'action' => 'index']);
$router->add('students/delete',['controller' => 'Student', 'action' => 'delete']);
$router->add('students/add',['controller' => 'Student', 'action' => 'add']);
$router->add('{controller}/{action}');

$router->dispatch($_SERVER['QUERY_STRING']);














































































































































































































