import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/utilisateurmobileModels.dart';

Database db;
Future<void> initDatabase() async {
  var path = await getDatabasePath('request.db');
  db = await openDatabase(path, version: 1,
      onCreate: (Database db, int version) async {
    var utilisateurmobile = """CREATE TABLE `utilisateurmobile` (
                `idUtilisateurMobile` varchar(255) UNIQUE NOT NULL ,
                `nom` varchar(50) UNIQUE NOT NULL,
                `prenom` varchar(50) UNIQUE NOT NULL,
                `numTel` varchar(50) UNIQUE NOT NULL,
                `email` varchar(50) UNIQUE NOT NULL,
                `idUtilisateur` varchar(11) UNIQUE NOT NULL )""";
    await db.execute(utilisateurmobile);
  });
  getItems();
}

Future<String> getDatabasePath(String dbName) async {
  var dataPath = await getDatabasesPath();
  var path = join(dataPath, dbName);
  return path;
}

// Utilisateurmobile //
//Inserstion utilisateurmobile
Future<int> saveNewUtilisateurmobile(
    Utilisateurmobile newUtilisateurmobile) async {
  int res = await db.insert(
    "utilisateurmobile",
    newUtilisateurmobile.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
  return res;
}

//Get utilisateurmobile
Future<List> getItems() async {
  var result = await db.rawQuery("SELECT * FROM utilisateurmobile");
  return result.toList();
}

// Mise a jours
update(Utilisateurmobile newUtilisateurmobile) async {
  var result = await db.update(
      "utilisateurmobile", newUtilisateurmobile.toMap(),
      where: "utilisateurmobile = ?",
      whereArgs: [newUtilisateurmobile.idUtilisateurMobile]);
  return result;
}

// Suppression par utilisateurmobile
deleteOneItem(String numTel) async {
  var result = await db.delete("utilisateurmobile", where: "nom = $numTel");
  return result;
}

// Suppression complet*
Future<int> deleteItem() async {
  return await db.delete("utilisateurmobile");
}
