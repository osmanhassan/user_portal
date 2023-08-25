# User Portal 
An open-source Java-based User Portal designed for user management. With UserAccess, users can easily register, while administrators gain the power to edit and view user lists effortlessly. This innovative solution includes robust authentication and authorization features, ensuring secure access and streamlined user management.

# Tech Stack

- [ ] HTML5
- [ ] Bootstrap 4 (CSS framework)
- [ ] JavaScript
- [ ] JQuery
- [ ] MySQL 
- [ ] Java
- [ ] Spring Boot
- [ ] JSP

# Instructions

### Database

- Import the sql file FROM the repository's "/database/user_portal_db.sql" TO mySQL of your computer.

### Run the app

- At /src/main/resources/application.properties provide your data base credentials like below:
```
spring.datasource.url=jdbc:mysql://<your_host>/<your_db_name>
```
```
spring.datasource.password=<your_db_password>
```
```
spring.datasource.username=<your_db_username>
```
save the changes in the file.

- Using IDE run the project or run by the command line by command :

```
mvn clean
```
```
mvn spring-boot:run
```

