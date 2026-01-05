
# Principal Starter Repo

This repository bootstraps the work needed to achieve your SMART goals across **.NET**, **Angular**, **Azure Functions**, **Observability**, and **CI/CD**.

> Quick start on Windows:
>
> 1. Create the target folder and extract the archive:
>    ```powershell
>    New-Item -Path 'D:\Career development' -ItemType Directory -Force
>    Expand-Archive -Path .\principal-starter-repo.zip -DestinationPath 'D:\Career development\PrincipalStarterRepo' -Force
>    ```
> 2. Run the bootstrap script to scaffold projects and install packages:
>    ```powershell
>    Set-Location 'D:\Career development\PrincipalStarterRepo'
>    .\scripts\bootstrap.ps1
>    ```
> 3. Initialize git and push to your remote:
>    ```powershell
>    git init
>    git add .
>    git commit -m "chore: initial starter repo"
>    git branch -M main
>    git remote add origin <YOUR_GITHUB_REPO_URL>
>    git push -u origin main
>    ```
>
> 4. Open in VS Code:
>    ```powershell
>    code .
>    ```

## Folders
- `src/api` – ASP.NET Core Web API (typed HttpClient, ProblemDetails, OpenTelemetry hooks)
- `src/worker` – .NET Worker Service (BackgroundService, queue processor)
- `src/functions` – Azure Functions (Durable Functions template + placeholders)
- `src/spa` – Angular application (OnPush, NgRx, lazy loading)
- `src/shared` – Shared .NET library (contracts, cross-cutting abstractions)
- `.github/workflows` – GitHub Actions pipelines for CI/CD
- `docs` – SMART goals, weekly checklist, architecture and observability notes
- `scripts` – Bootstrap scripts (`ps1` and `sh`)

## Next steps
- Update **Owner Email** and secrets in pipelines.
- Configure Azure resources (App Insights, Key Vault, Service Bus) and add connection strings in `appsettings.*.json`.
- Use the Excel we prepared to track progress: add links to artifacts in `docs/weekly-checklist.md` as you complete each item.
