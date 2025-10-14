import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ram_character/models/person.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesRepository {
  final SharedPreferences prefs;

  SharedPreferencesRepository({required this.prefs});

  static const String _favoritesCharacter = 'favorites_character';

  saveFavorites(List<Person> favorites) async {
    var json = jsonEncode(favorites);
    await prefs.setString(_favoritesCharacter, json);
  }

  List<Person> loadFavorites() {
    try {
      var json = prefs.getString(_favoritesCharacter);
      if (json != null) {
        List<Person> result = [];
        var dec = jsonDecode(json);
        debugPrint(dec.toString());
        for(var e in dec){
          result.add(Person.fromJson(e));
        }
        return result;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }
}
