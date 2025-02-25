package cat.itb.m78.exercices.Examen

import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import m78exercices.composeapp.generated.resources.Calculator_icon
import m78exercices.composeapp.generated.resources.Res
import org.jetbrains.compose.resources.painterResource

@Composable
fun FinalResult(num: Int){
    Column(modifier = Modifier.fillMaxSize().padding(top = 20.dp).background(Color.Yellow),horizontalAlignment = Alignment.CenterHorizontally, verticalArrangement = Arrangement.Center){
        Text("The final result is")
        Text(num.toString(), style = TextStyle(fontSize = 50.sp), fontWeight = FontWeight.Bold)
        Image(painter = painterResource(Res.drawable.Calculator_icon), contentDescription = null, modifier = Modifier.size(300.dp))
    }
}