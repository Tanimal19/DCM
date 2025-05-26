## DCManager

Data Center Management System  
Final Project for NTU Cloud Native 2025

https://frontend-566579704717.asia-east1.run.app/

### Project Structure

```
.
├── backend/ (submodule)
│   ├── db/
│   │   ├── database.py
│   │   ├── Dockerfile (for db)
│   │   └── ...
│   ├── app.py
│   ├── Dockerfile (for backend)
│   ├── requirements.txt
│   └── ...
├── frontend/ (submodule)
│   ├── src/
│   │   ├── main.tsx
│   │   └── ...
│   ├── Dockerfile (for frontend)
│   └── ...
├── deploy.ps1
├── compose.yaml
└── README.md
```

## Docker Compose (Local)

```
# 啟動所有服務（背景）
docker-compose up -d

# 重新建構並啟動服務
docker-compose up -d --build

# 重新建構並重啟指定服務
docker-compose up -d --build <service>

# 查看 container 狀態
docker-compose ps

# 查看指定服務的即時日誌
docker-compose logs -f <service>

# 關閉所有服務
docker-compose down
```

## GCP Deploy

```
./deploy.ps1 <frontend | backend | both>
```
