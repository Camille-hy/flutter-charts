import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class LinearProgressExample extends StatefulWidget {
  const LinearProgressExample({Key? key});

  @override
  State<LinearProgressExample> createState() => _LinearProgressExampleState();
}

class _LinearProgressExampleState extends State<LinearProgressExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LinearPercentIndicator(
                    width: MediaQuery.of(context).size.width - 190,
                    lineHeight: 23,
                    percent: 0.8,
                    barRadius: Radius.circular(10),
                    leading: Text(
                      'AL',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    trailing: Text(
                      '(8.00 / 10.00)',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    linearGradient: LinearGradient(
                      colors: [Colors.blue, Colors.purple],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  LinearPercentIndicator(
                    width: MediaQuery.of(context).size.width - 190,
                    lineHeight: 23,
                    percent: 0.5,
                    barRadius: Radius.circular(10),
                    leading: Text(
                      'ML',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    trailing: Text(
                      '(5.00 / 10.00)',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    linearGradient: LinearGradient(
                      colors: [Colors.blue, Colors.purple],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  LinearPercentIndicator(
                    width: MediaQuery.of(context).size.width - 190,
                    lineHeight: 23,
                    percent: 0.9,
                    barRadius: Radius.circular(10),
                    leading: Text(
                      'MC',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    trailing: Text(
                      '(9.00 / 10.00)',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    linearGradient: LinearGradient(
                      colors: [Colors.blue, Colors.purple],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
