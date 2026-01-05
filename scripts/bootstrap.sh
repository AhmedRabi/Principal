
#!/usr/bin/env bash
set -euo pipefail
API_NAME=Principal.Api
WORKER_NAME=Principal.Worker
SHARED_NAME=Principal.Shared
FUNCTIONS_NAME=Principal.Functions
SPA_NAME=principal-spa

mkdir -p src/api src/worker src/shared src/functions src/spa

[ -f Principal.sln ] || dotnet new sln -n Principal
[ -d src/api/$API_NAME ] || dotnet new webapi -n $API_NAME -o src/api/$API_NAME
[ -d src/shared/$SHARED_NAME ] || dotnet new classlib -n $SHARED_NAME -o src/shared/$SHARED_NAME
[ -d src/worker/$WORKER_NAME ] || dotnet new worker -n $WORKER_NAME -o src/worker/$WORKER_NAME

# Add to solution
dotnet sln add src/api/$API_NAME/$API_NAME.csproj
dotnet sln add src/shared/$SHARED_NAME/$SHARED_NAME.csproj
dotnet sln add src/worker/$WORKER_NAME/$WORKER_NAME.csproj

# References
dotnet add src/api/$API_NAME/$API_NAME.csproj reference src/shared/$SHARED_NAME/$SHARED_NAME.csproj
dotnet add src/worker/$WORKER_NAME/$WORKER_NAME.csproj reference src/shared/$SHARED_NAME/$SHARED_NAME.csproj

echo "Bootstrap done"
