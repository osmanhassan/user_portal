# User Portal

## Database

Import the sql file in mySQL from /database/user_portal_db.sql of this repository.

## Run the app

At /src/main/resources/application.properties provide your data base credentials like below:

spring.datasource.url=jdbc:mysql://your_host/your_db_name

spring.datasource.password= your_db_password

spring.datasource.username= your_db_username

save the changes in the file.

Using IDE run the project or run by the command line by command :

### mvn clean
### mvn spring-boot:run


