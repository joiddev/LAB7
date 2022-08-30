import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyApp> {
  String result = "0", expression = "";

  buttonPressed(String value) {
    print(value);

    setState(() {
      if (value == "CLEAR") {
        result = "0";
      } else if (value == ".") {
        if (result.contains(".")) {
          return;
        } else {
          result = result + value;
        }
      } 
       else if (value == "=") {
        expression = result.replaceAll("X", "*");
        Parser p = Parser();
        Expression exp = p.parse(expression);
        ContextModel cm = ContextModel();
        dynamic calculate = exp.evaluate(EvaluationType.REAL, cm);

        result = "$calculate";
      } else {
        if (result == "0") {
          result = value;
        } else {
          result = result + value;
        }
      }
    });
  }

  Widget myButton(String buttonLabel) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: OutlinedButton(
        
        onPressed: () => buttonPressed(buttonLabel),
        child: Text(
          buttonLabel,
          style: TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 248, 17, 210),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(155, 214, 19, 133),
          title: Text("Calculator"),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 24),
                alignment: Alignment.centerRight,
                child: Text(
                  result,
                  style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Image(image: NetworkImage('https://scontent.fbkk8-2.fna.fbcdn.net/v/t39.30808-6/294420161_1726903590976067_8516873884478596380_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeHVeQjnNVHG9LWsg26fqCLZ8EQXM_Ryr2_wRBcz9HKvbyFbX2FCfgH3Evnw6-HUXrPpZbS8ahzVZ4eVTv2MT17c&_nc_ohc=Vq0Hrev4s3IAX9fhf-0&tn=vqKb6maqWirdVNT9&_nc_ht=scontent.fbkk8-2.fna&oh=00_AT_3hDm_jTMd9zyxQHhPUCy9Q86cioeqDoqtyuC6gT1EKw&oe=631242D8'),)                
                
                
                //Divider(),
              ),
              Column(
                children: [
                  
                  Row(
                    children: [
                      myButton("7"),
                      myButton("8"),
                      myButton("9"),
                      myButton("/"),
                    ],
                  ),
                  Row(
                    children: [
                      myButton("4"),
                      myButton("5"),
                      myButton("6"),
                      myButton("X"),
                    ],
                  ),
                  Row(
                    children: [
                      myButton("1"),
                      myButton("2"),
                      myButton("3"),
                      myButton("-"),
                    ],
                  ),
                  Row(
                    children: [
                      myButton("."),
                      myButton("0"),
                      myButton("00"),
                      myButton("+"),
                    ],
                  ),
                  Row(
                    children: [
                      myButton("CLEAR"),
                      myButton("="),
                      
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}