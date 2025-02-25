package cat.itb.m78.exercices.Examen

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.material3.Button
import androidx.compose.material3.ButtonDefaults
import androidx.compose.material3.Card
import androidx.compose.material3.OutlinedButton
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.OutlinedTextFieldDefaults
import androidx.compose.material3.Text
import androidx.compose.material3.TextField
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.lifecycle.viewmodel.compose.viewModel

@Composable
fun CalculatorScreenViewModel(navigateToFinalScreen: (Int) -> Unit) {
    val viewModel = viewModel { MyCalculatorAppViewModel() }
    val pattern = remember { Regex("^\\d*\$") }
    CalculatorScreen(viewModel.generalNum.value, viewModel::changeValue, navigateToFinalScreen, pattern, modifier = Modifier.fillMaxSize().padding(top = 20.dp).background(Color.Yellow))
}

@Composable
fun CalculatorScreen(generalNum: Int, changeValue: (OperationsType, Int) -> Unit, navigateToFinalScreen: (Int) -> Unit, pattern: Regex, modifier: Modifier)
{
    var input by remember { mutableStateOf("") }
    val typeOperation = remember { mutableStateOf(OperationsType.sum) }
    Column(
        modifier,
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        Text(
            generalNum.toString(),
            style = TextStyle(fontSize = 50.sp),
            fontWeight = FontWeight.Bold
        )
        Card() {
            Column(modifier = Modifier, horizontalAlignment = Alignment.CenterHorizontally) {
                Row() {
                    Button(onClick = { typeOperation.value = OperationsType.sum }) {
                        Text("+")
                    }
                    Button(onClick = { typeOperation.value = OperationsType.minus }) {
                        Text("-")
                    }
                    Button(
                        onClick = { typeOperation.value = OperationsType.multiply },
                        modifier = Modifier
                    ) {
                        Text("*")
                    }
                    Button(onClick = { typeOperation.value = OperationsType.divide }) {
                        Text("/")
                    }
                }
                OutlinedTextField(
                    value = input,
                    onValueChange = {
                        if (it.matches(pattern)) {
                            input = it
                        }
                    },
                    keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Number)
                )
                Row() {
                    OutlinedButton(onClick = { navigateToFinalScreen(generalNum) }) {
                        Text("End")
                    }
                    Button(onClick = {
                        if (input != "") {
                            changeValue(typeOperation.value, input.toInt())
                        }; input = ""
                    }) {
                        Text("Calculate")
                    }
                }
            }
        }
    }
}