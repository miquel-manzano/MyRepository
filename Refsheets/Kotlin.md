# 📝 Chuleta de Kotlin Compose Multiplatform (KMP)

## 📌 Introducción a KMP
Kotlin Multiplatform permite compartir código entre diferentes plataformas (Android, iOS, Web, etc.), manteniendo una base común en Kotlin.

## 📞 Dependencias esenciales
```kotlin
dependencies {
    implementation("androidx.compose.ui:ui:1.5.0") // UI básica
    implementation("androidx.compose.material:material:1.5.0") // Material Design
    implementation("androidx.lifecycle:lifecycle-viewmodel-compose:2.6.1") // ViewModel
    implementation("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.7.1") // Corrutinas
}
```

---

## 📊 ViewModel en KMP
ViewModel se usa para manejar el estado de la UI y la lógica de negocio.

### **Definición de un ViewModel en KMP**
```kotlin
class GameViewModel : ViewModel() {
    private val _score = mutableStateOf(0) // Estado interno
    val score: State<Int> = _score // Estado expuesto a la UI

    fun increaseScore() {
        _score.value += 10
    }
}
```

### **Uso en Composable**
```kotlin
@Composable
fun GameScreen(viewModel: GameViewModel = viewModel()) {
    Column {
        Text("Puntuación: ${viewModel.score.value}")
        Button(onClick = { viewModel.increaseScore() }) {
            Text("Sumar Puntos")
        }
    }
}
```

---

## 🔄 MutableState y remember
`MutableState` permite a Jetpack Compose detectar cambios y recomponer la UI automáticamente.

```kotlin
@Composable
fun TimerScreen() {
    var timeLeft by remember { mutableStateOf(10) }

    LaunchedEffect(timeLeft) {
        delay(1000L)
        if (timeLeft > 0) timeLeft--
    }

    Column {
        Text("Tiempo restante: $timeLeft")
        Button(onClick = { timeLeft = 10 }) {
            Text("Reiniciar")
        }
    }
}
```

---

## 🤝 Navegación con Compose
Para gestionar la navegación entre pantallas usamos `NavHost` y `NavController`.

```kotlin
@Composable
fun NavGraph(navController: NavController) {
    NavHost(navController, startDestination = "menu") {
        composable("menu") { MenuScreen(navController) }
        composable("game") { GameScreen() }
        composable("result") { ResultScreen() }
    }
}
```

---

## 🏠 Configuración con un Singleton
```kotlin
enum class TrivialSubject { Kotlin, Html }

data class TrivialSettings(
    val difficulty: TrivialSubject = TrivialSubject.Kotlin,
    val questionsPerGame: Int = 10
)

object TrivialSettingsManager {
    private var settings = TrivialSettings()

    fun update(newSettings: TrivialSettings) {
        settings = newSettings
    }

    fun get() = settings
}
```

---

## 🌿 Estructura recomendada para un trivial en KMP
```
/src
 ├── commonMain
 │   ├── kotlin
 │   │   ├── viewmodel/
 │   │   │   ├── GameViewModel.kt
 │   │   ├── ui/
 │   │   │   ├── MenuScreen.kt
 │   │   │   ├── GameScreen.kt
 │   │   │   ├── ResultScreen.kt
 │   │   │   ├── SettingsScreen.kt
 │   ├── resources/
 │       ├── strings.xml
 ├── androidMain/
 ├── iosMain/
```

---

## 🚀 Consejos finales
- Usa **ViewModel** para la lógica de negocio.
- Maneja el estado con **MutableState** y **remember**.
- Organiza bien las pantallas con **Navigation Compose**.
- Usa un **Singleton para la configuración** del juego.
- Implementa **corutinas** para lógica asíncrona (como temporizadores).

---

📌 **¡Y listo! Con esto tienes una base sólida para trabajar en Kotlin Compose Multiplatform!** 🎉



---






# 📝 Chuleta de Kotlin

## 📌 Introducción a Kotlin
Kotlin es un lenguaje de programación moderno, conciso y seguro para la JVM, Android, y desarrollo multiplataforma.

## 🏗️ Sintaxis Básica

### Variables y Tipos de Datos
```kotlin
val nombre: String = "Juan" // Inmutable
var edad: Int = 25 // Mutable
```

### Tipos de Datos Comunes
```kotlin
val entero: Int = 10
val decimal: Double = 3.14
val booleano: Boolean = true
val caracter: Char = 'A'
val cadena: String = "Hola, Kotlin"
```

### Funciones
```kotlin
fun suma(a: Int, b: Int): Int {
    return a + b
}

fun resta(a: Int, b: Int) = a - b // Función de una línea
```

### Estructuras de Control
```kotlin
val x = 10
if (x > 5) {
    println("Mayor que 5")
} else {
    println("Menor o igual a 5")
}
```

```kotlin
when (x) {
    1 -> println("Uno")
    2 -> println("Dos")
    else -> println("Otro número")
}
```

### Bucles
```kotlin
for (i in 1..5) {
    println(i)
}
```

```kotlin
var i = 0
while (i < 5) {
    println(i)
    i++
}
```

---

## 🚀 Programación Orientada a Objetos

### Clases y Objetos
```kotlin
class Persona(val nombre: String, var edad: Int) {
    fun saludar() {
        println("Hola, soy $nombre y tengo $edad años.")
    }
}

val persona = Persona("Juan", 25)
persona.saludar()
```

### Herencia
```kotlin
open class Animal {
    open fun hacerSonido() {
        println("Sonido genérico")
    }
}

class Perro : Animal() {
    override fun hacerSonido() {
        println("Guau Guau")
    }
}
```

---

## 🔄 Funcionalidades Avanzadas

### Extensiones
```kotlin
fun String.reversa(): String {
    return this.reversed()
}

println("Kotlin".reversa()) // "niltoK"
```

### Lambdas y Funciones de Orden Superior
```kotlin
val suma: (Int, Int) -> Int = { a, b -> a + b }
println(suma(3, 4)) // 7
```

### Corrutinas
```kotlin
import kotlinx.coroutines.*

fun main() {
    GlobalScope.launch {
        delay(1000L)
        println("Mundo!")
    }
    println("Hola")
    Thread.sleep(2000L)
}
```

---

## 📦 Kotlin en Android

### Actividades y Fragments
```kotlin
class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }
}
```

### Jetpack Compose (UI Declarativa)
```kotlin
@Composable
fun Greeting(name: String) {
    Text(text = "Hola, $name!")
}
```

---

## 🎯 Consejos y Buenas Prácticas
- Usa `val` siempre que sea posible.
- Evita el uso de `null`, utiliza `?.` y `!!` con precaución.
- Organiza tu código en paquetes y clases reutilizables.
- Usa `sealed class` para modelar estados.

---

📌 **¡Y listo! Ahora tienes una guía rápida sobre Kotlin! 🚀**

