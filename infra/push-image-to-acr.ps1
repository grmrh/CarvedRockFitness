# push container image to Azure Container Registry (ACR)
az acr build `
  --registry grrhecrfacr001 `
  --image grrhe-crf-app:latest `
  --file Dockerfile `
  .