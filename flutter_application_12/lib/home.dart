// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_12/TaxCalculator.dart';
import 'package:flutter_application_12/Deduction.dart';
import 'package:flutter_application_12/income.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ภาษี ภงด.91"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "images/tax.png",
                width: 200.0,
                height: 200.0,
              ),
              const SizedBox(height: 30.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.add),
                  label: Text("รายได้", style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    CrossAxisAlignment.center;
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const Income();
                    }));
                  },
                ),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.add),
                  label: Text("ลดหย่อนภาษี", style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    CrossAxisAlignment.center;
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Deduction();
                    }));
                  },
                ),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.add),
                  label: Text("คำนวณภาษี", style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    CrossAxisAlignment.center;
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return TaxCalculator(
                        text: '',
                      );
                    }));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
