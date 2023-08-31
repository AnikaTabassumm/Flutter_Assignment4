import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const Color bodyColor = Color(0xff0E2433);
  static const Color buttonColor = Color(0xff0B344F);
  static const Color buttonEqual = Color(0xff296D98);

  String userInput = "";
  String result = "0";
  Parser parser = Parser();
  ContextModel contextModel = ContextModel();

  void Button_Function(String input) {
    setState(() {
      if (input == '=') {
        try {
          Expression expression = parser.parse(userInput);
          double evalResult =
              expression.evaluate(EvaluationType.REAL, contextModel);

          if (evalResult == evalResult.toInt()) {
            result = evalResult.toInt().toString();
          } else {
            result = evalResult.toStringAsPrecision(10);
          }
        } catch (e) {
          result = 'Error';
        }
        ;
      } else if (input == 'C') {
        userInput = '';
        result = '0';
      } else if (input == 'X') {
        if (userInput.isNotEmpty) {
          userInput = userInput.substring(0, userInput.length - 1);
        }
      } else if (input == '%') {
        userInput = userInput.replaceAll('%', '');
        double inputNumber = double.tryParse(userInput) ?? 0;
        double resultValue = inputNumber / 100;
        userInput = resultValue.toString();
      } else {
        userInput += input;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: bodyColor,
          title: const Text(
            "Calculator",
            style: TextStyle(fontSize: 20.5, color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Column(children: [
          Expanded(
            child: Container(
              color: bodyColor,
              padding: const EdgeInsets.only(
                left: 40,
                right: 40,
                top: 40,
                bottom: 40,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(userInput,
                          style: TextStyle(fontSize: 30, color: Colors.white))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(result,
                          style: TextStyle(fontSize: 40, color: Colors.white)),
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
                color: buttonColor,
                child: Row(children: [
                  Expanded(
                      child: Column(children: [
                    Expanded(
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "V",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          )),
                    ),
                    Expanded(
                      child: TextButton(
                          onPressed: () => Button_Function('('),
                          child: const Text(
                            "(",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          )),
                    ),
                    Expanded(
                      child: TextButton(
                          onPressed: () => Button_Function('1'),
                          child: const Text(
                            "1",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          )),
                    ),
                    Expanded(
                      child: TextButton(
                          onPressed: () => Button_Function('4'),
                          child: const Text(
                            "4",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          )),
                    ),
                    Expanded(
                      child: TextButton(
                          onPressed: () => Button_Function('7'),
                          child: const Text(
                            "7",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          )),
                    ),
                    Expanded(
                      child: TextButton(
                          onPressed: () => Button_Function('0'),
                          child: const Text(
                            "0",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          )),
                    ),
                  ])),
                  Expanded(
                      child: Column(
                    children: [
                      Expanded(
                        child: TextButton(
                            onPressed: () => Button_Function('C'),
                            child: const Text(
                              "C",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )),
                      ),
                      Expanded(
                        child: TextButton(
                            onPressed: () => Button_Function(')'),
                            child: const Text(
                              ")",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )),
                      ),
                      Expanded(
                        child: TextButton(
                            onPressed: () => Button_Function('2'),
                            child: const Text(
                              "2",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )),
                      ),
                      Expanded(
                        child: TextButton(
                            onPressed: () => Button_Function('5'),
                            child: const Text(
                              "5",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )),
                      ),
                      Expanded(
                        child: TextButton(
                            onPressed: () => Button_Function('8'),
                            child: const Text(
                              "8",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )),
                      ),
                      Expanded(
                        child: TextButton(
                            onPressed: () => Button_Function('00'),
                            child: const Text(
                              "00",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )),
                      ),
                    ],
                  )),
                  Expanded(
                      child: Column(
                    children: [
                      Expanded(
                        child: TextButton(
                            onPressed: () => Button_Function('X'),
                            child: const Text(
                              "X",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )),
                      ),
                      Expanded(
                        child: TextButton(
                            onPressed: () => Button_Function('%'),
                            child: const Text(
                              "%",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )),
                      ),
                      Expanded(
                        child: TextButton(
                            onPressed: () => Button_Function('3'),
                            child: const Text(
                              "3",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )),
                      ),
                      Expanded(
                        child: TextButton(
                            onPressed: () => Button_Function('6'),
                            child: const Text(
                              "6",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )),
                      ),
                      Expanded(
                        child: TextButton(
                            onPressed: () => Button_Function('9'),
                            child: const Text(
                              "9",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )),
                      ),
                      Expanded(
                        child: TextButton(
                            onPressed: () => Button_Function('.'),
                            child: const Text(
                              ".",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )),
                      ),
                    ],
                  )),
                  Expanded(
                      child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: TextButton(
                            onPressed: () => Button_Function('/'),
                            child: const Text(
                              "/",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )),
                      ),
                      Expanded(
                        flex: 1,
                        child: TextButton(
                            onPressed: () => Button_Function('*'),
                            child: const Text(
                              "*",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )),
                      ),
                      Expanded(
                        flex: 1,
                        child: TextButton(
                            onPressed: () => Button_Function('-'),
                            child: const Text(
                              "-",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )),
                      ),
                      Expanded(
                        flex: 1,
                        child: TextButton(
                            onPressed: () => Button_Function('+'),
                            child: const Text(
                              "+",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )),
                      ),
                      Expanded(
                          flex: 2,
                          child: TextButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(buttonEqual),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0),
                                  ))),
                              onPressed: () => Button_Function('='),
                              child: const Text(
                                "=",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              )))
                    ],
                  ))
                ])),
          )
        ]));
  }
}
