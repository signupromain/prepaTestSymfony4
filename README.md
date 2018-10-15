# prepaTestSymfony4
## Préparation au test octobre 2018
### 1 create git project
- create a project on github with README.md
- clone this project on your project's folder 
> git clone +URL
- open this with your IDE
### 2 install symfony 4 with composer
> composer create-project symfony/website-skeleton prov
- ctrlx --) ctrlc to the main folder and erase PROV folder
### 3 add security checker
>composer require sensiolabs/security -checker --dev
### 4 create externe DB MySQL
-create datas folder 
-create the database schema with Workbench
-export diagram to image: /datas/diagram.png
-real export in .sql
### 5 change env.
change .env line 16
>Configure your db driver and server_version in config/packages/doctrine.yaml
 DATABASE_URL=mysql://root:@127.0.0.1:3306/prepatestsymfony4
### 6 create mapping database
> php bin/console doctrine:mapping:import 'App\Entity' annotation --path=src/Entity
### 7 create setters and getters for entities
> php bin/console make:entity App\Entity --regenerate
### 8 create PublicController
> php bin/console make:controller PublicController
### 9 start server
> php bin/console server:run
### 10 modify
* @Route("/", name="accueil")
### 11 add bootstrap 4 
add to file base.html.twig CSS and JavaScript bootstrap 4 
