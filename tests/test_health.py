import os

from fastapi.testclient import TestClient

os.environ.setdefault("DOCKER_DATABASE_URL", "sqlite:///./test.db")

from server.app.main import app


def test_health_endpoint_returns_ok_json():
    client = TestClient(app)
    response = client.get("/health")

    assert response.status_code == 200
    assert response.json() == {"status": "ok"}
