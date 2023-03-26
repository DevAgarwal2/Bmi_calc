
import 'package:bmi_calc/pages4/design.dart';
import 'package:bmi_calc/pages4/home_page.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result(
      {super.key,
      required this.bmi_result,
      required this.result_text,
      required this.bmi_feed});
  final String bmi_result;
  final String result_text;
  final String bmi_feed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(padding: EdgeInsets.all(30)),
          Expanded(
              child: Text(
            "Your Result",
            style: kstyle,
          )),
          Expanded(
            flex: 7,
            child: NewWidget(
                active_color,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: Text(
                        "$result_text",
                        style:
                            TextStyle(color: Colors.green[400], fontSize: 40),
                      ),
                    ),
                    Center(
                      child: Text(
                        bmi_result,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 70,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Center(
                      child: Text(
                        "$bmi_feed",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                )),
          ),
          BottomButton(
            results: () {
              Navigator.pop(context);
            },
            button_text: "Result",
          )
        ],
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  const BottomButton(
      {super.key, required this.results, required this.button_text});
  final Function() results;
  final String button_text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: results,
      child: Container(
        child: Center(
            child: Text(
          "$button_text",
          style: estyle,
        )),
        margin: EdgeInsets.only(top: 10),
        width: 500,
        height: 70,
        decoration: BoxDecoration(
            color: bottom_color, borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
