import 'package:sharedpref_app/screens/data_input.dart';
import 'package:sharedpref_app/screens/data_retrieval.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Shared Preferences Mini App',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                letterSpacing: 1),
          ),
          // leading: IconButton(
          //   icon: Icon(Icons.arrow_back_ios),
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          // ),
          backgroundColor: Colors.deepOrange,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DataInput()));
                  },
                  child: const Text('Save New Record')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DataRetrieval()));
                  },
                  child: const Text('Last Record')),
              ElevatedButton(
                  onPressed: () {}, child: const Text('Clear Record'))
            ]),
          ),
        ));
  }
}
