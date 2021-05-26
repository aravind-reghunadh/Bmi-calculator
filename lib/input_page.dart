import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;

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
                  onpress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.mars,
                    label: 'Male',
                  ),
                  colour: selectedGender == Gender.male
                      ? kActiveCardColour
                      : kInactiveCardColour,
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onpress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.venus,
                    label: 'Female',
                  ),
                  colour: selectedGender == Gender.female
                      ? kActiveCardColour
                      : kInactiveCardColour,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ReusableCard(
            colour: kActiveCardColour,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'HEIGHT',
                  style: kLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      height.toString(),
                      style: kNumberText,
                    ),
                    Text(
                      'cm',
                      style: kLabelTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Color(0xff8d8e98),
                    thumbColor: Color(0xffeb1555),
                    overlayColor: Color(0x26eb1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape:
                        RoundSliderThumbShape(enabledThumbRadius: 30.0),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    activeColor: Color(0xffeb1555),
                    inactiveColor: Color(0xff8d8e98),
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColour,
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColour,
                ),
              ),
            ],
          ),
        ),
        Container(
          color: kBottomContainerColour,
          width: double.infinity,
          margin: EdgeInsets.only(top: 10.0),
          height: kBottomContainerHeight,
        ),
      ]),
    );
  }
}
