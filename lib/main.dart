import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  TextEditingController gold = TextEditingController();
  TextEditingController silver = TextEditingController();
  TextEditingController cash = TextEditingController();

  Rxn<String> getResult = Rxn<String>();
  double check(double gold, double silver, double cash) {
    double result = 0.0;
    if (gold != 0 && silver == 0 && cash == 0) {
      if (gold > 776872.0) {
        result = gold * 0.025;
        getResult.value = result.toString();
      } else {
        print('Zakat is not applicable on you');
        getResult.value = 'Zakat is not applicable on you';
      }
    } else {
      var total = gold + silver + cash;
      if (total > 74000) {
        result = total * 0.025;
        getResult.value = result.toString();
        print(result);
      } else {
        print('Zakat is not applicable on you');
        getResult.value = 'Zakat is not applicable on you';
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        bottomNavigationBar: const BottomAppBar(
          color: Color(0xff202226),
          elevation: 0.0,
          child: Text(
            ' Developed under the instructions of: \n instagram.com/DholaSain   by  instagram.com/iamvee_k\n\n',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
        appBar: AppBar(
            title: const Center(
              child: Text(
                'Zakat Calculator',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            backgroundColor: const Color(0xFF4D4691)),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    decoration: kGTextFieldInputDecoration,
                    controller: gold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    decoration: kSTextFieldInputDecoration,
                    controller: silver,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    decoration: kMTextFieldInputDecoration,
                    controller: cash,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  onPressed: () {
                    check(double.parse(gold.text), double.parse(silver.text),
                        double.parse(cash.text));
                  },
                  child: const Text(
                    'Get Zakat',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: const Color(0xFF4D4691),
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(
                  () => Text(
                    '$getResult Rupees',
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
