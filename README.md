# Homebrew Tap for clemp

This tap contains the Homebrew formula for [clemp](https://github.com/bn-l/clemp).

## Installation

```bash
brew tap bn-l/clemp
brew install clemp
```

Or install directly:

```bash
brew install bn-l/clemp/clemp
```

## What is clemp?

clemp is a CLI tool to clone and configure the claude-template repository for your projects. It:

- Clones a configurable GitHub template repo
- Renders CLAUDE.md with language-specific rules
- Configures hooks and MCP servers
- Copies the configuration files to your working directory

## Usage

```bash
clemp typescript --hooks sound --mcp context7
```
