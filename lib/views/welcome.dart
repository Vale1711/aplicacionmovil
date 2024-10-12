import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'RECETAS',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 102, 52, 75),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Text(
                'Bienvenido a JVCocina',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 1, 15, 27),
                ),
              ),
              SizedBox(height: 20),
              Image.asset(
                'assets/receta.png', // Cambia esto por la ruta de tu imagen
                height: 200,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/home');
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  child: Text(
                    'Ingresar',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color.fromARGB(255, 249, 247, 247),
                  backgroundColor: Color.fromARGB(255, 135, 27, 95),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
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
