# deploy.ps1

param (
    [Parameter(Mandatory = $true)]
    [ValidateSet("frontend", "backend", "both")]
    [string]$service
)

# === CONFIG ===
$projectId = "cloud-native-457203"
$region = "asia-east1"
$backendService = "backend"
$frontendService = "frontend"
$backendImage = "asia-east1-docker.pkg.dev/$projectId/dcm/backend"
$frontendImage = "asia-east1-docker.pkg.dev/$projectId/dcm/frontend"
$cloudSqlInstance = $projectId + ":" + $region + ":dcm-postgresql-db"
$dbName = "dcm"
$dbUser = "postgres"
$dbPassword = "postgres"
$dbHost = "35.236.182.119"
$dbPort = "5432"

Write-Host "🔧 Setting GCP project..."
gcloud config set project $projectId

# === Build Docker images ===
Write-Host "🐳 Building Docker images..."
if ($service -eq "both") {
    docker build -t $backendImage ./backend
    docker build -t $frontendImage ./frontend -f ./frontend/Dockerfile.production
} elseif ($service -eq "frontend") {
    docker build -t $backendImage ./backend
} elseif ($service -eq "backend") {
    docker build -t $frontendImage ./frontend -f ./frontend/Dockerfile.production
}

# === Push Docker images ===
Write-Host "📤 Pushing Docker images to GCR..."
if ($service -eq "both") {
    docker push $backendImage
    docker push $frontendImage
} elseif ($service -eq "frontend") {
    docker push $frontendImage
} elseif ($service -eq "backend") {
    docker push $backendImage
}


if ($service -eq "both" -or $service -eq "frontend") {
    Write-Host "🚀 Deploying frontend to Cloud Run..."
    gcloud run deploy $frontendService `
    --image=$frontendImage `
    --platform=managed `
    --region=$region `
    --allow-unauthenticated `
    --port=80
}

if ($service -eq "both" -or $service -eq "backend") {
    Write-Host "🚀 Deploying backend to Cloud Run..."
    $envVars = "DB_NAME=$dbName,DB_USER=$dbUser,DB_PASSWORD=$dbPassword,DB_HOST=$dbHost,DB_PORT=$dbPort"
    gcloud run deploy $backendService `
    --image=$backendImage `
    --platform=managed `
    --region=$region `
    --allow-unauthenticated `
    --set-env-vars=$envVars `
    --port=5000
}

Write-Host "✅ Deployment completed."
