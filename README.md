# LiquiBot — Dashboard Mockup

Interactive click-through prototype of the **LiquiBot** product: AI-powered liquidity
forecasting for small and mid-cap businesses in the DACH region.

> ⚠️ This is a **mockup for pitch / concept purposes**. There is no backend, no data
> connections and no authentication. All figures are illustrative — grounded in real
> 2026 reference points (ECB main refinancing rate 2.15 %, German HICP inflation
> ~2.9 %, SMARD electricity/gas price references) but not a live forecast.

## Run it

It's a single self-contained HTML file — just open `index.html` in a browser.
No build step, no dependencies to install (Chart.js loads from a CDN at runtime).

## What's inside

- **Onboarding wizard** (7 steps) — company, cash position, monthly cash flow, energy
  exposure, obligations, inventory, review. Inputs are stored in `localStorage` and
  turned into a company profile that drives the whole dashboard. Three demo companies
  are included, or enter your own numbers.
- **Forecast** — cash position over the next 12 weeks with a P10–P90 confidence band,
  a "today" divider, KPI tiles (low point, worst case, runway confidence gauge), a
  low-point driver breakdown, and a scenario panel (electricity/gas price shocks,
  slower receivables, extra hires, reorder timing, sourcing plan, presets).
- **Market risk** — SMARD electricity & gas price paths with flagged risks.
- **Inventory** — stock cover and carrying cost, reorder timing aligned to the forecast.
- **Orders & sourcing** — order book (delivered + pipeline). Pipeline orders without a
  bill of materials are matched to the closest past order and their material mix
  inferred. Aggregated into weekly material demand, a market-price analysis with
  automatic price step-up detection, and an AI procurement recommendation
  (buy-ahead vs. just-in-time). A toggle folds the buying plan into the liquidity
  forecast.
- **AI assistant** — a floating chat (rule-based mock, not a real model) that answers
  from the live forecast numbers, plus a marker on the chart at the critical point.

## Tech

Single HTML file, no framework. Chart.js 4.4.4 (CDN, with a fallback CDN).
Fonts: Bricolage Grotesque · Hanken Grotesk · IBM Plex Mono. Light/dark theme.
Brand: navy `#001748` + mint `#64D693`.
