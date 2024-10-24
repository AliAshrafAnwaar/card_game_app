import 'package:flutter/material.dart';
import 'package:flutter_rpg/screens/create/create.dart';
import 'package:flutter_rpg/theme.dart';

void main() {
  runApp(MaterialApp(
    theme: primaryTheme,
    home: const Create(),
  ));
}


// class SandBox extends StatelessWidget {
//   SandBox({super.key});

//   List<String> things = [
//     "this",
//     "this1",
//     "this2",
//     "this3"
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const StyledTitle("Sandbox"),
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             const StyledTitle("Charcter List"),
//             StyledButton(onPressed: (){}, child: const StyledHeadline("Create New")),
//             Expanded(
//               child: ListView.builder(
//                 itemBuilder: (context, index) {
//                   return CharacterCard( character: ch[index]);
//                   },
//                 itemCount: things.length,
//                 ),
//             )
//           ],
//         ),
//       )
//     );
//   }
// }




