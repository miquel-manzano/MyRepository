# MongoDB Cheat Sheet

## 📥 Importación de Archivos

MongoDB permite importar datos desde archivos JSON y CSV utilizando `mongoimport`.

### Importar un archivo JSON
```bash
mongoimport --db <nombre_base_datos> --collection <nombre_colección> --file <ruta_al_archivo.json> --jsonArray
```
Este comando importará un archivo JSON en la base de datos especificada. El flag `--jsonArray` se usa si el archivo contiene una matriz de objetos JSON.

### Importar un archivo CSV
```bash
mongoimport --db <nombre_base_datos> --collection <nombre_colección> --type csv --headerline --file <ruta_al_archivo.csv>
```
El flag `--headerline` usa la primera línea del archivo como nombres de campo.

---

## 🏗️ Operaciones CRUD

### ➕ Crear (Insertar) Documentos

#### Insertar un solo documento
```javascript
db.productos.insertOne({ nombre: "Laptop", precio: 1200, stock: 5 })
```
Este comando inserta un único documento en la colección `productos`.

#### Insertar múltiples documentos
```javascript
db.productos.insertMany([
  { nombre: "Mouse", precio: 25, stock: 50 },
  { nombre: "Teclado", precio: 45, stock: 30 }
])
```
Inserta varios documentos en la colección de una sola vez.

---

### 🔍 Leer (Consultar) Documentos

#### Obtener todos los documentos
```javascript
db.productos.find()
```
Retorna todos los documentos dentro de la colección.

#### Filtrar documentos
```javascript
db.productos.find({ precio: { $gt: 100 } })
```
Este comando busca todos los productos cuyo `precio` sea mayor a 100.

#### Obtener un solo documento
```javascript
db.productos.findOne({ nombre: "Laptop" })
```
Retorna el primer documento que coincida con el criterio especificado.

#### Proyección de Campos
```javascript
db.productos.find({}, { nombre: 1, precio: 1, _id: 0 })
```
Retorna solo los campos `nombre` y `precio`, excluyendo el `_id`.

---

### ✏️ Actualizar Documentos

#### Actualizar un solo documento
```javascript
db.productos.updateOne(
  { nombre: "Mouse" },
  { $set: { precio: 30 } }
)
```
Actualiza el precio del primer documento donde el nombre sea "Mouse".

#### Actualizar múltiples documentos
```javascript
db.productos.updateMany(
  { precio: { $lt: 50 } },
  { $set: { stock: 100 } }
)
```
Modifica el campo `stock` a 100 en todos los productos con `precio` menor a 50.

#### Incrementar valores numéricos
```javascript
db.productos.updateOne(
  { nombre: "Laptop" },
  { $inc: { stock: 5 } }
)
```
Aumenta en 5 el `stock` del producto "Laptop".

#### Agregar elementos a un array (`$push`)
```javascript
db.productos.updateOne(
  { nombre: "Laptop" },
  { $push: { accesorios: "Mouse inalámbrico" } }
)
```
Añade un elemento al array `accesorios` del documento que coincida con el criterio.

#### Eliminar el último elemento de un array (`$pop`)
```javascript
db.productos.updateOne(
  { nombre: "Laptop" },
  { $pop: { accesorios: 1 } }
)
```
Elimina el último elemento del array `accesorios`.

#### Upsert (Actualizar si existe, insertar si no existe)
```javascript
db.productos.updateOne(
  { nombre: "Tablet" },
  { $set: { precio: 250, stock: 10 } },
  { upsert: true }
)
```
Si el documento con `nombre: "Tablet"` no existe, se insertará con los valores dados.

---

### ✏️ Actualizar Documentos

#### Modificadores más usados en update

| Modificador | Descripción | Ejemplo |
|------------|-------------|---------|
| `$set` | Modifica o agrega un campo | `{ $set: { stock: 50 } }` |
| `$unset` | Elimina un campo | `{ $unset: { stock: "" } }` |
| `$inc` | Incrementa un valor numérico | `{ $inc: { stock: 5 } }` |
| `$mul` | Multiplica un valor numérico | `{ $mul: { precio: 1.1 } }` |
| `$rename` | Renombra un campo | `{ $rename: { "nombre": "producto" } }` |
| `$min` | Establece un valor mínimo | `{ $min: { precio: 100 } }` |
| `$max` | Establece un valor máximo | `{ $max: { precio: 1000 } }` |
| `$push` | Agrega un elemento a un array | `{ $push: { accesorios: "Cargador" } }` |
| `$pop` | Elimina el primer (-1) o último (1) elemento de un array | `{ $pop: { accesorios: 1 } }` |
| `$pull` | Elimina elementos específicos de un array | `{ $pull: { accesorios: "Cargador" } }` |
| `$addToSet` | Agrega un valor a un array si no existe | `{ $addToSet: { accesorios: "Cargador" } }` |
| `$upsert` | Crea el documento si no existe | `{ upsert: true }` |


---


## 📌 Expresiones Útiles en MongoDB

| Operador | Descripción | Ejemplo |
|----------|------------|---------|
| `$in` | Coincide con cualquiera de los valores en una lista | `{ precio: { $in: [50, 100, 150] } }` |
| `$or` | Operador lógico OR | `{ $or: [{ stock: { $lt: 10 } }, { precio: { $gt: 500 } }] }` |
| `$gte` | Mayor o igual que | `{ stock: { $gte: 10 } }` |
| `$lte` | Menor o igual que | `{ precio: { $lte: 500 } }` |
| `.pretty()` | Formatea la salida de `find()` para mejor legibilidad | `db.productos.find().pretty()` |
| `.count()` | Cuenta la cantidad de documentos que coinciden con la consulta | `db.productos.find({ categoria: "Electrónica" }).count()` |
| `.limit(n)` | Limita el número de documentos retornados | `db.productos.find().limit(5)` |
| `.skip(n)` | Omite los primeros `n` documentos | `db.productos.find().skip(10)` |
| `.sort({ campo: 1 })` | Ordena los resultados de forma ascendente (1) o descendente (-1) | `db.productos.find().sort({ precio: -1 })` |
| `$min` | Encuentra el valor mínimo en un campo | `{ $group: { _id: null, precioMin: { $min: "$precio" } } }` |
| `$avg` | Calcula el promedio de un campo | `{ $group: { _id: "$categoria", precioPromedio: { $avg: "$precio" } } }` 


---


## 🏗️ Introducción a Aggregations

MongoDB proporciona el framework de agregaciones para procesar datos en múltiples etapas. Las agregaciones permiten filtrar, transformar y agrupar datos de manera eficiente.

Una consulta de agregación se compone de un **pipeline** de varias etapas, donde cada etapa aplica una transformación a los datos.

```javascript
db.coleccion.aggregate([
  { etapa1 },
  { etapa2 },
  { etapa3 }
])
```
Cada etapa usa un operador `$` para realizar una operación específica sobre los datos.

---

## 🔎 $match (Filtrar Documentos)

Filtra documentos antes de pasar a la siguiente etapa, similar a `find()`.

```javascript
db.productos.aggregate([
  { $match: { precio: { $gt: 100 } } }
])
```
**Explicación:** Filtra los documentos en los que `precio` es mayor a 100.

---

## 🏷️ $project (Proyección de Campos)

Selecciona qué campos se incluyen o transforman en la salida.

```javascript
db.productos.aggregate([
  { $project: { nombre: 1, precio: 1, iva: { $multiply: ["$precio", 0.21] } } }
])
```
**Explicación:**
- Se incluyen solo `nombre` y `precio`.
- Se calcula un nuevo campo `iva` multiplicando `precio` por 0.21.

---

## 🔄 $group (Agrupar Datos)

Agrupa documentos en categorías y aplica operaciones de agregación.

```javascript
db.ventas.aggregate([
  { $group: { _id: "$categoria", totalVentas: { $sum: "$monto" } } }
])
```
**Explicación:** Agrupa las ventas por `categoria` y suma el `monto` total de cada una.

---

## 📊 $sort (Ordenar Resultados)

Ordena documentos por un campo, de manera ascendente (1) o descendente (-1).

```javascript
db.productos.aggregate([
  { $sort: { precio: -1 } }
])
```
**Explicación:** Ordena los productos por `precio` en orden descendente.

---

## ⏳ $limit y $skip (Paginación)

- `$limit`: Reduce la cantidad de documentos en la salida.
- `$skip`: Omite una cantidad de documentos inicial.

```javascript
db.productos.aggregate([
  { $sort: { precio: -1 } },
  { $skip: 10 },
  { $limit: 5 }
])
```
**Explicación:**
1. Ordena por `precio` de mayor a menor.
2. Omite los primeros 10 documentos.
3. Muestra solo 5 documentos.

---

## 📈 $count (Contar Documentos)

```javascript
db.productos.aggregate([
  { $match: { categoria: "Electrónica" } },
  { $count: "total" }
])
```
**Explicación:** Cuenta cuántos productos pertenecen a la categoría `Electrónica`.

---

## ⚡ $unwind (Desnormalizar Arrays)

Expande elementos de un array en documentos separados.

```javascript
db.pedidos.aggregate([
  { $unwind: "$productos" }
])
```
**Explicación:** Si un pedido tiene múltiples `productos`, cada uno se convertirá en un documento independiente.

---

## 🔄 $lookup (Joins entre Colecciones)

Permite combinar documentos de diferentes colecciones, similar a una `JOIN` en SQL.

```javascript
db.ordenes.aggregate([
  {
    $lookup: {
      from: "clientes",      // Colección a unir
      localField: "clienteId", // Campo en esta colección
      foreignField: "_id",    // Campo en la otra colección
      as: "cliente_info"      // Nombre del campo resultante
    }
  }
])
```
**Explicación:** Une `ordenes` con `clientes`, añadiendo la información del cliente en un array `cliente_info`.

---

## 🎭 Expresiones Útiles en Aggregations

| Expresión | Descripción | Ejemplo |
|-----------|------------|---------|
| `$sum` | Suma valores | `{ $sum: "$precio" }` |
| `$avg` | Calcula promedio | `{ $avg: "$precio" }` |
| `$min` | Valor mínimo | `{ $min: "$precio" }` |
| `$max` | Valor máximo | `{ $max: "$precio" }` |
| `$first` | Primer valor de un grupo | `{ $first: "$nombre" }` |
| `$last` | Último valor de un grupo | `{ $last: "$nombre" }` |

---

📖 Para más información, visita la [documentación oficial de MongoDB](https://www.mongodb.com/docs/manual/).