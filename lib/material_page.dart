import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});
  @override
  State createState() => _CurrencyConverterMaterialPageState();
}

class _CurrencyConverterMaterialPageState
    extends State<CurrencyConverterMaterialPage> {
  final TextEditingController textEditingController = TextEditingController();
  double result = 0;
  void convertToInr(double input) {
    result = input * 81;
    print("result changed");
  }

  @override
  Widget build(BuildContext context) {
    //creating a varibale for border
    const border = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(
            color: Colors.black45,
            width: 2,
            strokeAlign: BorderSide.strokeAlignInside));
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          "Currency Converterrrr",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              letterSpacing: 3),
        ),
        titleTextStyle: const TextStyle(
          fontSize: 30,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "INR ${result.toStringAsFixed(2)}",
              style: const TextStyle(
                fontSize: 33,
                letterSpacing: 2,
                /*  */
                fontWeight: FontWeight.w700,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: textEditingController,
                keyboardType: const TextInputType.numberWithOptions(
                    decimal: true, signed: false),
                style: const TextStyle(color: Colors.black),
                showCursor: true,
                autofocus: false,
                decoration: const InputDecoration(
                  hintText: "Amount likh rey USD me",
                  prefixIcon: Icon(Icons.monetization_on_outlined),
                  hintStyle: TextStyle(
                      color: Colors.black38, fontWeight: FontWeight.w400),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: border,
                  focusedBorder: border,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    convertToInr(double.parse(textEditingController.text));
                  });
                },
                style: const ButtonStyle(
                  elevation: WidgetStatePropertyAll(5),
                  backgroundColor: WidgetStatePropertyAll(Colors.black),
                  foregroundColor: WidgetStatePropertyAll(Colors.white),
                  minimumSize: WidgetStatePropertyAll(
                    Size(double.infinity, 50),
                  ),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                  ),
                ),
                child: const Text(
                  "Convert",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
