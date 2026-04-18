# Cheat Sheet

Comandos prácticos para usar `terminal-dotfiles`.

## Instalación Base

Configura symlinks y archivos locales. No instala paquetes.

```sh
./install.sh
```

## Paquetes Opcionales

Modo seguro para equipos personales, VPS o laboratorios:

```sh
./bootstrap/install-packages.sh safe
```

Modo completo para entornos personales donde quieres más herramientas:

```sh
./bootstrap/install-packages.sh full
```

En Debian/Ubuntu, `full` intenta instalar herramientas adicionales como `eza` si están disponibles en los repositorios configurados.

En servidores productivos de trabajo usa solo:

```sh
./install.sh
```

No corras el bootstrap de paquetes en servidores productivos de trabajo.

## Actualizar Repo

```sh
git pull
```

## Recargar Shell

Bash:

```sh
source ~/.bashrc
exec bash
```

Zsh:

```sh
zsh
```
