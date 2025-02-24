// HelloWorld.kt
@Composable
fun HelloWorld() {
    Text(text = "Hello, World!")
}

// Welcome.kt
@Composable
fun Welcome(name: String) {
    Text(text = "Welcome, $name!")
}

// Resource.kt
@Composable
fun Resource() {
    Image(painterResource(id = R.drawable.generatedFace), contentDescription = "Generated Face")
    Text(text = stringResource(id = R.string.app_name))
}

// Contact.kt
data class Contact(val fullName: String, val email: String, val phone: String)

@Composable
fun ContactCard(contact: Contact) {
    Column {
        Text(text = "Name: ${contact.fullName}")
        Text(text = "Email: ${contact.email}")
        Text(text = "Phone: ${contact.phone}")
    }
}

// MessagesList.kt
data class Message(val author: String, val body: String)

@Composable
fun MessagesList(messages: List<Message>) {
    LazyColumn {
        items(messages) { message ->
            Text("${message.author}: ${message.body}")
        }
    }
}

// GoodMorningAndNight.kt
@Composable
fun GoodMorningAndNight() {
    val isMorning = remember { mutableStateOf(true) }
    Column {
        Text(if (isMorning.value) "Good Morning!" else "Good Night!")
        Button(onClick = { isMorning.value = !isMorning.value }) {
            Text("Toggle Time of Day")
        }
    }
}

// SayHelloScreen.kt
@Composable
fun SayHelloScreen() {
    var name by remember { mutableStateOf("") }
    var showDialog by remember { mutableStateOf(false) }
    Column {
        TextField(value = name, onValueChange = { name = it }, label = { Text("Enter your name") })
        Button(onClick = { showDialog = true }) {
            Text("Say Hello")
        }
        if (showDialog) {
            AlertDialog(
                onDismissRequest = { showDialog = false },
                confirmButton = {
                    Button(onClick = { showDialog = false }) { Text("OK") }
                },
                text = { Text("Hello, $name!") }
            )
        }
    }
}

// SecretNumber.kt
@Composable
fun SecretNumberGame() {
    var secretNumber by remember { mutableStateOf((0..100).random()) }
    var guess by remember { mutableStateOf("") }
    var message by remember { mutableStateOf("") }
    Column {
        TextField(value = guess, onValueChange = { guess = it }, label = { Text("Your Guess") })
        Button(onClick = {
            val num = guess.toIntOrNull()
            message = when {
                num == null -> "Invalid number"
                num < secretNumber -> "The number is higher"
                num > secretNumber -> "The number is lower"
                else -> "Correct!"
            }
        }) {
            Text("Check")
        }
        Text(message)
    }
}

// DiceRoller.kt
@Composable
fun DiceRoller() {
    var dice1 by remember { mutableStateOf(1) }
    var dice2 by remember { mutableStateOf(1) }
    Column {
        Image(painterResource(id = getDiceDrawable(dice1)), contentDescription = "Dice 1")
        Image(painterResource(id = getDiceDrawable(dice2)), contentDescription = "Dice 2")
        Button(onClick = {
            dice1 = (1..6).random()
            dice2 = (1..6).random()
            if (dice1 == 6 && dice2 == 6) {
                Toast.makeText(LocalContext.current, "JACKPOT!", Toast.LENGTH_SHORT).show()
            }
        }) {
            Text("Roll the Dice")
        }
    }
}

fun getDiceDrawable(value: Int): Int {
    return when (value) {
        1 -> R.drawable.dice_1
        2 -> R.drawable.dice_2
        3 -> R.drawable.dice_3
        4 -> R.drawable.dice_4
        5 -> R.drawable.dice_5
        else -> R.drawable.dice_6
    }
}
