import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      title: "Flutter practice",
      home: FlutterApp(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class FlutterApp extends StatefulWidget {
  const FlutterApp({Key? key}) : super(key: key);
  @override
  State <FlutterApp> createState() => _flutterApp();


  }
class _flutterApp extends State<FlutterApp> {

  var  wtController = TextEditingController();
  var ftController = TextEditingController();
  var itController = TextEditingController();

  var result =  "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Good company"),
          leading:
              const IconButton(onPressed: null, icon: Icon(Icons.ice_skating)),
        ),
        body: Center(

          child: Container(
            width: 400,
            height: 450 ,
            color: Colors.purple.shade50,
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("BMI", style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                  color: Colors.deepPurple
                ),),
                SizedBox(height: 10,),
                TextField(
                  controller: wtController,
                    decoration: InputDecoration(
                      label: Text("Enter your weight in (Kg)"),
                      prefixIcon: Icon(Icons.line_weight),
                    ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text("Enter your height in (Feet)"),
                    prefixIcon: Icon(Icons.height_sharp),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: itController,
                  decoration: InputDecoration(
                    label: Text("Enter your Height in (Inches)"),
                    prefixIcon: Icon(Icons.height_sharp),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20,),

                ElevatedButton(onPressed: (){

                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var it = itController.text.toString();

                  if ( wt!= "" && ft != "" && it != ""){

                    var weight = double.parse(wt);
                    var feet = int.parse(ft);
                    var inches = int.parse(it);

                    var heightInMetres = ((feet*12  + inches) * 2.54)/100;

                    var bmi = weight/ (heightInMetres* heightInMetres);

                   setState(() {
                     result = "Your BMI is : ${bmi.toStringAsFixed(3)}";
                   });

                  }else {

                    setState(() {
                      result = "Please fill all the values";
                    });
                  }

                }, child: Text("Result") ),
                SizedBox(height: 20,),
                
                Text(result)

              ],
            ),
          ),
        )



    );
  }
}
