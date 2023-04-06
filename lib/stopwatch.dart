import 'dart:async';
import 'package:flutter/material.dart';

class StopwatchMenu extends StatefulWidget {
  @override
  _StopwatchMenuState createState() => _StopwatchMenuState();
}

class _StopwatchMenuState extends State<StopwatchMenu> {
  int _seconds = 0;
  int _minutes = 0;
  int _hours = 0;
  bool _isActive = false;
  Timer? _timer;

  void _startTimer() {
    setState(() {
      _isActive = true;
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          _seconds++;
          if (_seconds == 60) {
            _seconds = 0;
            _minutes++;
          }
          if (_minutes == 60) {
            _minutes = 0;
            _hours++;
          }
        });
      });
    });
  }

  void _stopTimer() {
    setState(() {
      _isActive = false;
      if (_timer != null) {
        _timer!.cancel();
        _timer = null;
      }
    });
  }

  void _resetTimer() {
    setState(() {
      _isActive = false;
      _seconds = 0;
      _minutes = 0;
      _hours = 0;
      if (_timer != null) {
        _timer!.cancel();
        _timer = null;
      }
    });
  }

  String _formatTime(int time) {
    return time < 10 ? "0$time" : "$time";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stopwatch"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${_formatTime(_hours)}:${_formatTime(_minutes)}:${_formatTime(_seconds)}",
              style: TextStyle(
                fontSize: 72.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _isActive ? null : _startTimer,
                  child: Text("Start"),
                ),
                ElevatedButton(
                  onPressed: _isActive ? _stopTimer : null,
                  child: Text("Stop"),
                ),
                ElevatedButton(
                  onPressed: _resetTimer,
                  child: Text("Reset"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
