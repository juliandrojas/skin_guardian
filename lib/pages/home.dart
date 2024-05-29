import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:skin_guardian/pages/definition.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Uint8List? imageBytes;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFADD8E6), // Azul claro,
        leading: const SizedBox.shrink(), // Oculta la flecha de retroceso
      ),
      body: Container(
        color: Colors
            .white, // Este color se aplica a todo el cuerpo de la pantalla.
        child: LayoutBuilder(
          builder: (context, constraints) {
            double imageWidth = constraints.maxWidth / 3;
            //double textWidth = constraints.maxWidth - imageWidth;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.white,
                  child: Row(
                    children: [
                      Container(
                        width: imageWidth,
                        child: const ImageWidget(
                          imageUrl:
                              'https://drive.google.com/uc?export=download&id=1BBmr4J68Z2UQsxwBI7Zhr-lei9BOCjmk',
                        ),
                      ),
                      const Expanded(
                        child: TextWidget(
                          title: '"Cuidado sin presión"',
                          subtitle:
                              'Aplicativo de aprendizaje para la prevención de lesiones por presión',
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  // Utiliza Expanded para ocupar el espacio restante.
                  child: Container(
                    color:
                        Colors.blue, // Fondo azul para toda la sección debajo.
                    child: Stack(
                      children: [
                        Container(
                          color: const Color(0xFFADD8E6) // Azul claro
                          ,
                        ),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                "Bienvenidos",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.0,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.0),
                                child: Text(
                                  "En los siguientes módulos encontrarás información para prevenir las lesiones de piel por presión (LPP).",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  print("Navegando a definition");
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Definition()),
                                  );
                                },
                                child: const Text(
                                    '¿QUÉ ES UNA LESIÓN POR PRESIÓN (LPP)?'),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  final String imageUrl;

  const ImageWidget({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
    );
  }
}

class TextWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  const TextWidget({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const Divider(),
        const SizedBox(height: 8.0),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 16.0,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
