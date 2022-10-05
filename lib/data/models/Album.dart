class Album{
  final int userId;
  final int genreId;
  final int albumId;
  final String name;

  const Album({
    required this.albumId,
    required this.genreId,
    required this.userId,
    required this.name,
});

  factory Album.fromJson(Map<String, dynamic> json) => Album(
    userId: json['userId'] as int,
    albumId: json['albumId'] as int,
    genreId: json['genreId'] as int,
    name: json['name'] as String,
  );

  Map<String, dynamic> toJson() => {
    'userid': userId,
    'albumId': albumId,
    'genreId': genreId,
    'name': name,
  };
}