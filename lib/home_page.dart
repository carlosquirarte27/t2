import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  var costController = TextEditingController();
  int radioGroupSelector = 2;
  double tip = .15;
  bool roundTip = true;
  double totalTip = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tip Time (Tarea 2)'),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: [
          Container(
            height: 10,
          ),
          ListTile(
            leading: const Icon(Icons.room_service),
            title: Padding(
              padding: const EdgeInsets.only(right: 100),
              child: TextField(
                controller: costController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label: Text("Cost of service"),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.dinner_dining),
            title: Text('How was the service?'),
          ),
          RadioListTile<int>(
            contentPadding: const EdgeInsets.only(left: 70),
            title: Text('Amazing (20%)'),
            value: 0,
            groupValue: radioGroupSelector,
            onChanged: (radioValue) {
              setState(() {
                if (radioValue != null) {
                  radioGroupSelector = radioValue;
                  tip = .2;
                }
              });
            },
          ),
          RadioListTile<int>(
            contentPadding: const EdgeInsets.only(left: 70),
            title: Text('Good (18%)'),
            value: 1,
            groupValue: radioGroupSelector,
            onChanged: (radioValue) {
              setState(() {
                if (radioValue != null) {
                  radioGroupSelector = radioValue;
                  tip = .18;
                }
              });
            },
          ),
          RadioListTile<int>(
            contentPadding: const EdgeInsets.only(left: 70),
            title: Text('Okay (15%)'),
            value: 2,
            groupValue: radioGroupSelector,
            onChanged: (radioValue) {
              setState(() {
                if (radioValue != null) {
                  radioGroupSelector = radioValue;
                  tip = .15;
                }
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.credit_card),
            title: Row(
              children: [
                const Text('Round up tip'),
                Switch(
                  value: roundTip,
                  onChanged: (newValue) {
                    setState(() {
                      roundTip = newValue;
                    });
                  },
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 70, top:1, right: 20),
            child: MaterialButton(
              color: Colors.green,
              onPressed: _tipCalculation,
              child: const Text(
                'CALCULATE',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 30),
            child: Text(
              'Tip Amount: \$${totalTip.toStringAsFixed(2)}',
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }


  void _tipCalculation() {
    double? FinalCost = double.tryParse(costController.text);
      if (FinalCost == null) {
      return;
    }
    setState(() {
      if (roundTip) {
        totalTip = (tip * FinalCost).ceilToDouble();
      } else {
        totalTip = tip * FinalCost;
      }
    });
  }
}
