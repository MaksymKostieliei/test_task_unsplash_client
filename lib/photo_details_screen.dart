import 'package:flutter/material.dart';
import 'package:test_task_unsplash_client/photo.dart';

class PhotoDetailsScreen extends StatelessWidget {
  final Photo photo;

  const PhotoDetailsScreen({Key? key, required this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Details'),
      ),
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Center(
          child: Hero(
            tag: photo.id,
            child: Image.network(photo.url),
          ),
        ),
      ),
    );
  }
}
