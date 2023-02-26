
##  Laravel Vue SPA Student Management System


## How to install

## First 

- make sure your environment`s dependencies are updated 
- php 8.1.10
- composer (latest)
- node ( latest stable version)
- if your OS is Linux and you encounter with error like( ENSO reached limit watcher... )
   use this command  sudo sysctl -w fs.inotify.max_user_watches=524288 
   dont worry its linux stricts not bug in project.

## Second

- After download the project in your prefer directory , ( git clone https://github.com/mafifi96/laravel-vue-spa-lms.git )
- Create Database (lms) in your mysql ,
- run following commands :
```
 composer install
 php artisan migrate
 php artisan db:seed
 php artisan serve
```
