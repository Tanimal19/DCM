# DCManager

## Project Structure

```
.
├── DCM-backend/
│   ├── db/
│   │   ├── database.py
│   │   ├── Dockerfile (for db)
│   │   └── ...
│   ├── app.py
│   ├── Dockerfile (for backend)
│   ├── requirements.txt
│   └── ...
├── DCM-frontend/
│   ├── src/
│   │   ├── main.tsx
│   │   └── ...
│   ├── Dockerfile (for frontend)
│   └── ...
├── compose.yaml
└── README.md
```

## Docker Compose

```
啟動所有服務（背景）
docker-compose up -d

重新建構並啟動服務
docker-compose up -d --build

重新建構並重啟指定服務
docker-compose up -d --build <service>

查看 container 狀態
docker-compose ps

查看指定服務的即時日誌
docker-compose logs -f <service>

關閉所有服務
docker-compose down
```
