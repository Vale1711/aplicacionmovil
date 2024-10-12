import 'package:flutter/material.dart';
import 'package:valeria_cocina/entities/receta_entity.dart';
import 'package:valeria_cocina/settings/db_connection.dart';

class RecetaEdit extends StatefulWidget {
  const RecetaEdit({super.key});

  @override
  State<RecetaEdit> createState() => _RecetaEditState();
}

class _RecetaEditState extends State<RecetaEdit> {
  final maquinaForm = GlobalKey<FormState>(); // Id de formulario
  final nombreController =
      TextEditingController(); //Id del TextField del nombre
  final ingredienteController = TextEditingController();
  final instruccionController = TextEditingController();
  final tiempoController = TextEditingController();
  final dificultadController = TextEditingController();
  final caloriasController = TextEditingController();
  final etiquetaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final receta = ModalRoute.of(context)?.settings.arguments as Receta;
    // Setea los valores en los campos correspondientes
    nombreController.text = receta.name;
    ingredienteController.text = receta.ingrediente;
    instruccionController.text = receta.instruccion;
    tiempoController.text = receta.tiempo;
    dificultadController.text = receta.dificultad;
    caloriasController.text = receta.calorias.toString();
    etiquetaController.text = receta.etiqueta;
    int id = receta.id as int;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'EDITAR RECETA',
          style: TextStyle(color: Color.fromARGB(255, 252, 250, 250)),
        ),
        backgroundColor: Color.fromARGB(255, 102, 52, 75),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: maquinaForm,
          child: Column(
            children: [
              TextFormField(
                controller: nombreController,
                decoration: InputDecoration(labelText: 'Nombre de la receta'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Este campo es requerido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: ingredienteController,
                decoration: InputDecoration(labelText: 'Ingredientes'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Este campo es requerido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: instruccionController,
                decoration: InputDecoration(labelText: 'Instruccion'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Este campo es requerido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: tiempoController,
                decoration: InputDecoration(labelText: 'Tiempo'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Este campo es requerido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: dificultadController,
                decoration: InputDecoration(labelText: 'Dificultad'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Este campo es requerido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: caloriasController,
                decoration: InputDecoration(labelText: 'Calorias'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Este campo es requerido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: etiquetaController,
                decoration: InputDecoration(labelText: 'Etiqueta'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Este campo es requerido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  edit(id);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color.fromARGB(255, 102, 52, 75),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  elevation: 3,
                ),
                child: Text(
                  'Actualizar Receta',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  edit(int id) async {
    if (maquinaForm.currentState!.validate()) {
      maquinaForm.currentState!.save(); // almacena el estado actual

      var data = Receta(
        id: id,
        name: nombreController.text,
        ingrediente: ingredienteController.text,
        instruccion: instruccionController.text,
        tiempo: tiempoController.text,
        dificultad: dificultadController.text,
        calorias: int.tryParse(caloriasController.text) ?? 0,
        etiqueta: etiquetaController.text,
      );

      await DbConnection.update('receta', data.toDictionary(), id);
      Navigator.of(context).pushNamed('/list');
    }
  }
}
