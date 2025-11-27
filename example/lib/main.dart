import 'package:flutter/material.dart';
import 'package:solid_logger/solid_logger.dart';

void main() {
  runApp(const MyApp());

  // Initialize logger (basic usage)
  SolidLogger.log("App started", tag: "INFO");

  // Example log levels
  SolidLogger.log("This is a TRACE log", tag: "TRACE");
  SolidLogger.log("This is a DEBUG log", tag: "DEBUG");
  SolidLogger.log("This is an INFO log", tag: "INFO");
  SolidLogger.log("This is a WARN log", tag: "WARN");
  SolidLogger.log("This is an ERROR log", tag: "ERROR");
}

// Optional Flutter app to showcase logging with buttons
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solid Logger Example',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Solid Logger Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => SolidLogger.log("Button pressed", tag: "INFO"),
                child: const Text("Log INFO"),
              ),
              ElevatedButton(
                onPressed: () =>
                    SolidLogger.log("Warning example", tag: "WARN"),
                child: const Text("Log WARN"),
              ),
              ElevatedButton(
                onPressed: () => SolidLogger.log("Error example", tag: "ERROR"),
                child: const Text("Log ERROR"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
