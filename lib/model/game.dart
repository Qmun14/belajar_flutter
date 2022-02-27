class Game {
  int? id;
  String? title;
  String? thumbnail;
  String? description;
  String? genre;
  String? platform;
  String? publisher;
  String? developer;
  String? release_date;
  List<Screenshot>? screenshots;

  Game({
    this.id,
    this.title,
    this.thumbnail,
    this.description,
    this.genre,
    this.platform,
    this.publisher,
    this.developer,
    this.release_date,
    this.screenshots,
  });

  factory Game.fromJson(Map<String, dynamic> json) => Game(
        id: json['id'],
        title: json['title'],
        thumbnail: json['thumbnail'],
        description: json['description'],
        genre: json['genre'],
        platform: json['platform'],
        publisher: json['publisher'],
        developer: json['developer'],
        release_date: json['release_date'],
        screenshots: List.castFrom(json['screenshots'])
            .map((e) => Screenshot.fromJson(e))
            .toList(),
      );
}

class Screenshot {
  int? id;
  String? image;

  Screenshot({
    this.id,
    this.image,
  });

  factory Screenshot.fromJson(Map<String, dynamic> json) => Screenshot(
        id: json['id'],
        image: json['image'],
      );
}
