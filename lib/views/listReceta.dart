import 'package:flutter/material.dart';
import 'package:valeria_cocina/entities/receta_entity.dart';
import 'package:valeria_cocina/settings/db_connection.dart';

class ListRecetas extends StatelessWidget {
  const ListRecetas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'LISTA DE RECETAS',
          style: TextStyle(color: Color.fromARGB(255, 249, 247, 247)),
        ),
        backgroundColor: Color.fromARGB(255, 102, 52, 75),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              // Agregar lógica para refrescar la lista de profesores
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Receta>>(
        future: Receta.select(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else {
            List<Receta> data = snapshot.data as List<Receta>;
            return ListView.separated(
              itemCount: data.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, i) {
                return ListTile(
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nombre: ${data[i].name}'),
                      Text('Ingrediente: ${data[i].ingrediente}'),
                      Text('Instruccion: ${data[i].instruccion}'),
                      Text('Tiempo: ${data[i].tiempo}'),
                      Text('Dificultad: ${data[i].dificultad}'),
                      Text('Calorias: ${data[i].calorias}'),
                      Text('Etiqueta: ${data[i].etiqueta}'),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.blue),
                        onPressed: () {
                          Navigator.pushNamed(context, '/receta/edit',
                              arguments: data[i]);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Text('Eliminar Registro'),
                            content: Text(
                                '¿Estás seguro que quieres eliminar la receta ${data[i].name}?'),
                            actions: [
                              TextButton(
                                onPressed: () async {
                                  await DbConnection.delete(
                                      'receta', data[i].id as int);
                                  Navigator.pushNamed(context, '/list');
                                },
                                child: Text('Aceptar'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context, 'Cancel');
                                },
                                child: Text('Cancelar'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/receta/create');
        },
        child: Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 102, 52, 75),
      ),
    );
  }
}
