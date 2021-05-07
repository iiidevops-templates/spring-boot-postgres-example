# Spring Boot with PostgreSQL and Docker Compose Example

## 如何增加Sonarqube掃描(用預設的QualiyGate)
在`app/build.gradle`的檔案內plugins新增`id "org.sonarqube" version "3.1.1"`後pipeline即可運行Sonarqube掃描   
若要設定其他額外的細節也可寫在`app/build.gradle`，例如排除特定資料夾(與程式碼無關的)、指定的QualityGate、Rule等等  
相關可用額外參數說明可參考[sonarscanner-for-gradle](https://docs.sonarqube.org/latest/analysis/scan/sonarscanner-for-gradle/)

## 範例教學來源：https://gustavopeiretti.com/spring-boot-with-postgresql-and-docker-compose/
* GET`部屬URL/user/all`: 列出資料庫內所有使用者  
* GET`部屬URL/user/{id}`: 列出該使用者id的訊息  
* POST`部屬URL/user/save`: 儲存新的使用者名稱到資料庫  



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
