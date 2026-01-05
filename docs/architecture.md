
# Architecture Notes

- API: ASP.NET Core Minimal API, typed HttpClient, ProblemDetails, OTel instrumentation.
- Worker: BackgroundService loop, queue consumer pattern, graceful shutdown.
- Functions: Durable orchestrations (fan-out/fan-in), bindings placeholders.
- SPA: Angular with feature modules, OnPush, NgRx @effects/selectors, lazy routes.
- Shared: Interfaces and cross-cutting abstractions (e.g., ICorrelationContext, IResilientClient).
- Observability: App Insights + OTel exporters; correlation via W3C TraceContext.
