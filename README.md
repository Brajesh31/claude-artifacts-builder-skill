# Artifacts Builder

Build polished, interactive, multi-component web artifacts using modern frontend technologies.

## Features

- Focused workflows and domain-specific guidance.
- Practical examples and implementation recommendations.
- Best practices and validation considerations.

## Installation

Copy the skill into your agent skills directory:

```bash
mkdir -p .claude/skills/artifacts-builder
cp SKILL.md .claude/skills/artifacts-builder/SKILL.md
```

## Usage

Ask your AI coding assistant to use **Artifacts Builder** when working on a related task. Follow the instructions in `SKILL.md`.

## Repository Contents

- `SKILL.md`: Skill instructions.
- `README.md`: Overview and installation guidance.
- `LICENSE`: MIT License.

## License

MIT License. See [LICENSE](LICENSE).

## Additional Resources

Added `scripts/init-artifact.sh` to scaffold a starter artifact and `scripts/bundle-artifact.sh` to produce a single HTML file. Run with `bash scripts/init-artifact.sh <project-name>` and `bash scripts/bundle-artifact.sh <project-directory>`.
