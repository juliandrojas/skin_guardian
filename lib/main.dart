import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:skin_guardian/pages/definition.dart'; // Asegúrate de importar Definition
// Importa tus páginas aquí
import 'package:skin_guardian/pages/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Future<bool> _checkInternetConnection() async {
    try {
      final response = await http.get(Uri.parse('https://www.google.com'));
      return response.statusCode == 200;
    } catch (_) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      // Define tus rutas aquí
      routes: {
        '/': (context) => FutureBuilder<bool>(
              future: _checkInternetConnection(),
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Scaffold(
                    backgroundColor: Colors.white,
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (snapshot.hasData && snapshot.data!) {
                  return const Home();
                } else {
                  return const NotConnection();
                }
              },
            ),
        '/definition': (context) => const Definition(), // Ruta para Definition
      },
    );
  }
}

class NotConnection extends StatelessWidget {
  const NotConnection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "NO HAY CONEXIÓN",
              style: TextStyle(
                color: Colors.red,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
