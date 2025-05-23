# Weave

[![Development Status](https://img.shields.io/badge/status-pre--alpha-red)](https://github.com/shandley/weave)
[![Python Version](https://img.shields.io/badge/python-3.11%2B-blue)](https://www.python.org/downloads/)
[![License](https://img.shields.io/badge/license-Apache%202.0-green)](LICENSE)
[![Code Style](https://img.shields.io/badge/code%20style-black-000000.svg)](https://github.com/psf/black)

Pattern-based AI work orchestration platform that adapts to any technical workflow.

## What is Weave?

Weave is an API-first platform that enables safe, autonomous AI-assisted technical work across any domain. Instead of prescribing specific use cases, Weave recognizes universal work patterns and adapts to your iterative technical workflows.

## Key Features

- 🧠 **Pattern Recognition**: Automatically detects work patterns from natural language
- 🔒 **Adaptive Safety**: Context-aware security that emerges from usage
- 🚀 **24/7 Autonomous Work**: Execute tasks continuously with progressive trust
- 🎯 **Universal Operations**: All work reduces to common, composable primitives
- 🔄 **Multi-Provider AI**: Works with Claude, GPT-4, and local models
- 📦 **Container Isolation**: Every execution in secure, rollback-capable environments

## Quick Start

```bash
# Using the CLI (primary interface)
$ weave "analyze these error logs for patterns"
$ weave "refactor this function for clarity" --file main.py
$ weave --yolo "try different ways to optimize this query"

# Using the Python SDK
from weave import Client

client = Client()
result = await client.execute("generate unit tests for user.py")
```

## Installation

```bash
# Install CLI
pip install weave-ai

# Or clone for development
git clone https://github.com/shandley/weave.git
cd weave
pip install -e ".[dev]"
```

## Documentation

- [Getting Started](docs/getting_started.md)
- [Architecture Overview](docs/architecture.md)
- [Pattern Development](docs/patterns.md)
- [API Reference](docs/api.md)

## Project Status

🚧 **Pre-Alpha Development** - Not yet ready for production use.

### Current Focus
- Setting up project infrastructure
- Implementing core pattern recognition system
- Building container execution environment
- Developing initial CLI interface

See [IMPLEMENTATION_PLAN.md](IMPLEMENTATION_PLAN.md) for detailed development roadmap.

## Architecture

Weave is built as an API-first platform with multiple interfaces:

```
┌─────────────┐ ┌─────────────┐ ┌─────────────┐
│     CLI     │ │   Web UI    │ │    SDKs     │
└──────┬──────┘ └──────┬──────┘ └──────┬──────┘
       └───────────────┴───────────────┘
                       │
            ┌──────────┴──────────┐
            │   Core API Server   │
            │  (Pattern Engine)   │
            └─────────────────────┘
```

## Development

### Prerequisites
- Python 3.11 or higher
- Docker for container execution
- Git for version control

### Setup
```bash
# Clone the repository
git clone https://github.com/shandley/weave.git
cd weave

# Create virtual environment
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install development dependencies
pip install -e ".[dev]"

# Run tests
make test
```

## Contributing

We welcome contributions! See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

### Key Areas for Contribution
- Pattern implementations
- Safety framework enhancements
- Documentation improvements
- Test coverage expansion
- CLI usability features

## Security

For security concerns, please see our [Security Policy](SECURITY.md).

## License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Inspired by the need for safe, pattern-based AI work orchestration
- Built with modern Python tooling and best practices
- Designed for extensibility and community contribution