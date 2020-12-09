# Ejercicios, MongoDB.

Obtén los datos de contacto de cada compañía.
```json
{
 project: {
  name: 1,
  email_address: 1,
  phone_number: 1
 }
}
```
Obtén el identificador de la clase de cada calificación.
```json
{
 project: {
  class_id: 1
 }
}
```
Obtén el nombre de todas las compañias fundadas en octubre.
```json
{
 filter: {
  founded_month: 10
 },
 project: {
  name: 1
 }
}
```
Obtén el nombre de todas las compañías fundadas en 2008.
```json
{
 filter: {
  founded_year: 2008
 },
 project: {
  name: 1
 }
}
```
Obtén todos los post del autor machine.
```json
{
 filter: {
  author: 'machine'
 }
}
```
Obtén todas las calificaciones provenientes de los grupos 357, 57 y 465.
```json
{
 filter: {
  class_id: {
   $in: [
    357,
    57,
    465
   ]
  }
 }
}
```
Obtén todas las compañías fundadas en octubre del 2008.
```json
{
 filter: {
  $and: [
   {
    founded_month: 10
   },
   {
    founded_year: 2008
   }
  ]
 }
}
```
Obtén todas las compañias con más de 50 empleados.
```json
{
 filter: {
  number_of_employees: {
   $gt: 50
  }
 },
 project: {
  name: 1,
  number_of_employees: 1
 }
}
```
Obtén las rutas con un número de paradas entre 1 y 5.
```json
{
 filter: {
  $and: [
   {
    stops: {
     $gte: 1
    }
   },
   {
    stops: {
     $lte: 5
    }
   }
  ]
 }
}
```
Obtén la empresa con el menor número de empleados.
```json
{
 filter: {
  number_of_employees: {
   $gte: 0
  }
 },
 sort: {
  number_of_employees: 1
 },
 limit: 1
}
```
Obtén la empresa con el mayor número de empleados.
```json
{
 sort: {
  number_of_employees: -1
 },
 limit: 1
}
```
Obtén el viaje con mayor duración.
```json
{
 sort: {
  tripduration: -1
 },
 limit: 1
}
```
Obtén el viaje con menor duración.
```json
{
 sort: {
  tripduration: 1
 },
 limit: 1
}
```