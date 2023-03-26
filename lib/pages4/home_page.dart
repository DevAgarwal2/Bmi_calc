
import "package:bmi_calc/pages4/design.dart";
import "package:bmi_calc/pages4/result.dart";
import "package:flutter/material.dart";

import "bmiCalc.dart";
import "logic.dart";

class Bmi_home extends StatefulWidget {
  const Bmi_home({Key? key}) : super(key: key);

  @override
  State<Bmi_home> createState() => _Bmi_homeState();
}

class _Bmi_homeState extends State<Bmi_home> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  print("Hello world");
                  setState(() {
                    change(Gender.male1);
                  });
                },
                child: NewWidget(
                    male,
                    Column(
                      children: [
                        Padding(padding: EdgeInsets.all(10)),
                        Icon(
                          Icons.male,
                          size: 100,
                        ),
                        Padding(padding: EdgeInsets.all(2)),
                        Text(
                          "Male",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    )),
              ),
            ),
            Expanded(
                child: GestureDetector(
              onTap: () {
                print("Hello 2");
                setState(() {
                  change(Gender.female2);
                });
              },
              child: NewWidget(
                  female,
                  Column(
                    children: [
                      Padding(padding: EdgeInsets.all(10)),
                      Icon(
                        Icons.female,
                        size: 100,
                      ),
                      Padding(padding: EdgeInsets.all(2)),
                      Text(
                        "Female",
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  )),
            )),
          ],
        )),
        Expanded(
            child: Row(
          children: [
            Expanded(
                child: NewWidget(
                    Color(0xFF1D1E33),
                    Column(
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(padding: EdgeInsets.all(10)),
                        Text(
                          "HEIGHT",
                          style: TextStyle(fontSize: 20),
                        ),
                        Padding(padding: EdgeInsets.all(5)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '$kheight',
                              style: kstyle,
                            ),
                            Padding(padding: EdgeInsets.only(left: 3)),
                            Text(
                              "cm",
                              style: kstyle,
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Color(0xFF8D8E98),
                              overlayColor: Color(0xFFEB1555),
                              thumbColor: Color(0xFFEB1555),
                              thumbShape: const RoundSliderThumbShape(
                                  enabledThumbRadius: 15.0),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 30.0)),
                          child: Slider(
                            value: kheight.toDouble(),
                            min: 120,
                            max: 250,
                            onChanged: (double newvalue) {
                              setState(() {
                                kheight = newvalue.round();
                              });
                            },
                          ),
                        ),
                      ],
                    )))
          ],
        )),
        Expanded(
            child: Row(
          children: [
            Expanded(
                child: NewWidget(
                    Color(0xFF1D1E33),
                    Column(
                      children: [
                        Padding(padding: EdgeInsets.all(10)),
                        Text(
                          "WEIGHT",
                          style: bstyle,
                        ),
                        Padding(padding: EdgeInsets.all(5)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "$weight",
                              style: TextStyle(fontSize: 40),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Roundicon(
                              icon: Icons.remove,
                              ok: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Roundicon(
                              icon: Icons.add,
                              ok: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ))),
            Expanded(
                child: NewWidget(
                    Color(0xFF1D1E33),
                    Column(
                      children: [
                        Padding(padding: EdgeInsets.all(10)),
                        Text(
                          "AGE",
                          style: bstyle,
                        ),
                        Padding(padding: EdgeInsets.all(5)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "$age",
                              style: TextStyle(fontSize: 40),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Roundicon(
                                icon: Icons.remove,
                                ok: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                            SizedBox(
                              width: 10,
                            ),
                            Roundicon(
                                icon: Icons.add,
                                ok: () {
                                  setState(() {
                                    age++;
                                  });
                                })
                          ],
                        )
                      ],
                    )))
          ],
        )),
        BottomButton(results: (){
          BMI bmi = BMI(height: kheight,weight: weight);
           
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Result(
            bmi_result: bmi.calc_bmi(),
            result_text: bmi.get_result(),
            bmi_feed: bmi.get_feedback(),
          )));
        }, button_text: "Submit")
        
      ],
    );
  }
}

class NewWidget extends StatelessWidget {
  NewWidget(this.colour, this.card);
  Color colour;
  Widget card;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: card,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(10)));
  }
}

class Roundicon extends StatelessWidget {
  Roundicon({super.key, required this.icon, required this.ok});
  final IconData icon;
  Function() ok;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: ok,
      child: Icon(icon),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
      elevation: 6,
    );
  }
}
