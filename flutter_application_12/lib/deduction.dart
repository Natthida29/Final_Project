import 'package:flutter/material.dart';
import 'package:flutter_application_12/TaxCalculator.dart';

class Deduction extends StatefulWidget {
  const Deduction({super.key});

  @override
  State<Deduction> createState() => _DeductionState();
}

class _DeductionState extends State<Deduction> {
  final String _status = 'เลือกสถานะ';
  TextEditingController price = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController detail = TextEditingController();

  final List<String> _maritalStatusList = [
    'โสด',
    'สมรส',
    'หย่าร้าง',
    'หม้าย',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('รายการลดหย่อนภาษี: ครอบครัว'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
            child: Column(
              children: <Widget>[
                const Text(
                  'ค่าลดหย่อนส่วนบุคคล',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                TextField(
                  enabled: false,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: '60,000 บาท'),
                  controller: TextEditingController(),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                const Text(
                  'ค่าลดหย่อนบุตร',
                  style: TextStyle(fontSize: 18.0),
                ),
                TextField(
                  enabled: false,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'หักลดหย่อนได้คนละ 30,000 บาท'),
                  controller: TextEditingController(),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                const Text(
                  'ค่าลดหย่อนบิดา - มารดา',
                  style: TextStyle(fontSize: 18.0),
                ),
                TextField(
                  enabled: false,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'หักลดหย่อนได้คนละ 30,000 บาท'),
                  controller: TextEditingController(),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                const Text(
                  'ค่าลดหย่อนคู่สมรส',
                  style: TextStyle(fontSize: 18.0),
                ),
                TextField(
                  enabled: false,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'หักได้ไม่เกิน 60,000 บาท'),
                  controller: TextEditingController(),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => TaxCalculator(
                            text: '',
                          )))); //กดปุ่มถัดไปเพื่อไปยังหน้า
            },
            child: const Text("ถัดไป"),
          )
        ],
      ),
    );
  }
}
