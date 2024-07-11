import 'package:flutter/material.dart';
import 'dart:async'; // Tambahkan ini

class StopwatchApp extends StatefulWidget {
  const StopwatchApp({super.key});

  @override
  _StopwatchAppState createState() => _StopwatchAppState();
}

class _StopwatchAppState extends State<StopwatchApp> {
  final Stopwatch _stopwatch = Stopwatch();
  final Duration _refreshRate = const Duration(milliseconds: 30);

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    Timer(_refreshRate, _keepRunning);
  }

  void _keepRunning() {
    if (_stopwatch.isRunning) {
      setState(() {});
      _startTimer();
    }
  }

  void _startStopwatch() {
    setState(() {
      _stopwatch.start();
      _startTimer();
    });
  }

  void _stopStopwatch() {
    setState(() {
      _stopwatch.stop();
    });
  }

  void _resetStopwatch() {
    setState(() {
      _stopwatch.reset();
    });
  }

  String _formattedTime() {
    var milliseconds = _stopwatch.elapsedMilliseconds;
    var hundredths = (milliseconds / 10).truncate() % 100;
    var seconds = (milliseconds / 1000).truncate() % 60;
    var minutes = (milliseconds / (1000 * 60)).truncate();

    return '$minutes:${seconds.toString().padLeft(2, '0')}:${hundredths.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stopwatch'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _formattedTime(),
              style: const TextStyle(fontSize: 48.0),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _stopwatch.isRunning ? null : _startStopwatch,
                  child: const Text('Start'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _stopwatch.isRunning ? _stopStopwatch : null,
                  child: const Text('Stop'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _stopwatch.isRunning || _stopwatch.elapsedMilliseconds == 0
                      ? null
                      : _resetStopwatch,
                  child: const Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
