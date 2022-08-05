import 'dart:html';

import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  late String city;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              style: const TextStyle(color: Colors.black, fontSize: 20),
              decoration: const InputDecoration(
                hintText: "Enter City Name ",
                hintStyle: TextStyle(color: Colors.black),
                icon: Icon(Icons.location_city),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
              ),
              onChanged: (value) {
                city = value;
              },
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, city);
            },
            child: const Text(
              "Get Weather",
              style: TextStyle(fontSize: 40),
            ),
          )
        ],
      ),
    );
  }
}
