import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Bmi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new BmiState();
  }
}

class BmiState extends State<Bmi> {
  final TextEditingController  _agecontroller = new TextEditingController();
  final TextEditingController  _heightcontroller = new TextEditingController();
  final TextEditingController  _weightcontroller = new TextEditingController();
  double result =0.0;
  String _resultReading = "";

  String _finalResult = "";
  void _caluculateBMI() {
    setState(() {
//      BMI Weight status
//
//      If your BMI is less than 18.5, it falls within the underweight range.
//      If your BMI is 18.5 to 24.9, it falls within the normal or Healthy Weight range.
//      If your BMI is 25.0 to 29.9, it falls within the overweight range.
//      If your BMI is 30.0 or higher, it falls within the obese range.
    int age =int.parse(_agecontroller.text);
    double weight = double.parse(_weightcontroller.text);
    double height = double.parse(_heightcontroller.text);

    if(( _agecontroller.text.isNotEmpty || age >0 )
      &&((_heightcontroller.text.isNotEmpty || height >0)
        &&(_weightcontroller.text.isNotEmpty || weight >0))) {
       result = weight / (height*height) *10000;//our BMI
        //to the reading
        if(double.parse(result.toStringAsFixed(1)) < 18.5 ) {
          _resultReading = "underweight";//underweight
          print(_resultReading);

        } else if(double.parse(result.toStringAsFixed(1)) >= 18.5
           && result < 25) {
              _resultReading ="Healthy or Good Fit!"; //normal
              print(_resultReading);
        } else if(double.parse(result.toStringAsFixed(1)) >=25.0
           && result <30.0) {
              _resultReading = "Overweight range";//overweight
              print(_resultReading);
        } else if(double.parse(result.toStringAsFixed(1)) > 30.0) {
              _resultReading = "Obese range";//obese
              print(_resultReading);
        }
    }else {
      result = 0.0;
    }

      });
      _finalResult = "YourBmi: ${result.toStringAsFixed(1)}";
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('BMI'),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: new Container(
          alignment: Alignment.topCenter,
          child: new ListView(
            padding: const EdgeInsets.all(5.0),
            children: <Widget>[
              new Image.asset(
                'images/bmilogo.png',
                height: 80.0,
                width: 75.0,
              ),
              new Container(
                margin: const EdgeInsets.all(2.0),
                height: 250.0,
                width: 290.0,
                color: Colors.grey.shade300,
                child: new Column(
                  children: <Widget>[
                    new TextField(
                      controller:  _agecontroller,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          labelText: ' வயது (age)',
                          hintText: 'e.g: 20',
                          icon: new Icon(Icons.person_outline)),
                    ), 
                    new TextField(
                      controller: _heightcontroller,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          labelText: 'உயரம்சென்டிமீட்டரில் (Height in cm)',
                          hintText: 'e.g: 170',
                          icon: new Icon(Icons.insert_chart)),
                    ),
                    new TextField(
                        controller: _weightcontroller,
                        keyboardType: TextInputType.number,
                        decoration: new InputDecoration(
                            labelText: 'எடை கிலோ கிராமில் (Weight in kg)',
                            hintText: 'e.g: 70',
                            icon: new Icon(Icons.line_weight))),

                    new Padding(padding: new EdgeInsets.all(10.0)),

                    //Calculate Button
                    new Container(
                      alignment: Alignment.center,
                      child: new RaisedButton(
                        onPressed: _caluculateBMI,
                        color: Colors.pinkAccent,
                        child: new Text('result'),
                        textColor: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text("$_finalResult ",
                  style: new TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    fontSize:  19.9
                  ),),
                new Padding(padding: const EdgeInsets.all(15.0)),
                  new Text("$_resultReading ",
                    style: new TextStyle(
                        color: Colors.pinkAccent,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                        fontSize:  19.9
                    ),),
                ],
              ),
            ],
          )
      ),
    );
  }
}
