import 'package:flutter/material.dart';
import 'acceleration.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Enjoy Acceleration',
      theme: ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.red,
        ).copyWith(
          secondary: Colors.greenAccent,
        ),
        primaryColor: Colors.red,
        accentColor: Colors.greenAccent,
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.purple),
          headline2: TextStyle(
            fontSize: 18,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
        ).copyWith(
          secondary: Colors.yellowAccent,
        ),
        primaryColor: Colors.green,
        accentColor: Colors.yellowAccent,
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.purple),
          headline2: TextStyle(
            fontSize: 18,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      home: const TopPage(title: 'Acceleration Viewer'),
    );
  }
}

class TopPage extends StatelessWidget {
  const TopPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              const Text('Go to sensors'),
              FloatingActionButton(
                onPressed: () => _goToNext(context),
                tooltip: 'Increment',
                child: const Icon(Icons.show_chart),
              ),
            ],
          ),
        )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _goToNext(context) {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => AccelerationPage()
    ));
  }
}
