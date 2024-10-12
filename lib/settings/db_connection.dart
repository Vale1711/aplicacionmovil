import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbConnection {
  static const version = 1; //version de coneion por default va 1 siempre
  static const dbName = 'receta_cocina.db';
  //nombre de la base de datos sqlite

//metodo de coneion
  static Future<Database> getConnection() async {
    //declarar una funcion asincrona llamada getConeccion()
    return openDatabase(join(await getDatabasesPath(), dbName),
        onCreate: (db, version) async => {
              //evento para crear la base de datos
              //primer parametro es un alias que se designa a la base de datos
              //segundo parametro hace referencia a la version que esta en la linea 6
              // en esta funcion se crean tablas o datos iniciales
              await db.execute(
                  "CREATE TABLE receta (id INTEGER PRIMARY KEY, name TEXT, ingrediente TEXT, instruccion TEXT, tiempo TEXT, dificultad TEXT, calorias int, etiqueta TEXT)"),

              //creacion de tabla estudiante con lenguaje sql con el metodo execute
              await db.execute(
                  "INSERT INTO receta VALUES (1, 'Cheescake', 'Queso Crema', 'Mezclar todo', '30 minutos', 'Ninguna', 234, 'Postres' )"),

              //creacion de un registro en la tabla estudiante
            },
        version: version); //abir la conexion
  } //devuelve el tipo de dato llamado Database

  static Future<int> insert(String table, dynamic data) async {
    //creacion del metodo insert
    //primer parametro nombre de la tabla
    //segundo parametro hace referencia a la data
    final db = await getConnection();
    return db.insert(table, data,
        conflictAlgorithm:
            ConflictAlgorithm.replace); //llamado con la funcion insert
    //paso a los parametros de tabla y de data
  }

  static Future<int> update(String table, dynamic data, int id) async {
    final db = await getConnection();
    return db.update(table, data,
        where: 'id=?', whereArgs: [id]); //llamado con la funcion insert
  }

  static Future<int> delete(String table, int id) async {
    //primer parametro es el nombre de la tabla
    //El segundo parametro es el id del registro
    final db = await getConnection(); //llamando a la funcion conexion
    return db.delete(table,
        where: 'id =?',
        whereArgs: [id] //llamado a la variable id que viene por parametro
        );
  }

  static Future<List<Map<String, dynamic>>> list(String table) async {
    //funcion para listar datos de una tabla
    //primer parametro es nombre de la tabla
    //retorna una lista de diccionarios
    final db = await getConnection();
    return db.query(table); //llamando a la funcion de select
  }

  static Future<List<Map<String, dynamic>>> detail(
      String table, String where, dynamic args) async {
    //funcion para listar datos de una tabla
    //primer parametro es nombre de la tabla
    //segundo parametro es el filtro where
    //tercer parametro son los valores del argunento
    //retorna una lista de diccionarios
    final db = await getConnection();
    return db.query(table, where: where, whereArgs: args);
    //llamando a la funcion de select  filtrado por where
  }
}
