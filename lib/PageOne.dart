import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Pageone extends StatefulWidget {
  const Pageone({Key? key}) : super(key: key);

  @override
  State<Pageone> createState() => _PageoneState();
}

class _PageoneState extends State<Pageone> {
  DateTime _dateTime = DateTime.now();

  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2025))
        .then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              _dateTime.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            MaterialButton(
              onPressed: _showDatePicker,
              child: Text(
                "Choose date",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              color: Colors.blue,
              padding: EdgeInsets.all(20),
            ),
          ],
        ),
      ),
    );
  }
}
