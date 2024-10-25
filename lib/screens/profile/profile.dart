import 'package:flutter/material.dart';
import 'package:flutter_rpg/model/character.dart';
import 'package:flutter_rpg/shared/styled_text.dart';

class Profile extends StatelessWidget {
  const Profile({required this.character, super.key});

  final Character character;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle('Character name'),
      ),
      body: const SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // basic info - image, vocation, description

            // weapon ability

            //stats & skills

            //save button
          ],
        ),
      ),
    );
  }
}
