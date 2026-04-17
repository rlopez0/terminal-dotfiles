#!/usr/bin/env bash

# lab-safe
#
# Perfil para VMs, laboratorios y entornos temporales. Permite una
# personalización moderada sin asumir que el entorno sea permanente.
#
# Puede usar bash o zsh, aliases seguros y utilerías opcionales cuando
# ya existan en el sistema. La idea es mejorar la experiencia sin dejar
# demasiada huella.
#
# Este archivo no instala paquetes ni modifica el sistema todavía.

set -euo pipefail

printf 'Profile: lab-safe\n'
printf 'Use this profile for temporary VMs, labs and test environments.\n'
printf 'Moderate customization is allowed, but package installation is not implemented yet.\n'
