# mvcstudent

Steps

 1. First, download the framework, either directly or by cloning the repo.
 
 Open [App/Config.php](App/Config.php) and enter your database configuration data.

 2. Create Database db_students and dumb student.sql
 
   student.sql consist of sample data too

3 . Configure DataBase

 mvcstudent/App/Config.php           

Configuration settings are stored in the [App/Config.php](App/Config.php) class. Default settings include database connection data.
DB_HOST = '127.0.0.1';
 DB_NAME = 'db_students';
 DB_USER = 'root';
DB_PASSWORD = '';

Access student list using  mvcstudent/public/students 

local host url will be like

http://localhost/mvcstudent/public/students   

============================================================================================================================

## Controllers

Controllers respond to user actions (clicking on a link, submitting a form etc.). Controllers are classes that extend the [Core\Controller](Core/Controller.php) class.

Controllers are stored in the `App/Controllers` folder. A sample [Home controller](App/Controllers/Home.php) included. Controller classes need to be in the `App/Controllers` namespace. You can add subdirectories to organise your controllers, so when adding a route for these controllers you need to specify the namespace (see the routing section above).

Controller classes contain methods that are the actions. To create an action, add the **`Action`** suffix to the method name. The sample controller in [App/Controllers/Home.php](App/Controllers/Home.php) has a sample `index` action.

You can access route parameters (for example the **id** parameter shown in the route examples above) in actions via the `$this->route_params` property.


## Views

Views are used to display information (normally HTML). View files go in the `App/Views` folder. Views can be in one of two formats: standard PHP, but with just enough PHP to show the data. No database access or anything like that should occur in a view file. You can render a standard PHP view in a controller, optionally passing in variables, like this:

```php
View::render('Home/index.php', [
    'name'    => 'sreeja',
    'colours' => ['red', 'green', 'blue']
]);
```


```php
View::renderTemplate('Home/index.html', [
    'name'    => 'sreeja',
    'colours' => ['red', 'green', 'blue']
]);
```


## Models

Models are used to get and store data in your application. They know nothing about how this data is to be presented in the views. Models extend the `Core\Model` class and use [PDO](http://php.net/manual/en/book.pdo.php) to access the database. They're stored in the `App/Models` folder. A sample user model class is included in [App/Models/User.php](App/Models/User.php). You can get the PDO database connection instance like this:

```php
$db = static::getDB();
```

## Errors

If the `SHOW_ERRORS` configuration setting is set to `true`, full error detail will be shown in the browser if an error or exception occurs. If it's set to `false`, a generic message will be shown using the [App/Views/404.html](App/Views/404.html) or [App/Views/500.html](App/Views/500.html) views, depending on the error.

## Web server configuration

Pretty URLs are enabled using web server rewrite rules. 
