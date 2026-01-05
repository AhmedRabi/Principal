
param(
  [string]$ApiName = "Principal.Api",
  [string]$WorkerName = "Principal.Worker",
  [string]$SharedName = "Principal.Shared",
  [string]$FunctionsName = "Principal.Functions",
  [string]$SpaName = "principal-spa"
)

# Ensure folders
New-Item -ItemType Directory -Force -Path src, src/api, src/worker, src/shared, src/functions, src/spa | Out-Null

# .NET solution & projects
if (-not (Test-Path "Principal.sln")) { dotnet new sln -n Principal }

# API
if (-not (Test-Path "src/api/$ApiName")) { dotnet new webapi -n $ApiName -o "src/api/$ApiName" }
dotnet sln add "src/api/$ApiName/$ApiName.csproj"

# Shared
if (-not (Test-Path "src/shared/$SharedName")) { dotnet new classlib -n $SharedName -o "src/shared/$SharedName" }
dotnet sln add "src/shared/$SharedName/$SharedName.csproj"

# Worker
if (-not (Test-Path "src/worker/$WorkerName")) { dotnet new worker -n $WorkerName -o "src/worker/$WorkerName" }
dotnet sln add "src/worker/$WorkerName/$WorkerName.csproj"

# Functions
if (-not (Test-Path "src/functions/$FunctionsName")) { dotnet new func -n $FunctionsName -o "src/functions/$FunctionsName" }

# References
pushd "src/api/$ApiName"; dotnet add reference "../../shared/$SharedName/$SharedName.csproj"; popd
pushd "src/worker/$WorkerName"; dotnet add reference "../../shared/$SharedName/$SharedName.csproj"; popd

# Packages (resilience, diagnostics)
$packages = @(
  "Polly.Extensions.Http",
  "OpenTelemetry.Extensions.Hosting",
  "OpenTelemetry.Instrumentation.AspNetCore",
  "OpenTelemetry.Exporter.Console",
  "Serilog.AspNetCore",
  "Serilog.Sinks.Console"
)
foreach ($pkg in $packages) { dotnet add "src/api/$ApiName" package $pkg }
foreach ($pkg in $packages) { dotnet add "src/worker/$WorkerName" package $pkg }

# Angular (requires Node & Angular CLI)
if (-not (Test-Path "src/spa/$SpaName")) {
  pushd src/spa
  npx -y @angular/cli new $SpaName --routing --style=scss --skip-install
  popd
}

Write-Host "Bootstrap complete. Open Principal.sln and start building."
