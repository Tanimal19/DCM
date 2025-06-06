## DCManager

Data Center Management System  
Final Project for NTU Cloud Native 2025

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

## Demo

Demo site: (Demo site is deprecated, since we don't have enough GCP credits 😢, you could still run this project by cloning it.)  
Demo video: 

### UI Preview
<div align="center">
  
  **Login page**
  <img src="assets/login.png">
  
  **Datacenter overview**
  <img src="assets/overview.png">
  
  **Host overview**
  <img src="assets/host-overview.png">
  
  **Moving the host in the rack / between racks**
  <div>
    <img src="assets/dragging-host1.png" height="600px" ><img src="assets/move-host.png" height="400px" >
  </div>
  <br/>
  
  **Service overview**
  <img src="assets/service-overview.png">
  
  **Serivce view**
  <img src="assets/service-view.png">
</div>

## Run This Project
> [!IMPORTANT]
> This repo using git submodule, so don't just `git clone`, use this:
>
> ```
> git clone git@github.com:Tanimal19/DCM.git --recursive
> ```


### Docker Compose (Local)
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

### GCP Deploy
(gitHub action will automatically deploy, use this only if you want to deploy manually)
```
./deploy.ps1 <frontend | backend | both>
```
