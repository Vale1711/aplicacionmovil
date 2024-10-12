import 'package:valeria_cocina/settings/db_connection.dart';

class Receta {
  //atributos debe ser igual a los de la base de datos
  int? id;
  String name;
  String ingrediente;
  String instruccion;
  String tiempo;
  String dificultad;
  int calorias;
  String etiqueta;

  Receta(
      { //crear un constructor
      this.id, // parametro id opcional
      required this.name, //parametro name es requerido
      required this.ingrediente,
      required this.instruccion,
      required this.tiempo,
      required this.dificultad, //parametro lasName es requerido
      required this.calorias,
      required this.etiqueta});

//crear funcion para parse de diccionario a la clase (Student)
// esto se utilizar al momento de seleccionar los datos
//acpeta como parametro el tipo de datos de diccionario(Map)
  factory Receta.fromDictionary(Map<String, dynamic> data) => Receta(
      id: data['id'], //extraer id de data
      name: data['name'], //entraer nombre de data
      ingrediente: data['ingrediente'], //extraer last_name de data
      instruccion: data['instruccion'],
      tiempo: data['tiempo'],
      dificultad: data['dificultad'],
      calorias: data['calorias'],
      etiqueta: data['etiqueta']);
//crear funcion para parse  de clase a diccionario
//esto se utiliza de registrar datos(insert, update)
//no acepta nada como argumento
  Map<String, dynamic> toDictionary() => {
        'id': id, //asignar el valor id al diccionario
        'name': name, //asignar el valor name  al diccionario
        'ingrediente': ingrediente, //asignar el valor lastName al diccionario
        'instruccion': instruccion,
        'tiempo': tiempo,
        'dificultad': dificultad,
        'calorias': calorias,
        'etiqueta': etiqueta
      };
  static Future<List<Receta>> select() async {
    var data = await DbConnection.list("receta");
    if (data.isEmpty) {
      return List.empty();
    } else {
      return List.generate(
          data.length, (index) => Receta.fromDictionary(data[index]));
    }
  }
}
