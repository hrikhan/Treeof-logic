# Codex Instructions

These guidelines describe how Codex should work inside this portfolio Flutter project.

## Feature structure

- Organize every feature as `<feature>` → `controller (GetX)` → `model` → `view`, and nest views as `widgets` → `screen`.
- Keep every widget in its own file, and pair each file with a dedicated controller where state or actions are required.
- When a widget is fully reusable across features, move it into `core/common/widgets` and reuse it immediately.

## Widget and controller rules

- Prefer modern, flexible Flutter widgets (e.g., `Sliver`, `AnimatedContainer`, responsive layout builders) and keep code human-readable with clear names and short helper functions.
- Ensure each widget file stays within 250‑300 lines; break large widgets into smaller composable widgets tied to their own files/controllers.
- Controllers belong as close to the widget as possible; avoid generic global controllers unless the state truly spans multiple screens.
- Apply hover effects or subtle animations only when they don’t harm the web experience; keep them performant and unobtrusive.

## Design & responsiveness

- Treat the project as a polished portfolio: use clean, modern design with responsive layouts for mobile, tablet, and web breakpoints.
- Favor flexible UI patterns such as `LayoutBuilder`, `ResponsiveGrid`, or `MediaQuery`-driven spacing so content adapts fluidly to different screen sizes.
- Keep interactions smooth and lightweight; avoid heavy visuals that would degrade the experience on standard devices.

Every time you contribute, follow these rules to keep the build consistent, maintainable, and true to the portfolio intent.
