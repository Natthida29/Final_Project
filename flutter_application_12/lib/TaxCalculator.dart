import 'dart:math';
import 'package:flutter/material.dart';

class TaxCalculator extends StatefulWidget {
  const TaxCalculator({super.key, required String text});

  @override
  // ignore: library_private_types_in_public_api
  _TaxCalculatorState createState() => _TaxCalculatorState();
}

class _TaxCalculatorState extends State<TaxCalculator> {
  bool _isChecked = false;
  double textFieldValue = 0;

  TextEditingController numberOfChildrenController = TextEditingController();
  TextEditingController numberOffahmaController = TextEditingController();
  final TextEditingController _textFieldController = TextEditingController();
  TextEditingController bonusController = TextEditingController();

  late int numberOfChildren;
  late int numberOffahma;
  late double childdeduction;
  late int fahmadeduction;
  late int persondeduction;
  final TextEditingController _incomeController = TextEditingController();

  double _expenseDeduction = 0; //หักค่าใช้จ่าย50%
  double childDeduction = 0;
  double _deducperson = 60000; //ลดหย่อนตัวเอง
  double _fahmadeduction = 0; //ลดหย่อนพ่อแม่
  double _textFieldValue = 0;
  double netmoney = 0;
  double totaldeduction = 0;
  double bonus = 0;
  double _totaldeduction = 0;
  //double _childDeduction = 30000;

  void _reset() {
    setState(() {
      bonusController.text = '';
      _incomeController.text = '';
      numberOfChildrenController.text = '';
      numberOffahmaController.text = '';
      _textFieldController.text = '';
      _isChecked = false;
      _fahmadeduction = 0;
      _textFieldValue = 0;
      childDeduction = 0;
      totaldeduction = 0;
      netmoney = 0;
      bonus = 0;
    });
  }

  void initState() {
    super.initState();
    _textFieldController.text = '';
  }

  void dispose() {
    _incomeController.dispose();
    super.dispose();
  }

  void _calculateTax() {
    int income = int.tryParse(_incomeController.text) ?? 0;
    int bonus = int.tryParse(bonusController.text) ?? 0;

    _expenseDeduction = ((income + bonus) * 0.5) > 100000
        ? 100000
        : (income + bonus) * 0.5; //ไม่เกิน 100,000

    childDeduction = childDeduction;
    _deducperson = _deducperson;
    _fahmadeduction = _fahmadeduction;
    double persondeduction = _deducperson; //ลดหย่อนส่วนบุคคล
    double totaldeduction = persondeduction +
        childDeduction +
        _fahmadeduction +
        (_isChecked ? 60000 : 0); //ค่าลดหย่อนทั้งหมด
    // setState(() {
    //   _totaldeduction = totaldeduction;
    // });
    int taxableIncome = (income + bonus); //เงินได้ที่นำไปคำนวณภาษี
    double balance =
        taxableIncome - _expenseDeduction; //คงเหลือหลังจากหักค่าใช้จ่าย
    double netmoney = max(balance - totaldeduction, 0); //เงินได้สุทธิ
    double tax = 0;

    if (netmoney <= 150000) {
      tax = 0; //เงินได้สุทธิ 0 - 150,000
    } else if (netmoney <= 300000) {
      tax = (netmoney - 150000) * 0.05; //เงินได้สุทธิ150,001-300,000
    } else if (netmoney <= 500000) {
      tax = (netmoney - 300000) * 0.1 + 7500; //เงินได้สุทธิ300,001-500,000
    } else if (netmoney <= 750000) {
      tax = (netmoney - 500000) * 0.15 + 27500; //เงินได้สุทธิ500,001-750,000
    } else if (netmoney <= 1000000) {
      tax = (netmoney - 750000) * 0.2 + 65000; //เงินได้สุทธิ750,001-1,000,000
    } else if (netmoney <= 2000000) {
      tax = (netmoney - 1000000) * 0.25 +
          115000; //เงินได้สุทธิ1,000,001-2,000,000
    } else if (netmoney <= 5000000) {
      tax = (netmoney - 2000000) * 0.30 +
          365000; //เงินได้สุทธิ2,000,001-5,000,000
    } else {
      tax =
          (netmoney - 5000000) * 0.35 + 1265000; //เงินได้สุทธิมากกว่า5,000,000
    }

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('คำนวณภาษี',
            style: TextStyle(backgroundColor: Colors.orangeAccent)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('รายได้: $income ฿'),
            Text('โบนัส: $bonus ฿'),
            Text('รวมเงินได้ที่นำไปคำนวณภาษี: $taxableIncome ฿',
                style: const TextStyle(color: Colors.red)),
            const Text('------------------------'),
            Text('การหักค่าใช้จ่าย: $_expenseDeduction ฿'),
            Text('คงเหลือ: $balance ฿',
                style: const TextStyle(color: Colors.red)),
            const Text('------------------------'),
            Text('ลดหย่อนส่วนตัว: $_deducperson ฿'),
            Text('ลดหย่อนบุตร: $childDeduction ฿'),
            Text('ลดหย่อนบิดา - มารดา: $_fahmadeduction ฿'),
            const Text(
              'ลดหย่อนคู่สมรส: หักลดหย่อนได้คนละ 60,000฿',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('รวมค่าลดหย่อนทั้งหมด: $totaldeduction ฿',
                style: const TextStyle(color: Colors.red)),
            Text('เงินได้สุทธิ: $netmoney ฿',
                style: const TextStyle(color: Colors.blue)),
            const Text('------------------------'),
            Text('ภาษีที่ต้องชำระ: $tax ฿',
                style: const TextStyle(color: Colors.green)),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('คำนวณภาษี'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _incomeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'เงินเดือน',
              ),
            ),
            TextFormField(
              controller: bonusController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'โบนัส',
              ),
            ),
            TextField(
              controller: numberOfChildrenController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'ค่าลดหย่อนบุตร',
              ),
            ),
            TextField(
              controller: numberOffahmaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'ค่าลดหย่อนบิดา - มารดา',
              ),
            ),
            Column(
              children: [
                CheckboxListTile(
                  title: const Text(
                    'ยื่นสมรสคู่',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value!;
                      //_calculateTax();
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _calculateTax();
                numberOffahma = int.parse(numberOffahmaController.text);
                _fahmadeduction = numberOffahma * 30000;
                numberOfChildren = int.parse(numberOfChildrenController.text);
                childDeduction = numberOfChildren * 30000;
                Navigator.pushNamed(
                  context,
                  '/result',
                  arguments: childDeduction,
                );
              },
              child: const Text('คำนวณภาษี'),
            ),
            const SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
              onPressed: () {
                _reset();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}
