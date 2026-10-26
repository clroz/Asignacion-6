# Guía para el video (máximo 10 minutos)

## 1. Presentación

Mostrar fecha y hora, la cara y explicar que la matrícula es `20221745`.

## 2. Topología y direccionamiento

Mostrar `docs/topologia.png` y explicar:

- Router `10.17.45.1`.
- Switch `10.17.45.2`.
- Windows Server `10.17.45.10`.
- Dominio `lab.local`.

## 3. Active Directory y NPS

En Windows Server mostrar:

- **Usuarios y equipos de Active Directory**: `Nivel-0`, `Nivel-5`, `Nivel-10`.
- **Servidor de directivas de redes**: clientes `Router-A6`, `Switch-A6` y política `A6-Lab-Admins`.

## 4. Prueba RADIUS

En el Router ejecutar:

```bash
radtest radiusadmin 'RadiusUser2026!' 10.17.45.10 0 RadiusLab2026
```

Mostrar `Access-Accept`.

## 5. Router

```bash
ip -4 -br addr
grep pam_radius /etc/pam.d/sshd
cat /etc/pam_radius_auth.conf
ss -lntp | grep ':22'
```

## 6. Switch

```text
show ip interface brief
show ip ssh
show running-config | section aaa
show running-config | section line vty
```

Explicar que SSH usa AAA con respaldo local.

## 7. Cierre

Indicar que la autenticación centralizada fue aceptada por NPS y que el acceso SSH está protegido.
