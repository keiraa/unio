import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List fac = [
    {
      "IconActive": FontAwesomeIcons.lightbulb,
      "IconInactive": FontAwesomeIcons.solidLightbulb,
      "IconName" : "Bulb"
    },
    {
      "IconActive": FontAwesomeIcons.bolt,
      "IconInactive": FontAwesomeIcons.bolt,
      "IconName" : "Electricity"
    },

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(20),
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          children: fac.map<Widget>((item) => FacCard(iconName: item["IconName"], activeIcon: item["IconActive"], inactiveIcon: item["IconInactive"],)).toList(),
        ),
      ),
    );
  }
}


class FacCard extends StatefulWidget {
  FacCard({this.iconName,this.inactiveIcon,this.activeIcon});
  final IconData activeIcon, inactiveIcon;
  final String iconName;
  @override
  _FacCardState createState() => _FacCardState();
}

class _FacCardState extends State<FacCard> {
  bool isClicked=false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          isClicked = !isClicked;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isClicked?Color(0xff5c6bc0):Color(0xff7986cb),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              isClicked?widget.inactiveIcon:widget.activeIcon,
              color: Colors.white,
              size: 50,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.iconName,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 23
              ),
            )
          ],
        ),
      ),
    );
  }
}



