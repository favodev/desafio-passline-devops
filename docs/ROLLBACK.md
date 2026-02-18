# Rollback Runbook

Runbook de rollback para incidentes en despliegues de la API.

## Cuándo ejecutar rollback

- Smoke test falla después de despliegue.
- Errores 5xx sostenidos tras release.
- Regresión funcional crítica validada.

## Estrategias de rollback

### Estrategia A: rollback de imagen (recomendada)

1. Identificar última imagen estable.
2. Actualizar variable `image` del ambiente (`dev` o `prod`) con la versión estable.
3. Ejecutar `terraform plan` y validar cambios esperados.
4. Ejecutar `terraform apply`.
5. Ejecutar smoke test (`/health`).

### Estrategia B: rollback por revisión en Cloud Run

(Solo si se despliega en GCP real)

1. Identificar revisión anterior estable.
2. Redirigir tráfico a revisión estable.
3. Verificar métricas y `/health`.

## Comandos guía (IaC)

```bash
cd infra/envs/prod
terraform plan -var="image=<previous-stable-image>"
terraform apply -var="image=<previous-stable-image>"
```

## Checklist post-rollback

- [ ] Servicio responde `200` en `/health`.
- [ ] Error rate vuelve a umbral aceptable.
- [ ] Incidente documentado en PR/release notes.
- [ ] Definir acción preventiva para evitar recurrencia.
