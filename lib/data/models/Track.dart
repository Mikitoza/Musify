class Track {
  final int id;
  final int albumId;
  final int genreId;
  final String name;
  final int userId;

  Track({
    required this.userId,
    required this.genreId,
    required this.albumId,
    required this.name,
    required this.id,
  });

  factory Track.fromJson(Map<String, dynamic> json) => Track(
        id:json['id'] as int,
        userId: json['userId'] as int,
        albumId: json['albumId'] as int,
        genreId: json['genreId'] as int,
        name: json['name'] as String,
      );

  factory Track.fromMap(Map<String, dynamic> map) => Track(
    id:map['id'] as int,
    userId: map['userId'] as int,
    albumId: map['albumId'] as int,
    genreId: map['genreId'] as int,
    name: map['name'] as String,
  );


  Map<String, dynamic> toJson() => {
        'id': id,
        'userid': userId,
        'albumId': albumId,
        'genreId': genreId,
        'name': name,
      };
}
