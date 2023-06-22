/* import 'package:flutter/material.dart';
import 'package:skillmaestro/common/on_boarding/second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Center(
          child: Image.asset('assets/polar-mechanic.gif'),
        ),
        const SizedBox(height: 40),
        const Text(
          'Skill \n    Maestro',
          style: TextStyle(fontSize: 50),
        ),
        SizedBox(
          height: 20,
          width: 20,
          child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SecondScreen()));
              },
              child: const SecondScreen()),
        )
      ],
    ));
  }
}
 */