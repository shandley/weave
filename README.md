# Weave

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

🚧 **Under Active Development** - Not yet ready for production use.

See [IMPLEMENTATION_PLAN.md](IMPLEMENTATION_PLAN.md) for development roadmap.

## Contributing

We welcome contributions! See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## License

[License details to be determined]