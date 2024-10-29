import 'package:flutter/material.dart';
import 'package:flutter_rpg/screens/home/home.dart';
import 'package:flutter_rpg/services/character_store.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
    create: (context) => CharacterStore(),
    child: MaterialApp(
      theme: primaryTheme,
      home: const Home(),
    ),
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




