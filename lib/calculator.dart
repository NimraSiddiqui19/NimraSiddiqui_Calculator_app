import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  
  String display = "0";



  @override
  Widget build(BuildContext context) {

    
    return Scaffold(

      backgroundColor: Colors.black,
     
     appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
  "Calculator",
  style: TextStyle(
    color: Color.fromARGB(255, 202, 131, 243),
    fontSize: 30,
    fontWeight: FontWeight.bold,
    
  ),
)
        ),

        body: Center(
        child: SizedBox(
          width: 400, // Limits the maximum width on wide screens
          child: Padding(
            padding: const EdgeInsets.all(16.0),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
            Container( 
                decoration: BoxDecoration( color: const Color.fromARGB(255, 102, 181, 234), 
                // OUTLINE BORDER 
                border: Border.all( color: Colors.white, width: 2, )),

                height: 150,
                width: double.infinity,
               // color: const Color.fromARGB(255, 102, 181, 234),
              child:  Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.all(20),

                child: Text(
                    display ,
                    style: TextStyle(
                      color: Colors.white,
                       fontSize: 40
                      ),

                

                  

                

              ),), ),),
              
              // Row 1
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buttonCalculator("7"),
              buttonCalculator("8"),
              buttonCalculator("9"),
              buttonCalculator("C"),
              
            ],
          ),

            
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buttonCalculator("4"),
              buttonCalculator("5"),
              buttonCalculator("6"),
              buttonCalculator("+"),
              
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buttonCalculator("1"),
              buttonCalculator("2"),
              buttonCalculator("3"),
              buttonCalculator("-"),
              
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buttonCalculator("0"),
              buttonCalculator("="),
              buttonCalculator("/"),
              buttonCalculator("*")
              
              
              
            ],
          ),


            ]
          ),

          ),
          ),
          ),
          

            
          );


  

  }

  Widget buttonCalculator(String text) {
  return InkWell(
    onTap: () {
      setState(() {
        if (text == "=") {
          display = calculateResult(display);
        } else if (text == "C") {
          display = "0";
        } else {
          if (display == "0") {
            display = text;
          } else {
            display += text;
          }
        }
      });
    },
    child: Container(
    height: 80,
    width: 80,
    decoration: BoxDecoration(
    //color: colorforbutton(label),
    //color:const Color.fromARGB(255, 245, 147, 179),

     // OUTLINE BORDER
  border: Border.all(
    color: Colors.white,
    width: 2,
  ),
    // ONLY THIS COLOR LINE IS CHANGED
         color: (text == "+" || text == "-" || text == "/" || text == "*" || text == "C" || text == "0" || text == "=")
            ? Colors.red
            : const Color.fromARGB(255, 245, 147, 179),    
            borderRadius: BorderRadius.circular(20),
             
    ),
    //color: const Color.fromARGB(255, 232, 171, 243),
    child: Center(
    child: Text(text,
    style: const TextStyle(
      color: Colors.black,
      fontSize: 25,
      fontWeight: FontWeight.bold,
    ),
    ),
    ),
    ),
    );
}


String calculateResult(String expr)
{
 
String opert = '';
  
  for (int i = 0; i< expr.length; i++)
  {
    String character = expr[i];

    if( character == '+'  ||
        character == '-'  ||
        character == '/'  ||
        character == '='  ||
        character == '*'  ||
        character == 'C'  ||
        character == 'Enter' 



     )
    {

      opert= character;

    }


  }

  if (opert == '')
  {
 return opert ;
  }


  //split all members 

  List <String> parts = expr.split(opert);

  double result = double.parse(parts[0]);

// Calculate with all remaining numbers
    for (int i = 1; i < parts.length; i++) {
      double number = double.parse(parts[i]);

      if (opert == '+') {
        result += number;
      } else if (opert == '-') {
        result -= number;
      } else if (opert == '*') {
        result *= number;
      } else if (opert == '/') {
        if (number == 0) {
          return 'Error';
        }
        result /= number;
      }
    }

    return result.toString();


}

  


  }


