import 'package:flutter/material.dart';

void main() {
  runApp(const MyBusinessCard());
}

class MyBusinessCard extends StatelessWidget {
  const MyBusinessCard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My Digital Card'),
          backgroundColor: Colors.blueGrey[400],
          centerTitle: true,
        ),
        backgroundColor: Colors.blueGrey[800],
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 85.0,
                backgroundImage: AssetImage('assets/images/personal.jpg'),
              ),
              SizedBox(height: 75),
              const Text(
                'RANA HASSAN Al- YAMY',
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 28.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Specialization: Information Systems',
                style: TextStyle(
                  color: Colors.indigo.shade100,
                  fontSize: 18.0,

                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(color: Colors.indigo.shade100),
              ),

              Card(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 25.0,
                ),
                child: ListTile(
                  leading: const Icon(Icons.phone, color: Colors.indigo),
                  title: Text(
                    '+966 500 000 000',
                    style: TextStyle(
                      color: Colors.indigo.shade900,
                      fontSize: 18.0,
                    ),
                  ),
                  trailing: const Icon(Icons.call, color: Colors.indigo),
                ),
              ),

              Card(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 25.0,
                ),
                child: ListTile(
                  leading: const Icon(Icons.email, color: Colors.indigo),
                  title: Text(
                    'abcd@nu.edu.sa',
                    style: TextStyle(
                      color: Colors.indigo.shade900,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),

              Card(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 25.0,
                ),
                child: ListTile(
                  leading: const Icon(Icons.school, color: Colors.indigo),
                  title: Text(
                    'Najran University - جامعة نجران',
                    style: TextStyle(
                      color: Colors.indigo.shade900,
                      fontSize: 18.0,
                    ),
                  ),
                  subtitle: Text(
                    'ID: 442408485',
                    style: TextStyle(
                      color: Colors.indigo.shade700,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
