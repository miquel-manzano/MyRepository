package cat.itb.m78.exercices.Examen

import androidx.compose.runtime.mutableStateOf
import androidx.lifecycle.ViewModel

enum class OperationsType{
    sum, minus, multiply, divide
}

class MyCalculatorAppViewModel : ViewModel(){
    val generalNum = mutableStateOf(0)
    fun changeValue(operationsType: OperationsType, num: Int){
        when(operationsType){
            OperationsType.sum ->  generalNum.value += num
            OperationsType.minus -> generalNum.value -= num
            OperationsType.multiply -> generalNum.value *= num
            OperationsType.divide -> generalNum.value /= num
        }
    }
}