import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_unsplash_client/photos_bloc.dart';
import 'package:test_task_unsplash_client/photos_list.dart';
import 'package:test_task_unsplash_client/photos_repository.dart';
import 'package:test_task_unsplash_client/search_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unsplash App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PhotosScreen(),
    );
  }
}

class PhotosScreen extends StatelessWidget {
  const PhotosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Unsplash Photos'),
      ),
      body: BlocProvider(
        create: (_) => PhotosBloc(PhotosRepository()),
        child: Column(
          children: const [
            SearchBar(),
            Expanded(
              child: PhotosList(),
            ),
          ],
        ),
      ),
    );
  }
}
