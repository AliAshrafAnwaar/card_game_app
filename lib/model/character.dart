import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rpg/model/skills.dart';
import 'package:flutter_rpg/model/stats.dart';
import 'package:flutter_rpg/model/vocation.dart';

class Character with Stats {
  Character({
    required this.name,
    required this.slogan,
    required this.vocation,
    required this.id,
  });
  //fileds
  final Set<Skill> skills = {};
  final Vocation vocation;
  final String name;
  final String id;
  final String slogan;
  bool _isFav = false;

  //Getter
  bool get isFav => _isFav;

  //Methods
  void toogleIsFav() {
    _isFav = !_isFav;
  }

  void updateSkill(Skill skill) {
    skills.clear();
    skills.add(skill);
  }

  // to firestore
  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'slogan': slogan,
      'isFav': isFav,
      'vocation': vocation.toString(),
      'skills': skills.map((skill) => skill.id).toList(),
      'stats': statsAsMap,
      'points' : points
    };
  }

  // from firestore
  factory Character.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? Options,
  ) {
    // get data from snapshot
    final data = snapshot.data()!;

    //make character instance
    Character character = Character(
      name: data['name'],
      id: snapshot.id,
      slogan: data['slogan'],
      vocation:
          Vocation.values.firstWhere((v) => v.toString() == data['vocation']),
    );

    // update skills
    for (String id in data['skills']) {
      Skill skill = allSkills.firstWhere((skill) => skill.id == id);
      character.updateSkill(skill);
    }

    //set is fav
    if (data['isFave'] == true) {
      character.toogleIsFav();
    }

    // update stats
    Stats state = ;
    Map<String, int> stats = data['stats'];

    return;
  }
}

//dummy character data

List<Character> characters = [
  Character(
    id: '1',
    name: 'Klara',
    vocation: Vocation.wizard,
    slogan: 'Kapumf!',
  ),
  Character(
      id: '2',
      name: 'Jonny',
      vocation: Vocation.junkie,
      slogan: 'Light me up...'),
  Character(
      id: '3',
      name: 'Crimson',
      vocation: Vocation.raider,
      slogan: 'Fire in the hole!'),
  Character(
      id: '4',
      name: 'Shaun',
      vocation: Vocation.ninja,
      slogan: 'Alright then gang.'),
];
