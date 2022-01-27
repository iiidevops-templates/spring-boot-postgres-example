# Java Spring Boot (Gradle) with PostgreSQL - Simple API

## 如何增加Sonarqube掃描(用預設的QualiyGate)
在`app/build.gradle`的檔案內plugins新增`id "org.sonarqube" version "3.1.1"`後pipeline即可運行Sonarqube掃描   
若要設定其他額外的細節也可寫在`app/build.gradle`，例如排除特定資料夾(與程式碼無關的)、指定的QualityGate、Rule等等  
相關可用額外參數說明可參考[sonarscanner-for-gradle](https://docs.sonarqube.org/latest/analysis/scan/sonarscanner-for-gradle/)

## 專案資料夾與檔案格式說明

| 型態 | 名稱 | 說明 | 路徑 |
| --- | --- | --- | --- |
| 檔案 | .rancher-pipeline.yml | :warning: (不可更動)devops系統所需檔案 | 根目錄 |
| 檔案 | docker-compose.yaml | (可調整)本地端快速部署使用 | 根目錄 |
| 檔案 | Dockerfile | (可調整)devops k8s環境部署檔案 | 根目錄 |
| 檔案 | Dockerfile.local | (可調整)本地端部署使用 | 根目錄 |
| 檔案 | README.local.md | 本地端使用說明文件 | 根目錄 |
| 檔案 | README.md | 本說明文件 | 根目錄 |
| 檔案 | SonarScan | (可調整)整合SonarQube執行檔案 | 根目錄 |
| 檔案 | user_model.sql | (選擇性)資料庫初始匯入檔案，可為任意檔案名稱，副檔名.sql | 根目錄 |
| 資料夾 | app | 專案主要程式碼 | 根目錄 |
| 資料夾 | iiidevops | :warning: devops系統測試所需檔案 | 根目錄 |
| 檔案 | app.env | (可調整)提供實證環境之環境變數(env)定義檔 | iiidevops |
| 檔案 | app.env.develop | (可調整)提供特定分支(develop)實證環境之環境變數(env)定義檔 | iiidevops |
| 檔案 | pipeline_settings.json | :warning: (不可更動)devops系統測試所需檔案 | iiidevops |
| 資料夾 | bin | :warning: devops系統測試所需執行檔案 | iiidevops |
| 資料夾 | postman | :warning: devops系統整合postman測試所需執行檔案 | iiidevops |
| 檔案 | postman_collection.json | (可調整)devops newman部署測試檔案 | iiidevops/postman |
| 檔案 | postman_environment.json | (可調整)devops newman部署測試檔案 | iiidevops/postman |
| 資料夾 | sideex | :warning: devops系統測整合sideex試所需執行檔案 | iiidevops |
| 檔案 | Global Variables.json | (可調整)devops sideex部署測試檔案 | iiidevops/sideex |
| 檔案 | sideex.json | (可調整)devops sideex部署測試檔案 | iiidevops/sideex |

## 開發者注意事項
* :warning: 若專案建立後程式碼Pull到local端測試, 可參考以下兩個處理方式
  * 透過docker-compose來進行專案快速部署並直接修改符合您作業的環境變數
  * 使用docker部署, 並設定環境變數連上已經建置好的 postgresql, 需要設定環境變數如下:
  ```env
  `db_host`: 指向到您的資料庫，例如localhost或是其他IP
  `db_name`: 指向到您的資料庫名稱
  `db_username`: 指向到您的資料庫使用者名稱
  `db_password`: 指向到您的資料庫密碼
  ```

## 修改程式碼注意事項
1. 修改資料庫連線  
由於此範本包含自動建立出全新的開發用資料庫, 因此在 pipeline 執行過程會透過環境變數來設定資料庫位址與帳號密碼, 因此專案的資料庫連線部分請不要更動`app/src/main/resources/application.properties`內的
```
spring.datasource.url=jdbc:postgresql://${db_host}:5432/${db_name}
spring.datasource.username=${db_username}
spring.datasource.password=${db_password}
```
2. 修改環境版本  
若實際開發使用並非gradle jdk8, 請至`Dockefile`修改為自己想要的版本(如需要本機上做測試則須一併連同`Dockerfile.local`去做修改)

## iiidevops
* 專案內`.rancher-pipeline.yml`是 pipeline 的定義檔, 除非對 yml 與 rancher pipeline 的語法有足夠的了解, 否則建議不要隨意對內容進行更動, 有可能會造成 pipeline 無法正常運作
* 目前範本是依照 tomcat 預設服務的定義 port:8080 設定服務 port 號，如果您的程式需要更改使用其他 port 號 , 請將 `.rancher-pipeline.yml` 內所有 web.port: 所定義的 8080 改成您實際需要的 port 號。
* `iiidevops`資料夾
  * `postman`資料夾內是devops整合API測試工具(postman)的自動測試檔案放置目錄，devops系統會以`postman`資料夾內 postman_collection.json 的檔案內容進行自動測試
  * `sideex`資料夾內則是devops整合Web測試工具(sideex)的自動測試檔案放置目錄，devops系統會以`sideex`資料夾內 sideex 匯出的 json 檔案內容進行自動測試
* `Dockerfile`內加上前置dockerhub，是為使image能透過本地端harbor擔任Image Proxy的方式抓取Docker Hub上的Images，增加不同專案抓取相同 Image 的效率


## 範例教學說明:
* 來源：https://gustavopeiretti.com/spring-boot-with-postgresql-and-docker-compose/
  * GET`部屬URL/user/all`: 列出資料庫內所有使用者  
  * GET`部屬URL/user/{id}`: 列出該使用者id的訊息  
  * POST`部屬URL/user/save`: 儲存新的使用者名稱到資料庫  

### STEPS FOR THIS SPRING BOOT APP
- Define dependencies in build.gradle
- Create a Spring Boot Main @SpringBootApplication
- Create components @Entity / @RestController / @Repository
- Create application.properties
- Build 
- Check app using curls 

### CURLS 

#### POST /user/save 
curl -s -X POST \
  http://localhost:8080/user/save \
  -H 'Content-Type: application/json' \
  -d '{"name":"Your Name"}'


#### GET /user/{id}
curl -s -X GET \
  http://localhost:8080/user/1 


### Complete explanation
english: https://experto.dev/en/spring-boot-with-postgresql-and-docker-compose/   
spanish: https://experto.dev/spring-boot-postgresql-docker-compose/   

## origin (APP資料夾內是spring連postgresql的範例)
forked from gustavopeiretti/springboot-postgresql-docker-example
