az acr task create \
  --registry grrhecrfacr001 \
  --name build-webapp \
  --context https://github.com/grmrh/CarvedRockFitness.git \
  --file Dockerfile \
  --image grrhe-crf-app:latest:{{.Run.ID}} \
  --git-access-token $GIT_PAT