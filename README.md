# terminal-dotfiles

Repositorio personal para mantener configuraciones de terminal versionadas, portables y modulares en macOS, Ubuntu, Debian y AlmaLinux.

El objetivo es tener una base clara para configurar shells, aliases y variables de entorno sin mezclar secretos, datos sensibles o configuraciones específicas de una red o empresa.

## Perfiles

Este repo separa la personalización por nivel de invasión:

- `personal-full`: para Mac personal, VPS personales y homelab. Es el perfil donde se pueden activar herramientas como `zsh`, `p10k`, `eza`, `bat`, `zoxide`, `fzf`, `fastfetch` y `colorscript`.
- `lab-safe`: para VMs, laboratorios y entornos temporales. Permite personalización moderada, aliases seguros y uso de utilerías opcionales solo si ya existen.
- `work-minimal`: para servidores productivos o de trabajo. No instala paquetes adicionales y mantiene cambios mínimos por usuario.

Consulta [docs/profiles.md](docs/profiles.md) para más detalle sobre cuándo usar cada perfil.

## Seguridad

No guardes en este repositorio:

- Llaves privadas SSH.
- Tokens, contraseñas o secretos.
- IPs internas o nombres reales de infraestructura privada.
- Aliases locales sensibles.
- Configuraciones corporativas o de clientes.

Para ajustes privados usa archivos locales ignorados por Git, por ejemplo:

```sh
~/.dotfiles-local/local.aliases.local
```

Puedes usar `local/example.local` como plantilla.

## Instalación

El script `install.sh` crea symlinks desde este repositorio hacia los archivos estándar de shell del usuario:

- `shell/bashrc.minimal` -> `~/.bashrc`
- `shell/zshrc.full` -> `~/.zshrc`

También crea `~/.dotfiles-local` si no existe.

Ejecuta:

```sh
./install.sh
```

El instalador no instala paquetes. Solo prepara enlaces simbólicos y directorios locales.

## Shells soportadas

Las configuraciones están pensadas para `bash` y `zsh`.

- `shell/bashrc.minimal` es una base segura para Linux con Bash.
- `shell/zshrc.full` es una base más cómoda para macOS o entornos personales con Zsh.
- `shell/common.exports` y `shell/common.aliases` contienen configuración compartida.

La carga de herramientas opcionales es condicional: si una herramienta no existe, la shell no debe romperse.
