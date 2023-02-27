import 'package:flutter/material.dart';
import 'package:number_to_words_chinese/number_to_words_chinese.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NumberToWordsChinese Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'NumberToWordsChinese Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController controller = TextEditingController();

  String convertedString = '';

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            const Text(
              'Please enter number here',
              textAlign: TextAlign.center,
            ),
            TextField(
              controller: controller,
              keyboardType: const TextInputType.numberWithOptions(
                signed: true,
                decimal: true,
              ),
              onEditingComplete: convertNumberToWords,
              onSubmitted: (_) => convertNumberToWords,
            ),
            ElevatedButton(
              onPressed: convertNumberToWords,
              child: const Text('Convert'),
            ),
            const Text(
              'Result:',
              textAlign: TextAlign.center,
            ),
            Text(
              convertedString,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void convertNumberToWords() {
    final String text = controller.text;
    final num? number = num.tryParse(text);
    if (number != null) {
      setState(() {
        convertedString = NumberToWordsChinese.convert(number);
      });
    }
  }
}
