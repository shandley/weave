"""Pytest configuration and shared fixtures."""

import pytest
from pathlib import Path


@pytest.fixture
def test_data_dir():
    """Return path to test data directory."""
    return Path(__file__).parent / "fixtures"


@pytest.fixture
def temp_workspace(tmp_path):
    """Create a temporary workspace for test execution."""
    workspace = tmp_path / "workspace"
    workspace.mkdir()
    return workspace