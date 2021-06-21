class Utilisateurmobile {
  String _idUtilisateurMobile;
  String _nom;
  String _prenom;
  String _numTel;
  String _email;
  String _idUtilisateur;

  String get idUtilisateurMobile => _idUtilisateurMobile;
  String get nom => _nom;
  String get prenom => _prenom;
  String get numTel => _numTel;
  String get email => _email;
  String get idUtilisateur => _idUtilisateur;

  Utilisateurmobile(this._idUtilisateurMobile, this._nom, this._prenom,
      this._numTel, this._email, this._idUtilisateur);

  Utilisateurmobile.map(dynamic obj) {
    this._idUtilisateurMobile = obj["idUtilisateurMobile"];
    this._nom = obj["nom"];
    this._prenom = obj["prenom"];
    this._numTel = obj["numTel"];
    this._email = obj["email"];
    this._idUtilisateur = obj["idUtilisateur"];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["idUtilisateurMobile"] = _idUtilisateurMobile;
    map["nom"] = _nom;
    map["prenom"] = _prenom;
    map["numTel"] = _numTel;
    map["email"] = _email;
    map["idUtilisateur"] = _idUtilisateur;
    return map;
  }

  Utilisateurmobile.fromMap(Map<String, dynamic> map) {
    this._idUtilisateurMobile = map["idUtilisateurMobile"];
    this._nom = map["nom"];
    this._prenom = map["prenom"];
    this._email = map["email"];
    this._idUtilisateur = map["idUtilisateur"];
  }

  static Utilisateurmobile buildUtilisateur(var response) {
    return new Utilisateurmobile(
        response[0]['idUtilisateur'],
        response[0]['nom'],
        response[0]['prenom'],
        response[0]['numTel'],
        response[0]['email'],
        response[0]['idUtilisateur']);
  }
}
