//package pour les ressurces http lié à API
import 'dart:convert';

import 'package:http/http.dart' as http;

class Film {
// déclarration des variables

  final String titre;
  final String afficheFilm;
  final String acteurs;
  final String Realisateur;
  final String idFilm;

// Initialisation des variables

  Film({
    required this.titre,
    required this.afficheFilm,
    required this.acteurs,
    required this.Realisateur,
    required this.idFilm,
  });

// asociation des variables avec les éléments du film

  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
        titre: json["Title"],
        afficheFilm: json["Poster"],
        acteurs: json["Actors"],
        Realisateur: json["Director"],
        idFilm: json["imdbID"]);
  }
}

// Fonction du film à rechercher
class FilmFonction {
  static Future<List<Film>> getFilm(filmRechercher) async {
    final url =
        Uri.parse('http://www.omdbapi.com/?s=$filmRechercher&apikey=5edd8232');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      Map film = json.decode(response.body);
      var list = (film['search'] as List)
          .map((item) => new Film.fromJson(item))
          .toList();
      return list;
    } else {
      throw Exception(
          "une erreur est survenue lors de la recherche de votre film !!");
    }
  }
}
