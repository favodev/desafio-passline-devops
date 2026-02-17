import os

from fastapi.testclient import TestClient

os.environ.setdefault("DOCKER_DATABASE_URL", "sqlite:///./test.db")

from server.app.main import app


def test_root_endpoint_returns_ok():
    client = TestClient(app)
    response = client.get("/")

    assert response.status_code == 200
    assert "Book Management App" in response.text
