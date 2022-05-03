import 'package:bmi_calculator/widgets/gender_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();
  int selected = 0;
  double result = 0;
  String comment = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("BMI Calculator"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: GenderButton(
                    gender: 'Man',
                    func: () {
                      setState(() {
                        selected = 0;
                      });
                    },
                    color: selected == 0
                        ? Colors.cyan[900]
                        : Colors.white.withOpacity(0.5),
                  ),
                ),
                Expanded(
                  child: GenderButton(
                    gender: 'Woman',
                    func: () {
                      setState(() {
                        selected = 1;
                      });
                    },
                    color: selected == 1
                        ? Colors.cyan[900]
                        : Colors.white.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Your height in cm:',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 2),
                  TextField(
                    controller: height,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Your weight in kg:',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 2),
                  TextField(
                    controller: weight,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Text(
                  'Your BMI is:',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.cyan[900],
                  ),
                ),
                Text(
                  result.toStringAsFixed(2),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                Text(
                  comment.isNotEmpty ? comment : ' ',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          GestureDetector(
              child: Container(
                height: 60,
                width: double.infinity,
                color: Colors.cyan[900],
                child: const Center(
                  child: Text(
                    'CALCULATE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              onTap: () {
                setState(() {
                  double h = double.parse(height.value.text);
                  double w = double.parse(weight.value.text);
                  calculate(h, w);
                });
              })
        ],
      ),
    );
  }

  void calculate(double height, double weight) {
    result = weight / (height * height / 10000);
    if (result < 18.5) {
      comment = 'You are underweight';
    } else if (result == 18.5 && result <= 24.9) {
      comment = 'You are normal';
    } else {
      comment = 'You are overweight';
    }
  }
}
