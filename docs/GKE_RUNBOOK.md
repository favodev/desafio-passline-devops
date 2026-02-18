# GKE Runbook (MVP)

Este runbook documenta despliegue básico en GKE usando manifiestos del directorio `k8s/`.

## Prerrequisitos

- `kubectl` configurado contra cluster GKE
- Namespace y secretos/configs definidos
- Imagen disponible en registry

## Despliegue inicial

```bash
kubectl apply -f k8s/namespace.yaml
kubectl apply -f k8s/app-configmap.yaml
kubectl apply -f k8s/db-secret.example.yaml
kubectl apply -f k8s/db-deployment.yaml
kubectl apply -f k8s/db-service.yaml
kubectl apply -f k8s/app-deployment.yaml
kubectl apply -f k8s/app-service.yaml
```

## Verificación

```bash
kubectl get pods -n bookshelf
kubectl get svc -n bookshelf
kubectl describe deploy book-api -n bookshelf
```

Validar healthcheck:
- endpoint `/health` debe responder `200`.

## Rolling update

```bash
kubectl set image deployment/book-api book-api=<new-image> -n bookshelf
kubectl rollout status deployment/book-api -n bookshelf
```

## Rollback

```bash
kubectl rollout undo deployment/book-api -n bookshelf
kubectl rollout status deployment/book-api -n bookshelf
```

## Notas

- Para esta prueba se entrega enfoque MVP reproducible.
- Si no hay cluster GKE real, este runbook define pasos exactos de ejecución.
