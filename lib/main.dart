import "package:flutter/material.dart";
import "package:valeria_cocina/views/home.dart";
import "package:valeria_cocina/views/listReceta.dart";
import "package:valeria_cocina/views/receta/edit.dart";
import "package:valeria_cocina/views/receta/new.dart";
import "package:valeria_cocina/views/welcome.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/welcome',
      routes: {
        '/home': (context) => Home(),
        '/welcome': (context) => Welcome(),
        '/list': (context) => ListRecetas(),
        '/receta/create': (context) => RecetaCreate(),
        '/receta/edit': (context) => RecetaEdit(),
      },
    );
  }
}
