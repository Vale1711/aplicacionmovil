import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'HOME',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 102, 52, 75),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildMenuButton(
                context,
                'Recetas de Cocina',
                Icons.cookie,
                '/list',
                Color.fromARGB(255, 102, 52, 75),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenuButton(BuildContext context, String text, IconData icon,
      String route, Color color) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.of(context).pushNamed(route);
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: color,
        minimumSize: Size(double.infinity, 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.black, width: 1),
        ),
        elevation: 5,
        padding: EdgeInsets.symmetric(horizontal: 16),
      ),
      icon: Icon(icon, size: 28),
      label: Text(
        text,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
