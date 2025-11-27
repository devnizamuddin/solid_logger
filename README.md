# solid_logger

[![pub package](https://img.shields.io/pub/v/solid_logger.svg?logo=dart&logoColor=00b9fc)](https://pub.dev/packages/solid_logger)

[![Last Commits](https://img.shields.io/github/last-commit/devnizamuddin/solid_logger?logo=git&logoColor=white)](https://github.com/devnizamuddin/solid_logger/commits/main)

[![Code size](https://img.shields.io/github/languages/code-size/devnizamuddin/solid_logger?logo=github&logoColor=white)](https://github.com/devnizamuddin/solid_logger)

[![License](https://img.shields.io/github/license/devnizamuddin/solid_logger?logo=open-source-initiative&logoColor=green)](https://github.com/devnizamuddin/solid_logger/blob/main/LICENSE)

A professional, lightweight, and extensible logging library for Flutter and Dart that prints structured, readable logs.

**Show some ❤️ and star the repo to support the project**

### Resources:

- [Documentation](https://pub.dev/documentation/solid_logger/latest/solid_logger/solid_logger-library.html)
- [Pub Package](https://pub.dev/packages/solid_logger)
- [GitHub Repository](https://github.com/devnizamuddin/solid_logger)

---

## Getting Started

Simply import the package and start logging:

```dart
import 'package:solid_logger/solid_logger.dart';

void main() {
  SolidLogger.log("solid_logger is working!");
}
```

You can also pass other objects like `List`, `Map`, or `Set` instead of just strings.

---

## Log Levels

You can log with different levels:

```dart
SolidLogger.log("Trace message", tag: "TRACE");
SolidLogger.log("Debug message", tag: "DEBUG");
SolidLogger.log("Info message", tag: "INFO");
SolidLogger.log("Warning message", tag: "WARN");
SolidLogger.log("Error message", tag: "ERROR");
```

To show only specific log levels, you can set:

```dart
SolidLogger.level = LogLevel.warning;
```

This will hide all `TRACE`, `DEBUG`, and `INFO` messages.

---

## Options

You can configure your logger with custom options:

```dart
var logger = SolidLogger(
  printer: PrettyPrinter(
    methodCount: 2,       // Show number of method calls in stack trace
    lineLength: 120,      // Max line length
    colors: true,         // Enable colored output
    printEmojis: true,    // Print emojis for log levels
    dateTimeFormat: DateTimeFormat.onlyTime,
  ),
);
```

### Auto-detecting Colors & Line Length

If you import `dart:io` as `io`, you can auto-detect:

```dart
var logger = SolidLogger(
  printer: PrettyPrinter(
    colors: io.stdout.supportsAnsiEscapes,
    lineLength: io.stdout.terminalColumns,
  ),
);
```

---

## Custom Filters

`LogFilter` decides which log events are shown.

Example:

```dart
class MyFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true; // Show all logs
  }
}
```

---

## Custom Printers

You can create your own `LogPrinter` to format log output:

```dart
class MyPrinter extends LogPrinter {
  @override
  List<String> log(LogEvent event) {
    return ["[${event.tag}] ${event.message}"];
  }
}
```

---

## Custom Outputs

`LogOutput` sends log lines to a destination. Default is `ConsoleOutput`.

```dart
class ConsoleOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    for (var line in event.lines) {
      print(line);
    }
  }
}
```

Other outputs could include `FileOutput` or sending logs to a server.

---

## Acknowledgments

Inspired by [logger](https://github.com/orhanobut/logger) for Android and maintained by [devnizamuddin](https://github.com/devnizamuddin).
