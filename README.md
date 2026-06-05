# Carved Rock Fitness

The application was created using `dotnet new`:

```bash
dotnet new blazor --framework "net8.0" --empty --no-https
```

```bash  -- use a PAT with only read access to the repo - PAT Classic
az acr task create \
--registry $ACR \
--name buildcrf \
--image crf:{{.Run.ID}} \
--context https://github.com/grmrh/CarvedRockFitness#main \
--file Dockerfile \
--git-access-token <classic PAT>
```

```bash
az acr task show --name buildcrf --registry $ACR --output table
```

