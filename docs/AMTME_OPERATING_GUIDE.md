# AMTME Operating Guide

## Objetivo
Operar AMTME Studio OS como sistema editorial y operativo modular, con control de calidad técnico, seguridad básica y trazabilidad por fase.

## Módulos principales
- Dashboard operativo (`/dashboard`)
- Documento maestro (`/documento-maestro`)
- Gestión de episodios y workspace (`/episodios`, `/episodios/[episodeId]`)
- Creador visual (`/creador-visual`)
- Automatización controlada (`/automatizacion`)
- Verificador y política operativa (`/verificador`, `/politica-operativa`)

## Reglas operativas
1. Mantener cambios pequeños, auditables y reversibles.
2. No introducir features nuevas durante fases de cierre.
3. No exponer secretos ni claves sensibles en código cliente.
4. Ejecutar validaciones técnicas antes de merge.
5. No cerrar issues maestros hasta completar validación post-merge.
6. Mantener documentación alineada con estado real de `main`.

## Política de alcance
- Permitido en cierre: QA, documentación, validación y estabilización.
- Fuera de alcance: automatizaciones nuevas, APIs externas, cron jobs, Edge Functions, publicación automática y DMs automáticos.
