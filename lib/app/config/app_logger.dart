import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class SimpleLogPrinter extends LogPrinter {
  final String className;
  final bool printCallingFunctionName;
  final bool printCallStack;
  final List<String> exludeLogsFromClasses;
  final String? showOnlyClass;

  SimpleLogPrinter(
    this.className, {
    this.printCallingFunctionName = true,
    this.printCallStack = false,
    this.exludeLogsFromClasses = const [],
    this.showOnlyClass,
  });

  @override
  List<String> log(LogEvent event) {
    AnsiColor? color = PrettyPrinter.levelColors[event.level];

    String? emoji = PrettyPrinter.levelEmojis[event.level];
    String? methodName = _getMethodName();

    String methodNameSection =
        printCallingFunctionName && methodName != null ? ' | $methodName' : '';
    String stackLog = event.stackTrace.toString();
    String output =
        '$emoji $className$methodNameSection ${DateTime.now().toLocal().toIso8601String()}  - ${event.message}${event.error != null ? '\nERROR: ${event.error}\n' : ''}${printCallStack ? '\nSTACKTRACE:\n$stackLog' : ''}';

    if (exludeLogsFromClasses
            .any((excludeClass) => className == excludeClass) ||
        (showOnlyClass != null && className != showOnlyClass)) return [];

    final pattern = RegExp('.{1,800}');
    List<String> result = [];

    for (var line in output.split('\n')) {
      result.addAll(pattern.allMatches(line).map((match) {
        if (kReleaseMode) {
          return match.group(0)!;
        } else {
          return color!(match.group(0)!);
        }
      }));
    }

    return result;
  }

  String? _getMethodName() {
    try {
      final currentStack = StackTrace.current;
      final formattedStacktrace = _formatStackTrace(currentStack, 3);
      if (kIsWeb) {
        final classNameParts = _splitClassNameWords(className);
        return _findMostMatchedTrace(formattedStacktrace!, classNameParts)
            .split(' ')
            .last;
      } else {
        final realFirstLine = formattedStacktrace
            ?.firstWhere((line) => line.contains(className), orElse: () => "");

        final methodName = realFirstLine?.replaceAll('$className.', '');
        return methodName;
      }
    } catch (e) {
      return null;
    }
  }

  List<String> _splitClassNameWords(String className) {
    return className
        .split(RegExp(r'(?=[A-Z])'))
        .map((e) => e.toLowerCase())
        .toList();
  }

  String _findMostMatchedTrace(
      List<String> stackTraces, List<String> keyWords) {
    String match = stackTraces.firstWhere(
        (trace) => _doesTraceContainsAllKeywords(trace, keyWords),
        orElse: () => '');
    if (match.isEmpty) {
      match = _findMostMatchedTrace(
          stackTraces, keyWords.sublist(0, keyWords.length - 1));
    }
    return match;
  }

  bool _doesTraceContainsAllKeywords(String stackTrace, List<String> keywords) {
    final formattedKeywordsAsRegex = RegExp(keywords.join('.*'));
    return stackTrace.contains(formattedKeywordsAsRegex);
  }
}

final stackTraceRegex = RegExp(r'#[0-9]+[\s]+(.+) \(([^\s]+)\)');

List<String>? _formatStackTrace(StackTrace stackTrace, int methodCount) {
  var lines = stackTrace.toString().split('\n');

  var formatted = <String>[];
  var count = 0;
  for (var line in lines) {
    var match = stackTraceRegex.matchAsPrefix(line);
    if (match != null) {
      if (match.group(2)!.startsWith('package:logger')) {
        continue;
      }
      var newLine = ("${match.group(1)}");
      formatted.add(newLine.replaceAll('<anonymous closure>', '()'));
      if (++count == methodCount) {
        break;
      }
    } else {
      formatted.add(line);
    }
  }

  if (formatted.isEmpty) {
    return null;
  } else {
    return formatted;
  }
}

Logger getLogger(String className,
    {bool printCallingFunctionName = true,
    bool printCallstack = false,
    List<String> exludeLogsFromClasses = const [],
    String? showOnlyClass}) {
  return Logger(
    printer: SimpleLogPrinter(
      className,
      printCallingFunctionName: printCallingFunctionName,
      printCallStack: printCallstack,
      showOnlyClass: showOnlyClass,
      exludeLogsFromClasses: exludeLogsFromClasses,
    ),
    output: MultiOutput([
      if (!kReleaseMode) ConsoleOutput(),
    ]),
  );
}
