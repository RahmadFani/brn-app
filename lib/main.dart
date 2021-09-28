import 'package:brn/presentation/app_widget.dart';
import 'package:brn/presentation/screens/nfc/providers/nfc_provider.dart';
import 'package:brn/presentation/screens/peta_induk/providers/peta_induk.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: avoid_void_async
void main() async {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => NFCProvider()),
      ChangeNotifierProvider(create: (_) => PetaIndukProvider()),
    ],
    child: AppWidget(),
  ));
}
