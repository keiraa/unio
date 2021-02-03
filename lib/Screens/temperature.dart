import 'package:flutter/material.dart';
import 'dart:math' as math;

class TempCalc extends StatefulWidget {
  @override
  _TempCalcState createState() => _TempCalcState();
}

class _TempCalcState extends State<TempCalc> {
  TextEditingController fahrenheit, celcius;
  double f = 32,c = 0;

  @override
  void initState() {
    // TODO: implement initState
    fahrenheit = TextEditingController()..text = f.toString();
    celcius = TextEditingController()..text = c.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*0.5,
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xff155cb0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 200,
                        child: TextField(
                          controller: fahrenheit,
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                              fontSize: 50,
                              color: Colors.white,
                              fontWeight: FontWeight.w500
                          ),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none
                            ),
                            hintStyle: TextStyle(
                                fontSize: 50,
                                color: Colors.white,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          onChanged: (value){
                            f = double.parse(value);
                            setState(() {
                              c = (f-32)*5/9;
                            });
                          },
                        ),
                      ),
                      Text(
                        '°F',
                        style: TextStyle(
                          fontSize: 65,
                          color: Colors.white,
                          fontWeight: FontWeight.w500
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height*0.5,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          c.toStringAsFixed(2),
                          style: TextStyle(
                              fontSize: 55,
                              color: Colors.black,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.05,
                      ),
                      Text(
                        '°C',
                        style: TextStyle(
                            fontSize: 65,
                            color: Colors.black,
                            fontWeight: FontWeight.w500
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height*0.47,
            left: MediaQuery.of(context).size.width*0.46,
            child: CircleAvatar(
              backgroundColor: Color(0xff4dd0e1),
              radius: 20,
              child: Transform.rotate(
                angle: 90 * math.pi/180,
                child: Icon(
                  Icons.compare_arrows,
                  size: 28,
                  color: Colors.white,
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}
