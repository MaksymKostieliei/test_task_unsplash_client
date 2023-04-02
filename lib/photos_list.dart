import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_unsplash_client/photo_details_screen.dart';
import 'package:test_task_unsplash_client/photos_bloc.dart';

class PhotosList extends StatefulWidget {
  const PhotosList({super.key});

  @override
  _PhotosListState createState() => _PhotosListState();
}

class _PhotosListState extends State<PhotosList> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    context.read<PhotosBloc>().fetchPhotos();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      context
          .read<PhotosBloc>()
          .fetchPhotos(page: context.read<PhotosBloc>().state.length ~/ 20 + 1);
    }
  }

  Future<void> _onRefresh() async {
    await context.read<PhotosBloc>().refreshPhotos();
  }

  @override
  Widget build(BuildContext context) {
    final photosBloc = context.watch<PhotosBloc>();

    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: _onRefresh,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: photosBloc.state.length,
        itemBuilder: (context, index) {
          final photo = photosBloc.state[index];
          return InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => PhotoDetailsScreen(photo: photo)),
            ),
            child: Image.network(photo.thumbnailUrl),
          );
        },
      ),
    );
  }
}
