
# SMART Goals (Principal)

1. Resilient HTTP client library (typed + policies)
   - Specific: Typed HttpClient + retry/backoff + timeout + correlation headers
   - Measurable: <0.5% transient error; p95 <300ms
   - Achievable: IHttpClientFactory + Polly
   - Relevant: Resiliency & reusable building blocks
   - Time-bound: 3 weeks
   - Baseline: Ad-hoc clients
   - Target: Shared package used in 2 services

2. Global exception handling + ProblemDetails
   - Specific: UseExceptionHandler + standard error envelope
   - Measurable: 100% endpoints standardized; 0 leaked stack traces
   - Time-bound: 2 weeks

3. End-to-end distributed tracing (OTel + App Insights)
   - Measurable: 100% requests carry TraceId; 2 KQL dashboards
   - Time-bound: 4 weeks

4. EF Core read-optimized paths
   - Measurable: p95 query time -25%; DbContext memory -15%
   - Time-bound: 4 weeks

5. Angular SPA performance & state
   - Measurable: TTI -15%; bundle -20%; 2 NgRx stores
   - Time-bound: 5 weeks

6. CI/CD unification (GitHub Actions)
   - Measurable: Lead time <30min; 100% PR gates green
   - Time-bound: 3.5 weeks
