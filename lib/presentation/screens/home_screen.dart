import 'package:api_practice_2/presentation/screens/auth_screen.dart';
import 'package:api_practice_2/presentation/screens/character_screen.dart';
import 'package:api_practice_2/presentation/screens/post_screen.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post API'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const PostScreen()),
                );
              },
              child: const Text('Get Posts'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AuthView()),
                );
              },
              child: const Text('Post Data'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const CharacterScreen()),
                );
              },
              child: const Text('Get Characters'),
            ),
          ],
        ),
      ),
    );
  }
}
