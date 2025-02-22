import 'package:flutter/material.dart';
import 'package:flutter_rpg/model/character.dart';
import 'package:flutter_rpg/screens/profile/profile.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({required this.character, super.key});
  final Character character;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          children: [
            Image.asset(
              'assets/img/vocations/${character.vocation.image}',
              width: 80,
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StyledHeadline(character.name),
                StyledText(character.vocation.title),
              ],
            ),
            const Expanded(
              child: SizedBox(),
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => Profile(
                                character: character,
                              )));
                },
                icon: Icon(
                  Icons.arrow_forward,
                  color: AppColors.textColor,
                ))
          ],
        ),
      ),
    );
  }
}
