import 'package:flutter/material.dart';
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var wtController=TextEditingController();
  var inController=TextEditingController();
  var ftController=TextEditingController();
  var result="";
  var cOlour=Colors.blue.shade800;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Container(
        color:cOlour ,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("BMI",style: TextStyle(fontSize: 34,fontWeight: FontWeight.w700),),
                SizedBox(height: 21,),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text("Enter your weight (in kg)"),
                    prefixIcon: Icon(Icons.line_weight)
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 11,),
                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                    label: Text("Enter your height (in inch)"),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType:TextInputType.number
                ),
                SizedBox(height: 11,),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text("Enter your height (in feet)"),
                    prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 16),
                ElevatedButton(onPressed: (){
                  var wt=wtController.text.toString();
                  var inch=inController.text.toString();
                  var ft=ftController.text.toString();
                  if(wt!="" && inch!="" && ft!="" ){
                   //BMI calculetor

                    var iwt=int.parse(wt);
                    var iInch=int.parse(inch);
                    var ift=int.parse(ft);

                    var tinch = (ift*12) + iInch;
                    var tCm= tinch*2.54;
                    var tM=tCm/100;
                    var bmi=iwt/(tM*tM);

                    var msg="";
                    if(bmi>25){
                    msg="You are overweight!!";
                    cOlour=Colors.deepOrange.shade50;
                    }else if(bmi<18){
                      msg="You are ounderweight!!";
                      cOlour=Colors.redAccent.shade100;
                    }else{
                      msg="You are fit!!";
                      cOlour=Colors.green.shade50;
                    }

                    setState(() {
                      result ="${msg}\n Your BMI is :${bmi.toStringAsFixed(2)}";
                    });


                  }
                  else{
                    setState(() {
                      result="Please fill the all required blanks";
                    });
                  }
                }, child:Text("Calculate")),
                SizedBox(height: 10,),
                Text(result,style: TextStyle(fontSize: 19),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
