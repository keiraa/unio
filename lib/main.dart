import 'package:flutter/material.dart';
import 'package:unio/Screens/temperature.dart';

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
  ));
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool auth = true;

  authenticate() {
    if(auth){
      print('Login Successful');
    }
    else{
      print('Sign Up Successful');
    }
    Navigator.push(context, MaterialPageRoute(builder: (context) => TempCalc()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xff155cb0),
        ),
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.07,
            ),
            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Welcome to\n',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w600
                  ),
                  children: [
                    TextSpan(
                      text: 'Unio Labs',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.w700
                      ),
                    )
                  ]
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.032,
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.81,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                color: Colors.white
              ),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                if(!auth){
                                  auth = true;
                                }
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
                                color: auth?Color(0xff1976d2):Colors.white,
                              ),
                              child: Center(
                                child: Text(
                                  'Log In',
                                  style: TextStyle(
                                    color: auth?Colors.white:Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                if(auth){
                                  auth = false;
                                }
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(topRight: Radius.circular(20)),
                                color: auth?Colors.white:Color(0xff1976d2),
                              ),
                              child: Center(
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      color: auth?Colors.black:Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.12,
                  ),
                  CredentialField(icon: Icons.account_circle, hint: 'example@gmail.com',),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.04,
                  ),
                  CredentialField(icon: Icons.lock, hint: '************', password: true,),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.1,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: (){
                        authenticate();
                      },
                      child: Container(
                        width: 140,
                        height: 55,
                        child: Card(
                          color: Color(0xff155cb0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                          ),
                          elevation: 10,
                          child: Center(
                            child: Text(
                              auth?'Login':'Sign Up',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}



class CredentialField extends StatelessWidget {
  CredentialField({this.hint,this.icon, this.password = false});
  final IconData icon;
  final String hint;
  final bool password;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.horizontal(left: Radius.circular(10))
            ),
            height: 55,
            padding: EdgeInsets.all(10),
            child: Center(
              child: Icon(
                icon,
                color: Color(0xff155cb0),
                size: 25,
              ),
            ),
          ),
          Flexible(
            child: TextField(
              keyboardType: TextInputType.number,
              obscureText: password,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500
              ),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                fillColor: Colors.white70,
                filled: true,
                alignLabelWithHint: true  ,
                hintText: hint,
                hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 18
                ),
              ),
              onChanged: (value){
                //phone = value;
              },
            ),
          ),
        ],
      ),
    );
  }
}
