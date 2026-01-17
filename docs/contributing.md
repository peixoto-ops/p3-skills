# Contributing to p3-skills

Contributions are welcome! This document outlines the guidelines for contributing to the p3-skills repository.

## Getting Started

1. Fork the repository
2. Clone your fork locally
3. Create a new branch for your changes
4. Make your changes following these guidelines
5. Submit a pull request

## Skill Development Guidelines

### Naming Conventions

- **Skill names**: Use `kebab-case` (lowercase with hyphens)
- Must match regex: `^[a-z0-9]+(-[a-z0-9]+)*$`
- Be descriptive and concise
- 1-64 characters maximum

### SKILL.md Structure

Every skill must have a `SKILL.md` file with YAML frontmatter:

```yaml
---
name: your-skill-name
description: Clear description of what this skill does (1-1024 characters)
license: MIT  # or other OSI-approved license
compatibility: opencode,claude  # comma-separated list
metadata:
  author: Your Name
  version: 1.0.0
  category: category-name  # development, legal, productivity, utilities
---
```

### Content Guidelines

- Keep descriptions specific and actionable
- Use bullet points for clarity
- Include "When to use me" section
- Reference additional files when content grows large
- Document any dependencies clearly

### Domain Categories

Place skills in appropriate domain directories:

- **development**: Code, Git, testing, CI/CD, debugging
- **legal**: Document analysis, contracts, forensics, compliance
- **productivity**: Project management, automation, workflows
- **utilities**: File operations, text processing, system tasks

## Validation

Before submitting, run the validation script:

```bash
./scripts/validate_skills.sh
```

This checks:
- Valid YAML frontmatter
- Required fields present
- Naming conventions followed
- File structure compliance

## Testing

If your skill includes executable code:

1. Test scripts in isolation
2. Document dependencies clearly
3. Handle errors gracefully
4. Use shebangs for scripts: `#!/usr/bin/env bash` or `#!/usr/bin/env python3`

## Documentation

- Update README.md if adding new domains
- Document breaking changes
- Include usage examples
- Explain complex logic in comments

## Code Style

- Follow existing conventions
- Use snake_case for Python
- Use kebab-case for file/directory names
- Keep code modular and reusable
- Add comments for non-obvious logic

## Pull Request Process

1. Ensure your branch is up to date with main
2. Include a clear title and description
3. Reference related issues
4. Respond to review feedback promptly
5. Keep PRs focused and small

## License

By contributing, you agree that your contributions will be licensed under the MIT License (unless otherwise specified in the skill).

## Questions?

Open an issue for questions or discussion.
