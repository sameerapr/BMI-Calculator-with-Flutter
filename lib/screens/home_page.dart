import 'dart:ffi';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int weight = 60;
  int height = 150;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
        title: Text('BMI Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 251, 111, 111),
                borderRadius: BorderRadius.circular(5.0),
              ),
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 80,
                    height: 125.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/assets/images/image1.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(
                          'What is your weight?',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Color.fromARGB(255, 234, 236, 238)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                weight.toString(),
                                style: TextStyle(
                                    fontSize: 35, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 6.0),
                            child: Text(
                              'KG',
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight += 1;
                                });
                              },
                              child: const Icon(Icons.add),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight -= 1;
                                });
                              },
                              child: const Icon(Icons.remove),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 79, 129, 222),
                borderRadius: BorderRadius.circular(5.0),
              ),
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 80.0,
                    height: 125.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/assets/images/image2.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(
                          'What is your weight?',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Color.fromARGB(255, 234, 236, 238)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                height.toString(),
                                style: TextStyle(
                                    fontSize: 35, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 6.0),
                            child: Text(
                              'CM',
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: FloatingActionButton(
                              backgroundColor:
                                  Color.fromARGB(255, 251, 111, 111),
                              onPressed: () {
                                setState(() {
                                  height += 1;
                                });
                              },
                              child: const Icon(Icons.add),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: FloatingActionButton(
                              backgroundColor:
                                  Color.fromARGB(255, 251, 111, 111),
                              onPressed: () {
                                setState(() {
                                  height -= 1;
                                });
                              },
                              child: const Icon(Icons.remove),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            FloatingActionButton.extended(
              onPressed: () {
                var bmi = calculateBMI();
                print(bmi);

                if (bmi > 0 && bmi < 18.4) {
                  _showUnderweightDialog(context);
                } else if (bmi > 18.5 && bmi < 24.9) {
                  _healthyWeightDialog(context);
                } else if (bmi > 25.0 && bmi < 29.9) {
                  _overweightDialog(context);
                }
              },
              icon: Icon(Icons.save),
              label: Text("Calculate"),
            ),
          ],
        ),
      ),
    );
  }

  double calculateBMI() {
    double bmiHeight = height.toDouble() / 100;
    double bmiWieght = weight.toDouble();
    double heightSquare = bmiHeight * bmiHeight;
    double result = bmiWieght / heightSquare;

    return result;
  }

  _showUnderweightDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: ((BuildContext context) {
          return Dialog(
            child: Stack(children: [
              Center(
                child: Column(
                  children: [
                    Container(
                      color: Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Container(
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            'Your Result',
                            style: TextStyle(
                                fontSize: 28.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        width: 220,
                        height: 280.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                                AssetImage('lib/assets/images/under_risk.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Your BMI : ',
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          calculateBMI().toStringAsFixed(1),
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          overflow: TextOverflow.fade,
                          text: const TextSpan(
                            text: 'You are ',
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 20),
                            children: [
                              TextSpan(
                                text: 'AT LOW RISK',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 223, 14, 14),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'for obesity-related diseases',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ]),
          );
        }));
  }

  _healthyWeightDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: ((BuildContext context) {
          return Dialog(
            child: Stack(children: [
              Center(
                child: Column(
                  children: [
                    Container(
                      color: Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Container(
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            'Your Result',
                            style: TextStyle(
                                fontSize: 28.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        width: 220,
                        height: 280.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'lib/assets/images/Healthy_Weight.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Your BMI : ',
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          calculateBMI().toStringAsFixed(1),
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          overflow: TextOverflow.fade,
                          text: const TextSpan(
                            text: 'You are ',
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 20),
                            children: [
                              TextSpan(
                                text: 'AT HEALTHY WEIGHT',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 136, 20),
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Keep up good work!',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ]),
          );
        }));
  }

  _overweightDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: ((BuildContext context) {
          return Dialog(
            child: Stack(children: [
              Center(
                child: Column(
                  children: [
                    Container(
                      color: Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Container(
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            'Your Result',
                            style: TextStyle(
                                fontSize: 28.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        width: 220,
                        height: 280.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                                AssetImage('lib/assets/images/Overweight.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Your BMI : ',
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          calculateBMI().toStringAsFixed(1),
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          overflow: TextOverflow.fade,
                          text: const TextSpan(
                            text: 'You are ',
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 20),
                            children: [
                              TextSpan(
                                text: 'AT MODERATE RISK',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 180, 196, 1),
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'for obesity-related diseases',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ]),
          );
        }));
  }
}
