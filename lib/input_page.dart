import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';

const BottomContainerHeight = 80.0;
const activeCardColour = Color(0xff1d1e33);
const BottomContainerColour = Color(0xffeb1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  cardChild:
                      IconContent(icon: FontAwesomeIcons.mars, label: 'Male'),
                  colour: activeCardColour,
                ),
              ),
              Expanded(
                child: ReusableCard(
                  cardChild: IconContent(
                      icon: FontAwesomeIcons.venus, label: 'Female'),
                  colour: activeCardColour,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ReusableCard(
            colour: activeCardColour,
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  colour: activeCardColour,
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: activeCardColour,
                ),
              ),
            ],
          ),
        ),
        Container(
          color: BottomContainerColour,
          width: double.infinity,
          margin: EdgeInsets.only(top: 10.0),
          height: BottomContainerHeight,
        ),
      ]),
    );
  }
}
