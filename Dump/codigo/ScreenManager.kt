package cat.itb.m78.exercices.Examen

import androidx.compose.runtime.Composable
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import androidx.navigation.toRoute
import kotlinx.serialization.Serializable

object CalculatorScreen{
    @Serializable
    data object CalculatorScreenViewModel
    @Serializable
    data class FinalResult(val num: Int)
}

@Composable
fun NavLivCalculator(){
    val navController = rememberNavController()
    NavHost(navController = navController, startDestination = CalculatorScreen.CalculatorScreenViewModel){
        composable<CalculatorScreen.CalculatorScreenViewModel> {
            CalculatorScreenViewModel(
                navigateToFinalScreen = {navController.navigate(CalculatorScreen.FinalResult(it))}
            )
        }
        composable<CalculatorScreen.FinalResult> {
                backstack ->
            val num: Int = backstack.toRoute<CalculatorScreen.FinalResult>().num
            FinalResult(
                num
            )
        }
    }
}