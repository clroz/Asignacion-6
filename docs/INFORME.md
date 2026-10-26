# Informe técnico

## Objetivo

Configurar una infraestructura de autenticación centralizada para proteger el acceso administrativo al router y al switch mediante Active Directory y NPS/RADIUS, manteniendo una cuenta local de respaldo y habilitando SSH.

## Componentes

1. Router Linux: `10.17.45.1/24`.
2. Switch Cisco IOSvL2: `10.17.45.2/24`.
3. Windows Server 2022: `10.17.45.10/24`.

## Active Directory

Dominio `lab.local` con los grupos de seguridad:

- `Nivel-0`: administración crítica.
- `Nivel-5`: administración intermedia.
- `Nivel-10`: acceso administrativo del laboratorio.

El usuario `radiusadmin` pertenece a `Nivel-10`.

## NPS/RADIUS

Se registraron los clientes:

| Cliente | IP | Secreto compartido |
|---|---:|---|
| Router-A6 | 10.17.45.1 | RadiusLab2026 |
| Switch-A6 | 10.17.45.2 | RadiusLab2026 |

La política `A6-Lab-Admins` concede acceso al grupo `LAB\Nivel-10` mediante PAP para la prueba de laboratorio.

## Seguridad de acceso

- Router: usuario local, SSH y `pam_radius_auth`.
- Switch: `aaa new-model`, autenticación de consola/VTY, autorización EXEC y contabilidad de sesiones.
- SSH versión 2 habilitado en el switch.
- Se mantiene la cuenta local como mecanismo de contingencia.

## Resultado

La prueba `radtest radiusadmin ...` devolvió `Access-Accept`. Los servicios RDP (3389) y WinRM (5985) del servidor estuvieron disponibles para administración y verificación.
