import 'package:flutter/material.dart';
import 'package:flutter_konversi_jobsheet4/widgets/dropdown.dart';
import 'package:flutter_konversi_jobsheet4/widgets/input.dart';
import 'package:flutter_konversi_jobsheet4/widgets/konversi.dart';
import 'package:flutter_konversi_jobsheet4/widgets/result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _inputUser = 0;
  double _result = 0;

  String _selectedDropdown = "Silahkan Pilih Suhu";
  final _listSatuanSuhu = ["Silahkan Pilih Suhu", "Kelvin", "Reamur"];
  List<String> _listHasil = [];
  TextEditingController etInput = TextEditingController();

  _onChangedDropdown(String value) {
    setState(() {
      _selectedDropdown = value;
    });
    _convertHandler();
  }

  _convertHandler() {
    setState(() {
      if (etInput.text.isNotEmpty) {
        _inputUser = double.parse(etInput.text);
        switch (_selectedDropdown) {
          case "Kelvin":
            _result = _inputUser + 273;
            _listHasil.add("Konversi dari:  $_inputUser ke  $_result Kelvin");
            break;
          case "Reamur":
            _result = _inputUser * 4 / 5;
            _listHasil.add("Konversi dari:  $_inputUser ke  $_result Reamur");
            break;
          default:
            _listHasil.add("Suhu belum dipilih");
            break;
        }
      } else {
        _listHasil.add("Suhu belum dipilih dan Celcius kosong");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Konversi Suhu - 2031710060_Mustika Putri',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Konverter Suhu"),
        ),
        body: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Input(etInput: etInput),
              Dropdown(
                  selectedDropdown: _selectedDropdown,
                  listSatuanSuhu: _listSatuanSuhu,
                  onChangedDropdown: _onChangedDropdown),
              Konversi(convertHandler: _convertHandler),
              Result(listHasil: _listHasil)
            ],
          ),
        ),
      ),
    );
  }
}
