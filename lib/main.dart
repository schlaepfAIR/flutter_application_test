import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flight Info App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FlightInfoScreen(),
    );
  }
}

class FlightInfoScreen extends StatefulWidget {
  @override
  _FlightInfoScreenState createState() => _FlightInfoScreenState();
}

class _FlightInfoScreenState extends State<FlightInfoScreen> {
  final TextEditingController flightNumberController = TextEditingController();
  String flightInfo = "";

  Future<void> fetchFlightInfo(String flightNumber) async {
    final apiKey = "ae5dd420-49c7-4c0a-8512-f317e666207a";
    final url = Uri.parse(
        'https://airlabs.co/api/v9/flight?flight_iata=$flightNumber&api_key=$apiKey');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      setState(() {
        flightInfo =
            responseData.toString(); // Display the response as a string.
      });
    } else {
      setState(() {
        flightInfo = "Error: ${response.statusCode}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flight Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: flightNumberController,
              decoration: InputDecoration(
                labelText: 'Enter Flight Number (e.g., LX64)',
              ),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                final flightNumber = flightNumberController.text;
                fetchFlightInfo(flightNumber);
              },
              child: Text('Get Flight Info'),
            ),
            SizedBox(height: 20),
            Text(
              'Flight Info:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              flightInfo,
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
