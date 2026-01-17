# p3-skills Architecture

## Overview

p3-skills implements a **Central Repository Pattern** for agent skills, enabling zero-duplication skill distribution across projects and agent platforms.

## Core Principles

### 1. Single Source of Truth

All skill definitions reside in the `p3-skills` repository. No duplicate copies exist in consuming projects.

### 2. Symlink-Based Distribution

Projects consume skills via symbolic links pointing to the central repository. This ensures:
- Instant updates when skills are modified
- Reduced storage overhead
- Consistent skill behavior across projects

### 3. Agent-Compatibility Layer

Skills follow the standardized format defined by:
- [OpenCode Agent Skills](https://opencode.ai/docs/skills/)
- [Anthropic Agent Skills](https://www.anthropic.com/engineering/equipping-agents-for-the-real-world-with-agent-skills)

## Directory Structure

```
p3-skills/
├── skills/              # Skill definitions (the actual content)
│   ├── development/     # Development-related skills
│   ├── legal/           # Legal/forensics skills
│   ├── productivity/    # Productivity tools
│   └── utilities/       # General utilities
├── scripts/            # Setup and maintenance scripts
├── templates/          # Skill creation templates
├── docs/               # Additional documentation
├── README.md           # Main documentation
└── .gitignore          # Git ignore patterns
```

## Skill Lifecycle

### Creation

1. Create directory: `skills/<domain>/<skill-name>/`
2. Add `SKILL.md` with proper frontmatter
3. Optionally add supporting files (scripts, docs, examples)
4. Validate using `scripts/validate_skills.sh`
5. Update symlinks using `scripts/setup_symlinks.sh`

### Distribution

Skills are automatically discovered by agents when symlinks are created in:
- `~/.config/opencode/skill/` (OpenCode)
- `~/.claude/skills/` (Claude)

Agents load skills on-demand based on the `name` and `description` frontmatter.

### Maintenance

- Update skills directly in the repository
- Changes are instantly available to all consuming projects
- No manual synchronization required

## Progressive Disclosure

Skills implement a multi-level disclosure pattern:

1. **Level 1**: Frontmatter (`name`, `description`) - loaded at agent startup
2. **Level 2**: Main `SKILL.md` content - loaded when skill is invoked
3. **Level 3+**: Referenced files - loaded on-demand as needed

This design minimizes context usage while maximizing available information.

## Security Considerations

- Skills can include executable code (scripts, binaries)
- Only install skills from trusted sources
- Review skill contents before installation
- Audit scripts and external dependencies
- Be cautious with network-accessing code

## Future Enhancements

- Skill versioning and compatibility checking
- Automated testing framework
- Skill marketplace or registry
- Dependency management between skills
- Skill composition and inheritance
