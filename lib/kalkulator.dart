import 'package:flutter/material.dart';

class Kalkulator extends StatefulWidget {
  const Kalkulator({super.key});

  @override
  State<Kalkulator> createState() => _KalkulatorState();
}

class _KalkulatorState extends State<Kalkulator> {
  int number = 0;
  String cals = '0';
  String cals2 = '';
  int adds = 0;
  int hitung1 = 0;
  int hitung2 = 0;
  String operator_mat = '';

  void hitung_cal(int v) {
    setState(() {
      if (cals != '0') {
        cals = '$cals$v';
      } else {
        cals = '$v';
      }

      if (operator_mat.isNotEmpty) {
        cals2 = '$cals2$v';
        hitung2 = int.parse(cals2);
      } else {
        hitung1 = int.parse(cals);
      }
    });
  }

  void tambah_cal() {
    if (operator_mat.isEmpty) {
      operator_mat = '+';
      cals2 = '';
      setState(() {
        cals = '$cals+';
      });
    }
  }

  void kurang_cal() {
    if (operator_mat.isEmpty) {
      operator_mat = '-';
      cals2 = '';
      setState(() {
        cals = '$cals-';
      });
    }
  }

  void kali_cal() {
    if (operator_mat.isEmpty) {
      operator_mat = '*';
      cals2 = '';
      setState(() {
        cals = '$cals*';
      });
    }
  }

  void bagi_cal() {
    if (operator_mat.isEmpty) {
      operator_mat = '/';
      cals2 = '';
      setState(() {
        cals = '$cals/';
      });
    }
  }

  void hasil_cal() {
    setState(() {
      switch (operator_mat) {
        case '+':
          hitung1 = hitung1 + hitung2;
          break;
        case '-':
          hitung1 = hitung1 - hitung2;
          break;
        case '*':
          hitung1 = hitung1 * hitung2;
          break;
        case '/':
          if (hitung2 != 0) {
            hitung1 = hitung1 ~/ hitung2;
          } else {
            hitung1 = 0;
          }
          break;
        default:
          break;
      }
      cals = '$hitung1';
      operator_mat = '';
      cals2 = '';
      hitung2 = 0;
    });
  }

  void clear_cal() {
    setState(() {
      cals = '0';
      cals2 = '';
      hitung1 = 0;
      hitung2 = 0;
      operator_mat = '';
    });
  }

  Widget buildButton(String text, {Color color = Colors.blue}) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: () {
          switch (text) {
            case 'C':
              clear_cal();
              break;
            case '+':
              tambah_cal();
              break;
            case '-':
              kurang_cal();
              break;
            case 'x':
              kali_cal();
              break;
            case '/':
              bagi_cal();
              break;
            case '=':
              hasil_cal();
              break;
            default:
              hitung_cal(int.parse(text));
              break;
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          minimumSize: const Size(60, 60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          elevation: 5,
          textStyle: const TextStyle(fontSize: 20),
        ),
        child: Text(text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: clear_cal,
        tooltip: 'Clear',
        backgroundColor: Colors.red,
        child: const Text('C'),
      ),
      appBar: AppBar(
        title: const Text('Kalkulator'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.centerRight,
            child: Text(
              cals,
              style: const TextStyle(
                fontSize: 44,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildButton('1'),
                  buildButton('2'),
                  buildButton('3'),
                  buildButton('+', color: Colors.orange),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildButton('4'),
                  buildButton('5'),
                  buildButton('6'),
                  buildButton('-', color: Colors.orange),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildButton('7'),
                  buildButton('8'),
                  buildButton('9'),
                  buildButton('x', color: Colors.orange),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildButton('C', color: Colors.red),
                  buildButton('0'),
                  buildButton('=', color: Colors.green),
                  buildButton('/', color: Colors.orange),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
