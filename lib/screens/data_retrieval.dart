import 'package:sharedpref_app/service/shared_pref_service.dart';
import 'package:flutter/material.dart';

class DataRetrieval extends StatefulWidget {
  const DataRetrieval({super.key});

  @override
  State<DataRetrieval> createState() => _DataRetrievalState();
}

class _DataRetrievalState extends State<DataRetrieval> {
  final SharedPrefsService _prefsService = SharedPrefsService();
  Map<String, String?> userData = {};

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() async {
    Map<String, String?> data = await _prefsService.loadUserData();
    setState(() {
      userData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User Card',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              letterSpacing: 1),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: userData.isNotEmpty
                  ? Column(
                      children: [
                        Text('Name: ${userData['name'] ?? ''}'),
                        Text('Username: ${userData['username'] ?? ''}'),
                        Text('Age: ${userData['age'] ?? ''}'),
                        Text('Designation: ${userData['designation'] ?? ''}'),
                        Text('Company: ${userData['company'] ?? ''}'),
                      ],
                    )
                  : const Center(child: CircularProgressIndicator()),
            ),
            ElevatedButton(onPressed: () {}, child: const Text('Clear'))
          ],
        ),
      ),
    );
  }
}
