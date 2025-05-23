# Contributing to Weave

Thank you for your interest in contributing to Weave! This document provides guidelines and instructions for contributing.

## Code of Conduct

By participating in this project, you agree to abide by our Code of Conduct. Please read CODE_OF_CONDUCT.md.

## How to Contribute

### Reporting Issues

- Use the GitHub issue tracker to report bugs
- Check existing issues before creating a new one
- Include as much detail as possible:
  - Steps to reproduce
  - Expected behavior
  - Actual behavior
  - System information

### Suggesting Features

- Open a GitHub issue with the "enhancement" label
- Describe the feature and its use case
- Discuss before implementing major changes

### Contributing Code

1. **Fork the repository**
2. **Create a feature branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```
3. **Make your changes**
   - Follow the coding standards
   - Add tests for new functionality
   - Update documentation as needed
4. **Run tests and linting**
   ```bash
   make test
   make lint
   ```
5. **Commit your changes**
   - Use clear, descriptive commit messages
   - Follow conventional commit format
6. **Push to your fork**
   ```bash
   git push origin feature/your-feature-name
   ```
7. **Create a Pull Request**
   - Target the `develop` branch
   - Fill out the PR template
   - Link related issues

## Development Setup

```bash
# Clone your fork
git clone https://github.com/YOUR_USERNAME/weave.git
cd weave

# Add upstream remote
git remote add upstream https://github.com/shandley/weave.git

# Create virtual environment
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install development dependencies
pip install -e ".[dev]"

# Install pre-commit hooks
pre-commit install
```

## Coding Standards

- **Python Style**: Follow PEP 8, enforced by Black formatter
- **Type Hints**: Use type hints for all function signatures
- **Docstrings**: Write clear docstrings for all public functions
- **Tests**: Maintain test coverage above 90%

## Testing

```bash
# Run all tests
make test

# Run specific test file
pytest tests/unit/test_patterns.py

# Run with coverage
pytest --cov=weave --cov-report=html
```

## Documentation

- Update documentation for any user-facing changes
- Use clear, concise language
- Include code examples where appropriate
- Check spelling and grammar

## Pull Request Process

1. Update the README.md with details of changes if needed
2. Update the CHANGELOG.md following Keep a Changelog format
3. Ensure all tests pass and coverage remains high
4. Request review from maintainers
5. Address review feedback promptly

## Pattern Contributions

When contributing new patterns:

1. Create pattern class in `src/weave/patterns/`
2. Implement detection logic
3. Define operation sequence
4. Add comprehensive tests
5. Document with examples
6. Submit pattern proposal issue first for discussion

## Questions?

Feel free to:
- Open a GitHub issue
- Start a discussion
- Contact maintainers

Thank you for contributing to Weave!