# Release Process

Proceso de release definido para esta prueba técnica, orientado a trazabilidad y cambios pequeños.

## 1) Desarrollo
- Crear rama desde `main` (`feat/*`, `fix/*`, `docs/*`, `chore/*`).
- Implementar cambios acotados por objetivo.
- Validar localmente (al menos `docker compose up --build` cuando aplique).

## 2) Pull Request
- Abrir PR hacia `main`.
- Incluir en descripción:
	- objetivo,
	- archivos impactados,
	- validación realizada,
	- riesgos/puntos pendientes.

## 3) Merge
- Merge solo cuando la revisión esté conforme.
- Preferir PRs pequeñas para facilitar auditoría de cambios.

## 4) Versionado
- Convención sugerida: SemVer (`v0.x.y` durante la prueba).
- Crear tag anotado al cerrar un hito relevante.

Ejemplo:
```bash
git tag -a v0.1.0 -m "baseline: etapa inicial cerrada"
git push origin v0.1.0
```

## 5) GitHub Release
- Crear release en GitHub a partir del tag.
- Incluir resumen de cambios y evidencia principal.

## 6) Checklist de salida
- [ ] `SUBMISSION.md` actualizado.
- [ ] `AI_USAGE.md` actualizado si hubo apoyo de IA.
- [ ] Documentación alineada con el estado real del repo.
- [ ] Sin secretos en commits.
