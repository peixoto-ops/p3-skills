# p3-skills

Central repository for Agent Skills designed for OpenCode, Claude Desktop, and Qwen CLI agents.

## Overview

`p3-skills` serves as a **"Source of Truth"** for reusable agent capabilities. Instead of duplicating skill definitions across projects, this repository provides a centralized hub that is consumed via **symbolic links** (symlinks).

### Key Benefits

- **Single Source of Truth**: Update skills in one place, reflect everywhere
- **Zero Duplication**: Projects reference skills via symlinks, not copies
- **Cross-Platform Compatible**: Works with OpenCode, Claude, and other skill-enabled agents
- **Domain-Organized**: Categorized for developers and legal professionals

## Architecture

### Directory Structure

```
p3-skills/
├── skills/                    # All skill definitions
│   ├── development/           # Dev-focused skills (git, CI/CD, code review)
│   ├── legal/                # Legal & forensics skills (docs, contracts)
│   ├── productivity/          # Common productivity tools
│   └── utilities/             # General-purpose utilities
├── scripts/                   # Setup and maintenance scripts
├── templates/                 # Skill creation templates
└── docs/                     # Additional documentation
```

### Skill Format

Each skill follows the **Agent Skills standard** (OpenCode/Anthropic):

```
skills/<domain>/<skill-name>/
└── SKILL.md
```

`SKILL.md` must include YAML frontmatter:

```yaml
---
name: skill-name
description: Brief description (1-1024 chars)
license: MIT
compatibility: opencode,claude
---

## What I do
- Skill capabilities

## When to use me
Usage guidelines
```

## Installation

### Quick Setup

Run the provided setup script to create symlinks in your agent configuration directories:

```bash
cd p3-skills
./scripts/setup_symlinks.sh
```

This script automatically:
- Detects `~/.config/opencode/skill/` and `~/.claude/skills/`
- Creates symlinks for each domain category
- Validates existing links before creation

### Manual Installation

Create symlinks manually to your preferred locations:

```bash
ln -s /path/to/p3-skills/skills/legal ~/.config/opencode/skill/legal
ln -s /path/to/p3-skills/skills/development ~/.config/opencode/skill/development
```

## Usage

Once installed via symlinks, skills are automatically discovered by supported agents.

### Using Skills in OpenCode/Claude

The `skill` tool lists available skills based on the `name` and `description` in each `SKILL.md`. Agents load skills on-demand when relevant to the current task.

### Adding New Skills

1. Create a new directory in the appropriate domain folder
2. Add a `SKILL.md` file with proper frontmatter
3. Run `./scripts/setup_symlinks.sh` to update symlinks

Example:
```bash
mkdir -p skills/development/my-new-skill
# Create SKILL.md with name and description
./scripts/setup_symlinks.sh
```

## Domain Categories

### Development (`development/`)
- `git-workflow`: Git operations and workflows
- `code-review`: Code review assistance
- `testing`: Test generation and execution
- `ci-cd`: CI/CD pipeline configuration
- `debugging`: Debugging strategies
- `documentation`: Documentation generation

### Legal (`legal/`)
- `document-analysis`: Legal document analysis
- `contract-review`: Contract review assistance
- `legal-research`: Legal research workflows
- `forensics`: Digital forensics procedures
- `compliance`: Compliance checking

### Productivity (`productivity/`)
- `project-management`: Project organization
- `note-taking`: Note structuring
- `automation`: Task automation
- `workflow-templates`: Reusable workflow patterns

### Utilities (`utilities/`)
- `file-operations`: File manipulation
- `text-processing`: Text transformation
- `data-conversion`: Format conversion
- `system-administration`: System tasks

## Contributing

Contributions are welcome! Follow these guidelines:

1. **Skill Naming**: Use lowercase with hyphens (kebab-case)
2. **Frontmatter**: Must include `name` and `description`
3. **Descriptions**: Keep them concise (1-1024 chars)
4. **Testing**: Run `./scripts/validate_skills.sh` before submitting

## License

This repository aggregates skills with individual licenses. Each `SKILL.md` may specify its own license. Default is MIT.

## Inspired By

- [OpenCode Agent Skills](https://opencode.ai/docs/skills/)
- [Anthropic Agent Skills](https://www.anthropic.com/engineering/equipping-agents-for-the-real-world-with-agent-skills)
