import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatefulWidget {
  CurrencyConverterMaterialPage({super.key}) {
    print("constructor");
  }
  @override
  State createState() => _CurrencyConverterMaterialPageState();
}

class _CurrencyConverterMaterialPageState
    extends State<CurrencyConverterMaterialPage> {
  @override
  Widget build(BuildContext context) {
    print("create state");
    // BuildContext tells the location of the widget in widget tree
    final TextEditingController textEditingController = TextEditingController();
    double result = 0;
    void convertToInr(double input) {
      result = input * 81;
    }

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
          "Currency Converter",
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
              result.toString(),
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
                  convertToInr(double.parse(textEditingController.text));
                  build(context);
                  print("hehe");
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
