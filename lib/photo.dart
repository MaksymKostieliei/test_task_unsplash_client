class Photo {
  final String id;
  final String url;
  final String thumbnailUrl;

  Photo({
    required this.id,
    required this.url,
    required this.thumbnailUrl,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'],
      url: json['urls']['regular'],
      thumbnailUrl: json['urls']['thumb'],
    );
  }
}
