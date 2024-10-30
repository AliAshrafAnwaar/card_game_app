import 'package:flutter/material.dart';
import 'package:flutter_rpg/model/character.dart';
import 'package:flutter_rpg/services/firestore_service.dart';

class CharacterStore extends ChangeNotifier {
  final List<Character> _characters = [
    // Character(
    //   id: '1',
    //   name: 'Klara',
    //   vocation: Vocation.wizard,
    //   slogan: 'Kapumf!',
    // ),
    // Character(
    //     id: '2',
    //     name: 'Jonny',
    //     vocation: Vocation.junkie,
    //     slogan: 'Light me up...'),
    // Character(
    //     id: '3',
    //     name: 'Crimson',
    //     vocation: Vocation.raider,
    //     slogan: 'Fire in the hole!'),
    // Character(
    //     id: '4',
    //     name: 'Shaun',
    //     vocation: Vocation.ninja,
    //     slogan: 'Alright then gang.'),
  ];

  get characters => _characters;

  // add character

  void addCharacter(Character character) {
    FirestoreService.addCharacter(character);
    _characters.add(character);
    notifyListeners();
  }

  // save (update) character

  Future<void> saveCharacter(Character character) async {
    await FirestoreService.updateCharacter(character);
    return;
  }

  // remove character

  void removeCharacter(Character character) async {
    await FirestoreService.deleteCharacter(character);
    _characters.remove(character);
    notifyListeners();
  }

  // initially fethc characters
  void fetchCharactersOnce() async {
    if (characters.length == 0) {
      final snapshot = await FirestoreService.getCharactersOnce();
      for (var doc in snapshot.docs) {
        _characters.add(doc.data());
      }
      notifyListeners();
    }
  }
}
