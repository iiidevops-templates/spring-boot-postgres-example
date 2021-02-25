# Spring Boot with PostgreSQL and Docker Compose Example

## 範例教學來源：https://gustavopeiretti.com/spring-boot-with-postgresql-and-docker-compose/
* GET`部屬URL/user/all`: 列出資料庫內所有使用者  
* GET`部屬URL/user/{id}`: 列出該使用者id的訊息  
* POST`部屬URL/user/save`: 儲存新的使用者名稱到資料庫  

## (local)本地環境隔離快速專案部屬(隨機PORT)
需安裝Docker, 若在Linux環境需額外手動安裝docker-compose, 部屬結果與UI相同（但是可以避免弄髒系統開發環境）
``` 
docker-compose up -d --build 
```
部屬包含spring網頁+posgres+adminer資料庫管理系統, 驗證後即可上傳程式碼

## STEPS FOR THIS SPRING BOOT APP
- Define dependencies in build.gradle
- Create a Spring Boot Main @SpringBootApplication
- Create components @Entity / @RestController / @Repository
- Create application.properties
- Build 
- Check app using curls 

## CURLS 

### POST /user/save 
curl -s -X POST \
  http://localhost:8080/user/save \
  -H 'Content-Type: application/json' \
  -d '{"name":"Your Name"}'


### GET /user/{id}
curl -s -X GET \
  http://localhost:8080/user/1 
  
  
## Complete explanation
english: https://experto.dev/en/spring-boot-with-postgresql-and-docker-compose/   
spanish: https://experto.dev/spring-boot-postgresql-docker-compose/   

# origin (APP資料夾內是spring連postgresql的範例)
forked from gustavopeiretti/springboot-postgresql-docker-example
