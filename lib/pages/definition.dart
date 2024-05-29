import 'dart:typed_data';

import 'package:flutter/material.dart';

class Definition extends StatefulWidget {
  const Definition({Key? key}) : super(key: key);

  @override
  State<Definition> createState() => _DefinitionState();
}

class _DefinitionState extends State<Definition> {
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
        leading: const SizedBox.shrink(),
      ),
      body: Container(
        color: Colors.white, // Fondo blanco para toda la pantalla.
        child: Padding(
          padding:
              const EdgeInsets.all(16.0), // Espacio alrededor del contenido.
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextWidget(
                title: '¿QUÉ ES UNA LESIÓN POR PRESIÓN?',
              ),
              const Text(
                "Daño en la piel o tejido profundo (músculo, hueso), debido a la falta de circulación sanguínea que se produce por presión o roces constantes en una zona específica del cuerpo, cuando una persona no se mueve o no se cambia de posición frecuentemente.",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black, // Texto en negro sobre el fondo blanco.
                ),
              ),
              const SizedBox(
                  height: 20), // Espacio entre el texto y las imágenes.
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ImageWidget(
                      imageUrl:
                          'https://drive.google.com/uc?export=download&id=1BBmr4J68Z2UQsxwBI7Zhr-lei9BOCjmk'),
                  ImageWidget(
                      imageUrl:
                          'https://drive.google.com/uc?export=download&id=1BBmr4J68Z2UQsxwBI7Zhr-lei9BOCjmk'),
                  //ImageWidget(imageUrl: "https://example.com/image1.jpg"), // Reemplaza con tus URLs de imagen.
                  //ImageWidget(imageUrl: "https://example.com/image2.jpg"), // Reemplaza con tus URLs de imagen.
                ],
              ),
              const SizedBox(
                  height: 20), // Espacio entre las imágenes y los botones.
              Column(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          print("Botón presionado");
                        },
                        child: const Text("Hola Mundo")),
                  ),
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          print("Botón presionado");
                        },
                        child: Text("Hola Mundo")),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  final String imageUrl;

  const ImageWidget({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      width: 150, // Ancho fijo para las imágenes.
      height: 200, // Alto fijo para las imágenes.
      fit: BoxFit.cover,
    );
  }
}

class TextWidget extends StatelessWidget {
  final String title;

  const TextWidget({super.key, required this.title});

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
      ],
    );
  }
}
