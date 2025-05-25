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

```bash
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

```bash
# build image
docker build -t asia-east1-docker.pkg.dev/cloud-native-457203/dcm/backend ./DCmanager-backend
docker build -t asia-east1-docker.pkg.dev/cloud-native-457203/dcm/fronted ./DCManager-frontend

# push container
docker push asia-east1-docker.pkg.dev/cloud-native-457203/dcm/backend
docker push asia-east1-docker.pkg.dev/cloud-native-457203/dcm/frontend

# deploy to gcp
gcloud run deploy backend-service `
  --image gcr.io/cloud-native-457203/dcm/backend `
  --set-env-vars DB_NAME=datacenter_management,DB_USER=postgres,DB_PASSWORD=postgres,DB_HOST=35.236.182.119,PORT=8080 `
  --add-cloudsql-instances=cloud-native-457203:asia-east1:dcm-postgresql-db `
  --region=asia-east1 `
  --platform managed `
  --allow-unauthenticated

gcloud run deploy frontend-service `
  --image asia-east1-docker.pkg.dev/cloud-native-457203/dcm/frontend `
  --region=asia-east1 `
  --platform managed `
  --allow-unauthenticated
```
