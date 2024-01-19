# FitClub Database

Este proyecto representa la creación de una base de datos para un club de fitness llamado "FitClub". La base de datos está diseñada para gestionar la información de socios, instructores, categorías de clases y las inscripciones de los socios en estas categorías.

## Estructura de la Base de Datos

- **SOCIOS:** Almacena la información de los socios, con cédula única y número de socio único asignado automáticamente.
- **INSTRUCTOR:** Contiene datos sobre los instructores, con cédulas únicas y sin duplicados en la tabla.
- **CATEGORIA:** Define las categorías de clases con restricciones en los nombres y días de la semana.
- **INSCRIPCION:** Registra las inscripciones de los socios en las categorías, con la posibilidad de especificar matrícula, pagos y relaciones con las tablas de socios y categorías.

## Requisitos y Reglas de Negocio

- Un socio puede inscribirse en varias categorías, pero no dos veces en la misma.
- Un socio tiene una cédula única y un número de socio único asignado automáticamente.
- Las cedulas del socio y de los instructores deben tener el formato 99-9999-99999.
- Una categoría debe tener asignado un instructor existente o "null" si aún no tiene un instructor definido.
- Los nombres de categoría permitidos son: maquina, baile, speeding y pesas.
- El campo "dia" de "categoría" puede ser: lunes, martes, miércoles, jueves, viernes o sábado.
- Un instructor puede ser instructor de varias categorías y no puede estar repetido en "instructores".
- Al eliminar un instructor, se eliminan los códigos de dicho instructor de la tabla categoría, indicando que no hay un instructor actualmente para dicha categoría.
- Al retirar completamente a un socio del gimnasio, se elimina de la tabla de socios y se eliminan las inscripciones asociadas.

## Instalación y Uso

1. Clona este repositorio:

   ```bash
   git clone https://github.com/TuUsuario/LAB_3_FITCLUB.git
   ```

2. Ejecuta el script SQL en tu servidor de base de datos preferido.

3. ¡Listo! La base de datos "LAB_3_FITCLUB" está lista para ser utilizada.

## Contribuciones

Si encuentras algún problema o tienes sugerencias para mejorar la base de datos, no dudes en abrir un problema o enviar una solicitud de extracción.
