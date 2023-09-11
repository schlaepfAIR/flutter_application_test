import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tabs Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TabbedApp(),
    );
  }
}

class TabbedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Tabs Demo'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'My Flights'),
              Tab(text: 'Rest Time'),
              Tab(text: 'Settings'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // My Flights Tab
            Center(
              child: Text('My Flights Tab Content'),
            ),
            // Rest Time Tab
            Center(
              child: Text('Rest Time Tab Content'),
            ),
            // Settings Tab
            Center(
              child: Text('Settings Tab Content'),
            ),
          ],
        ),
      ),
    );
  }
}
