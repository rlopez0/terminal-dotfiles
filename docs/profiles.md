# Profiles

Los perfiles definen qué tan invasiva puede ser la personalización de terminal según el tipo de máquina.

## personal-full

Usa `personal-full` en máquinas donde tienes control completo:

- Mac personal.
- VPS personales.
- Servidores de homelab.

En este perfil se permite instalar paquetes y activar herramientas de experiencia de terminal como `zsh`, `p10k`, `eza`, `bat`, `zoxide`, `fzf`, `fastfetch` y `colorscript`.

Debe seguir evitando secretos, llaves privadas, IPs internas reales y aliases sensibles. La personalización puede ser amplia, pero el repositorio debe seguir siendo portable y publicable.

## lab-safe

Usa `lab-safe` en entornos temporales:

- VMs de práctica.
- Laboratorios.
- Máquinas de prueba.

Este perfil permite personalización moderada. Puede usar `bash` o `zsh`, aliases seguros y utilerías opcionales cuando ya existen en el sistema.

La intención es mejorar la comodidad sin asumir que la VM será permanente ni modificar demasiado el entorno base.

## work-minimal

Usa `work-minimal` en servidores de trabajo, servidores productivos o cualquier entorno donde convenga reducir riesgo y sorpresa.

Este perfil no instala paquetes porque en ambientes productivos el inventario de software, las dependencias y los cambios del sistema suelen estar controlados por políticas, automatización o equipos externos. Instalar herramientas manualmente puede romper expectativas operativas, auditoría o soporte.

Solo se permiten cambios mínimos por usuario:

- Prompt simple con color.
- Aliases seguros.
- Exports básicos.

La meta es tener una shell cómoda sin modificar el sistema ni introducir dependencias externas.
