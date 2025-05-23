.PHONY: help install dev test lint format type-check clean docs

help:
	@echo "Available commands:"
	@echo "  make install    - Install package in production mode"
	@echo "  make dev        - Install package in development mode"
	@echo "  make test       - Run all tests"
	@echo "  make lint       - Run linters (ruff)"
	@echo "  make format     - Format code with black"
	@echo "  make type-check - Run type checking with mypy"
	@echo "  make clean      - Remove build artifacts"
	@echo "  make docs       - Build documentation"

install:
	pip install -e .

dev:
	pip install -e ".[dev]"
	pre-commit install

test:
	pytest

test-cov:
	pytest --cov=weave --cov-report=html --cov-report=term

lint:
	ruff check src tests

format:
	black src tests
	isort src tests

type-check:
	mypy src

clean:
	rm -rf build/
	rm -rf dist/
	rm -rf *.egg-info
	rm -rf .coverage
	rm -rf htmlcov/
	rm -rf .pytest_cache/
	rm -rf .mypy_cache/
	rm -rf .ruff_cache/
	find . -type d -name __pycache__ -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete

docs:
	@echo "Documentation building not yet configured"

all: format lint type-check test