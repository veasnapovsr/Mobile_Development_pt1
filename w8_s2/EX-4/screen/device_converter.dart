import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DeviceConverter extends StatefulWidget {
  const DeviceConverter({super.key});

  @override
  State<DeviceConverter> createState() => _DeviceConverterState();
}

class _DeviceConverterState extends State<DeviceConverter> {
  Map<String,double> allCurrency ={
    'Euro':0.93,
    'RIEL':4100,
    'DOLLAR':1,
    'DONG':25405.00
  };
  String getCurrency = 'DOLLAR';
  final _converterController = TextEditingController();
  final BoxDecoration textDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  );

  double? get dollar => double.tryParse(_converterController.text);
  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose(){
    _converterController.dispose();
    super.dispose();
  }

  String convert(){
    if(dollar == null || dollar == 0){
      return 'No amount input';
    }
    String result;
    if(allCurrency.containsKey(getCurrency)){
      result = (dollar! * allCurrency[getCurrency]!).toStringAsFixed(2);
    } else {
      result = dollar!.toString();
    }

    return result;
  }

  void onGetDevice(String? currency){
    setState(() {
      getCurrency = currency!;
    });


  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(
                Icons.money,
                size: 60,
                color: Colors.white,
              ),
              const Center(
                child: Text(
                  "Converter",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
              const SizedBox(height: 50),
              const Text("Amount in dollars:"),
              const SizedBox(height: 10),

              TextField(
                  controller: _converterController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                      prefix: const Text('\$ '),

                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: Colors.white, width: 1.0),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Enter an amount in dollar',
                      hintStyle: const TextStyle(color: Colors.white)),
                  style: const TextStyle(color: Colors.white)),

              const SizedBox(height: 30),
              Text("Device: $getCurrency"),

              const Text('Choose the Currency'),
              DropdownButton(
                  value: getCurrency,
                  items: allCurrency.keys.map((currency){
                    return DropdownMenuItem(
                      value: currency,
                      child: Text(currency),
                    );
                  }).toList(),
                  onChanged: onGetDevice),


              const SizedBox(height: 30),
              const Text("Amount in selected device:"),
              const SizedBox(height: 10),
              Container(
                  padding: const EdgeInsets.all(10),
                  decoration: textDecoration,
                  child:  Text(convert()))
            ],
          )),
    );
  }
}
