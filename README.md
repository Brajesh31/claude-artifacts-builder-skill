# claude-artifacts-builder-skill

A Claude Code skill for creating polished, multi-component web artifacts with modern frontend tooling.

## Overview

This skill supports interactive artifacts that need more structure than a single static HTML page. It provides a workflow for initializing a frontend project, building components and stateful interactions, and bundling the result into a portable HTML artifact.

The documented stack includes React, TypeScript, Vite, Tailwind CSS, and shadcn/ui components, with a bundling step for the final output.

## When to Use It

Use this skill when creating:

- Interactive dashboards and data views.
- Multi-step user interfaces.
- Stateful tools and calculators.
- Multi-component prototypes.
- Interactive documentation or demonstrations.
- Artifacts that need reusable UI components or routing.

For a simple static page with minimal markup, a smaller implementation may be more appropriate.

## Installation

```bash
git clone https://github.com/Brajesh31/claude-artifacts-builder-skill.git ~/.claude/skills/artifacts-builder
```

Review the package requirements and scripts before running them.

## Quick Start

Initialize a new artifact project:

```bash
bash scripts/init-artifact.sh my-artifact
```

Develop the project in the generated directory. When it is ready, bundle it:

```bash
bash scripts/bundle-artifact.sh my-artifact
```

Check the script output for the final HTML artifact location.

## Recommended Workflow

1. Clarify the artifact's purpose and expected user interaction.
2. Identify the required components and state.
3. Initialize the project with the provided script.
4. Build the smallest complete user journey.
5. Add styling and responsive behavior.
6. Validate forms, navigation, and interactive states.
7. Bundle the application.
8. Open the bundled output and verify it independently.
9. Review performance and accessibility before delivery.

## Design Principles

- Establish a clear visual hierarchy.
- Use typography and spacing consistently.
- Avoid generic layouts and excessive decoration.
- Make interactive states obvious.
- Keep components focused and reusable.
- Use color to communicate meaning, not as a substitute for labels.
- Ensure the artifact works at the intended viewport sizes.
- Keep the final interface understandable without hidden context.

## Repository Scripts

| Script | Purpose |
|---|---|
| `scripts/init-artifact.sh` | Create a starter artifact project |
| `scripts/bundle-artifact.sh` | Bundle the project into a single HTML file |

## Validation Checklist

- Initialization completes successfully.
- Dependencies install cleanly.
- Development build works.
- Interactive states behave correctly.
- Responsive layouts are checked.
- No required assets are missing from the bundle.
- Final HTML opens in the target environment.
- Console errors and broken interactions are resolved.

## Repository Contents

- `SKILL.md`: Main artifact-building workflow.
- `scripts/init-artifact.sh`: Project initialization.
- `scripts/bundle-artifact.sh`: Final bundling.
- `README.md`: Usage, design, and validation guidance.

## Practical Note

A successful development preview does not guarantee that the bundled artifact will work. Always inspect the final generated HTML as a separate validation step.
