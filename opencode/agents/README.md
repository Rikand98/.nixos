# Opencode Agents Index

This folder contains custom agents for this NixOS configuration project.

## Local Agents (Project-Specific)

| Agent | Description |
|-------|-------------|
| **nixos-master.md** | NixOS/Nix language expert - flakes, modules, nixvim |
| **linux-master.md** | Linux system admin - kernel, networking, desktop envs |

## Referenced Global Agents

The following agents from `~/.config/opencode/agents/` are recommended for this project:

### Infrastructure & DevOps
| Agent | Path | Description |
|-------|------|-------------|
| infrastructure-maintainer | ~/.config/opencode/agents/infrastructure-maintainer.md | System reliability, IaC patterns |
| devops-automator | ~/.config/opencode/agents/devops-automator.md | CI/CD, automation, deployment |
| sre-site-reliability | ~/.config/opencode/agents/sre-site-reliability-engineer.md | SLOs, observability, incident response |

### Security
| Agent | Path | Description |
|-------|------|-------------|
| security-engineer | ~/.config/opencode/agents/security-engineer.md | Security hardening, threat modeling |

### Code Quality
| Agent | Path | Description |
|-------|------|-------------|
| code-reviewer | ~/.config/opencode/agents/code-reviewer.md | Code review best practices |

## Usage

To use a global agent, reference its full path in prompts:
```
Use the agent at ~/.config/opencode/agents/infrastructure-maintainer.md
```

Or simply mention the agent name in your request - the AI will find it from the global config.

## Adding New Agents

Add project-specific agents to this folder. For global agents, prefer referencing the global config to avoid duplication.

## All Available Global Agents

For reference, the full set of global agents is in:
```
~/.config/opencode/agents/
```

Common useful ones for this project:
- git-workflow-master.md
- terminal-integration-specialist.md
- software-architect.md
- senior-developer.md