import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/color_constants.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String aboutText =
      '''Welcome to the Egg Incubator Tracker mobile app! This app is designed to help poultry enthusiasts and breeders keep track of the number of days eggs are in the incubator, monitor the owners of the eggs (which can change over time), and provide detailed reporting on hatch rates for different months. It supports various types of poultry, including chickens, quails, guinea fowls, and ducks.''';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('About Eggy'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 25.0, horizontal: 25.0),
                child: Text(
                  aboutText,
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
