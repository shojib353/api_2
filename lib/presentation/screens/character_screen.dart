import 'package:flutter/material.dart';
import '../../core/services/api_service.dart';
import '../../core/utils/constants/urls.dart';
import '../../data/models/character.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  bool isLoading = true;
  final ApiService _apiService = ApiService();
  late Character character;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadCharacters();
  }

  void _loadCharacters() async {
    final data = await _apiService.fetchData(characterUrl);
    character = Character.fromJson(data);
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Characters'),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          :SingleChildScrollView(
    child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
    children: character.results!.map((post) {
    return Card(
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          // Character Image and Name
          Row(
          children: [
          ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
          post.image!,
          width: 80,
          height: 80,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
          return const Icon(Icons.error, size: 80, color: Colors.red);
          },
          ),
          ),
          const SizedBox(width: 16),
          Expanded(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(
          post.name!,
          style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          ),
          ),


            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: post.status == "Alive"
                        ? Colors.green
                        : post.status == "Dead"
                        ? Colors.red
                        : Colors.grey,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  "Status: ${post.status}",
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          Text(
          "Species: ${post.species}",
          style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          Text(
          "Gender: ${post.gender}",
          style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          ],
          ),
          ),
          ],
          ),
          const SizedBox(height: 16),
          // Additional Details
          Text(
          "Origin: ${post.origin!.name}",
          style: const TextStyle(fontSize: 14),
          ),
          Text(
          "Location: ${post.location!.name}",
          style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 10),


          Wrap(
          spacing: 8,
          runSpacing: 8,
          children: post.episode!.map((episode) {
          return Chip(
          label: Text(
          episode.split('/').last,
          style: const TextStyle(fontSize: 12),
          ),
          backgroundColor: Colors.blue[100],
          );
          }).toList(),
          ),
          const SizedBox(height: 10),

          Text(
          "Created on: ${post.created!}",
          style: const TextStyle(
          fontSize: 12,
          fontStyle: FontStyle.italic,
          color: Colors.grey,
          ),
          ),
          ],
          ),
          ),
          );
    }).toList(),
        ),
      ),
      )
    );
  }
}
