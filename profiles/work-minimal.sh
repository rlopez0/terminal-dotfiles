#!/usr/bin/env bash

# work-minimal
#
# Perfil para servidores productivos o de trabajo. Debe mantenerse
# conservador, portable y fácil de retirar.
#
# Reglas de este perfil:
# - No instalar paquetes adicionales.
# - Usar solo cambios mínimos por usuario.
# - Permitir un prompt simple con color.
# - Permitir aliases seguros.
# - Permitir exports básicos.
#
# Este archivo no instala paquetes ni modifica el sistema.

set -euo pipefail

printf 'Profile: work-minimal\n'
printf 'Use this profile for production or work servers.\n'
printf 'No package installation should happen in this profile.\n'
