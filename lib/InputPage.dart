// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const activeCardColor=Color(0xFF1D1E33);
const inactiveCardColor=Color(0xFF111328);


class InputPage extends StatefulWidget {
  const InputPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<InputPage> createState() => _InputPageState();
}
class _InputPageState extends State<InputPage> {

  Color maleCardColor=inactiveCardColor;
  Color femaleCardColor=inactiveCardColor;
  int height=180;
  int weight=60;
  int age=18;


  void updateColor(int gender)
  {
    if(gender==1)
      {
        if(maleCardColor==inactiveCardColor)
          {
            maleCardColor=activeCardColor;
          }
        else{
          maleCardColor=inactiveCardColor;
        }
      }
    //female card
    else if(gender==2)
      {
        if(femaleCardColor==inactiveCardColor)
          {
            femaleCardColor=activeCardColor;
          }
        else{
          femaleCardColor=inactiveCardColor;
        }
      }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        title: Center(child: Text(widget.title)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child:

                  GestureDetector(
                    onTap: (){
                      setState((){
                        updateColor(1);
                      });
                    },
                    child: ReUseableCard(
                      color: maleCardColor,
                      cardChild: Padding(

                        padding: const EdgeInsets.all(25.0),
                        child: Column(
                          children: [
                            Icon(
                              FontAwesomeIcons.mars,
                              size: 65,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text('MALE',style: TextStyle(fontSize: 18,color: Color(0xFF8D8E98),),),
                          ],

                        ),
                      ),
                    ),
                  ),
                ),
                //2nd box
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState((){
                        updateColor(2);
                      });

                    },
                    child: ReUseableCard(
                      color: femaleCardColor,
                      cardChild: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Column(
                          children: [
                            Icon(
                              FontAwesomeIcons.venus,
                              size: 65,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text('Female',style: TextStyle(fontSize: 18,color: Color(0xFF8D8E98),),),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReUseableCard(
              color: Color(0xFF1D1E33),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Height'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text('cm',style: TextStyle(fontSize: 18,color: Color(0xFF8D8E98),),),

                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      thumbColor: Color(0xFFEB1555),
                      activeTrackColor: Colors.white,
                      overlayColor: Color(0x29EB1555),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        inactiveColor: Color(0xFF8D8E98),
                        onChanged: (double newValue){
                          setState((){
                            height=newValue.round();
                          });
                          //print(newValue);
                        }),
                  ),

                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReUseableCard(
                    color: Color(0xFF1D1E33),
                    cardChild: Column(

                      children: [
                        Text(
                          'Weight',
                          style: TextStyle(fontSize: 18,color: Color(0xFF8D8E98),),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              weight.toString(),
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Text(
                              'kg',
                              style: TextStyle(fontSize: 18,color: Color(0xFF8D8E98),),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed:(){
                                setState((){
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(width:10),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed:(){
                                setState((){
                                  weight++;
                                });
                              },

                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                //2nd box

                Expanded(
                  child: ReUseableCard(
                    color: Color(0xFF1D1E33),
                    cardChild: Column(
                      children: [
                        Text(
                          'Age',
                          style: TextStyle(fontSize: 18,color: Color(0xFF8D8E98),),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              age.toString(),
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed:(){
                                setState((){
                                  age--;
                                });
                              },
                            ),
                            SizedBox(width:10),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed:(){
                                setState((){
                                  age++;
                                });
                              },
                            ),
                          ],
                        )

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: (){},
            child: Text('Calculate'),
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
              onPrimary: Colors.white,
            ),
          )


        ],
      ),

    );
  }
}

class ReUseableCard extends StatelessWidget {
  ReUseableCard({required this.color,required this.cardChild});

  final Color color;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0)
      ),
    );
  }
}


class RoundIconButton extends StatelessWidget {
  const RoundIconButton({Key? key, required this.icon, required this.onPressed}) : super(key: key);

  final IconData icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      shape: CircleBorder(),
      fillColor: Color(0xFF8D8E98),
      elevation: 0,
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      child: Icon(icon),
    );
  }
}
