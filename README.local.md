## (local)本地環境隔離快速專案部屬(隨機PORT)
需安裝Docker, 若在Linux環境需額外手動安裝docker-compose, 部屬結果與UI相同（但是可以避免弄髒系統開發環境）
``` 
docker-compose up -d --build 
```
部屬包含spring網頁+posgres+adminer資料庫管理系統, 驗證後即可上傳程式碼
