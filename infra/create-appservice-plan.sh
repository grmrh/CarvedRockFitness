# Appservice plan create
NAME='grrhe-crf-linux-asp-001'
RG='grrhe-container-rg-001'
az appservice create \
--name $NAME \
--resource-group $RG \
--location centralus \
--is-linux \
--sku B1
