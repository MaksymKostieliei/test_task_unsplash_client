import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_unsplash_client/photos_bloc.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final photosBloc = context.read<PhotosBloc>();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Search for photos',
          suffixIcon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () =>
                photosBloc.fetchPhotos(query: _searchController.text),
          ),
        ),
      ),
    );
  }
}
