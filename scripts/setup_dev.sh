#!/bin/bash
# Development environment setup script for Weave

set -e  # Exit on error

echo "🚀 Setting up Weave development environment..."

# Check Python version
python_version=$(python3 --version 2>&1 | awk '{print $2}')
required_version="3.11"

if ! python3 -c "import sys; exit(0 if sys.version_info >= (3, 11) else 1)"; then
    echo "❌ Error: Python 3.11+ is required (found $python_version)"
    exit 1
fi

echo "✅ Python $python_version"

# Create virtual environment if it doesn't exist
if [ ! -d "venv" ]; then
    echo "📦 Creating virtual environment..."
    python3 -m venv venv
else
    echo "✅ Virtual environment exists"
fi

# Activate virtual environment
echo "🔄 Activating virtual environment..."
source venv/bin/activate

# Upgrade pip
echo "📦 Upgrading pip..."
pip install --upgrade pip setuptools wheel

# Install package in development mode
echo "📦 Installing Weave in development mode..."
if [ -f "pyproject.toml" ]; then
    pip install -e ".[dev]"
else
    echo "⚠️  Warning: pyproject.toml not found, skipping package installation"
fi

# Install pre-commit hooks
if [ -f ".pre-commit-config.yaml" ]; then
    echo "🔗 Installing pre-commit hooks..."
    pip install pre-commit
    pre-commit install
else
    echo "⚠️  Warning: .pre-commit-config.yaml not found, skipping pre-commit setup"
fi

# Check for Docker
if command -v docker &> /dev/null; then
    echo "✅ Docker is installed"
else
    echo "⚠️  Warning: Docker not found - required for container execution"
fi

echo ""
echo "✨ Development environment setup complete!"
echo ""
echo "To activate the environment in the future, run:"
echo "  source venv/bin/activate"
echo ""
echo "Next steps:"
echo "  1. Run tests: make test"
echo "  2. Start coding: code ."
echo "  3. Read docs: make docs"