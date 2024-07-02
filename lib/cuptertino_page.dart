import "package:flutter/cupertino.dart";

class CurrencyConverterCupertinoPage extends StatefulWidget {
  const CurrencyConverterCupertinoPage({super.key});
  @override
  State<CurrencyConverterCupertinoPage> createState() => _CuptertinoPageState();
}

class _CuptertinoPageState extends State<CurrencyConverterCupertinoPage> {
  final TextEditingController textEditingController = TextEditingController();
  double result = 0;
  void convertToInr(double input) {
    result = input * 81;
  }

  @override
  Widget build(BuildContext context) {
    //creating a varibale for border
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.activeBlue,
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.black,
        middle: Text(
          "Currency Converterrrr",
          style: TextStyle(
              color: CupertinoColors.white,
              fontWeight: FontWeight.w700,
              letterSpacing: 3),
        ),
      ),
      child: Center(
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
                child: CupertinoTextField(
                  controller: textEditingController,
                  keyboardType: const TextInputType.numberWithOptions(
                      decimal: true, signed: false),
                  style: const TextStyle(color: CupertinoColors.black),
                  showCursor: true,
                  autofocus: false,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(5),
                    color: CupertinoColors.white,
                  ),
                  placeholder: "Enter amount in USD",
                  prefix: const Icon(CupertinoIcons.money_dollar),
                )),
            Padding(
              padding: const EdgeInsets.all(10),
              child: CupertinoButton(
                onPressed: () {
                  setState(() {
                    convertToInr(double.parse(textEditingController.text));
                  });
                },
                color: CupertinoColors.black,
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
