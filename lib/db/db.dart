import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


var data3;
var ue;
Database db;
Future<void> initDatabase() async {
  var path = await getDatabasePath('request.db');
  db = await openDatabase(path, version: 1,
      onCreate: (Database db, int version) async {
    //

    var tableUE = '''CREATE TABLE `unite_enseignement` 
        (`Nom_Unite` varchar(250) NOT NULL)''';
    await db.execute(tableUE);
    print("table unite cree");

    //
    var tableReq = '''CREATE TABLE `requete` (
                  `id_Requete` int(11) NOT NULL,
                  `code_UE` varchar(255) NOT NULL,
                  `Objet_Req` varchar(500) NOT NULL,
                  `Commentaire_Req` varchar(500) NOT NULL,
                  `PiecesJust_Req` varchar(250) NOT NULL,
                  `DateDepot_Req` varchar(255) NOT NULL,
                  `id_Etudiant` varchar(250) NOT NULL,
                  `id_Depart` int(255) NOT NULL )''';
    await db.execute(tableReq);
    print("table Requet cree");

    //

    var tableResultat = '''CREATE TABLE `resultat` (
                `id_Result` int(11) NOT NULL,
                `Statut_Req` varchar(250) NOT NULL,
                `Traiteur_Req` varchar(250) NOT NULL,
                `DateTrai_Req` date NOT NULL,
                `id_Requete` int(250) NOT NULL ) ''';
    await db.execute(tableResultat);
    print("table resultat cree");
  });
  print('db crée');
}

//
Future<String> getDatabasePath(String dbName) async {
  var dataPath = await getDatabasesPath();
  var path = join(dataPath, dbName);
  return path;
}





