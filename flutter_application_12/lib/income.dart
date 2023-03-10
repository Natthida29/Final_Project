import 'package:flutter/material.dart';
import 'package:flutter_application_12/Deduction.dart';
import 'package:flutter_application_12/TaxCalculator.dart';

void main() {
  runApp(const MaterialApp(
    home: Income(),
  ));
}

class Income extends StatefulWidget {
  const Income({super.key});

  @override
  State<Income> createState() => _IncomeState();
}

class _IncomeState extends State<Income> {
  TextEditingController title = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('รายได้'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            // ListTile(
            //   leading: CircleAvatar(
            //     backgroundImage: AssetImage('assets/images/logo.png'),
            //   ),
            //   onTap: () => Navigator.push(context,
            //       MaterialPageRoute(builder: ((context) => TaxCalculator()))),
            // ),
            // ignore: prefer_const_constructors
            TextField(
              keyboardType: TextInputType.number,
              enabled: false,
              decoration: const InputDecoration(
                  //hintText: 'เงินเดือนของคุณเดือนละ',
                  labelText: 'เงินเดือนของคุณต่อปี',
                  border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16.0),
            const TextField(
              keyboardType: TextInputType.number,
              enabled: false,
              decoration: InputDecoration(
                  //hintText: 'ระบุโบนัสที่คุณได้รับในปี',
                  labelText: 'โบนัสที่คุณได้รับในปี',
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) =>
                            const Deduction()))); //กดปุ่มถัดไปเพื่อไปยังหน้าลดหย่อน
              },
              child: const Text("ถัดไป"),
            )
          ],
        ),
      ),
    );
  }
}
