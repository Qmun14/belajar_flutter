import 'package:belajar_flutter/db/db_animal.dart';

class Animal {
  String name;
  String image;
  String move;
  double weight;

  Animal({
    required this.image,
    required this.name,
    required this.move,
    required this.weight,
  });

  factory Animal.fromMap(Map<String, dynamic> map) => Animal(
        image: map[DBAnimal.COLUMN_IMAGE],
        name: map[DBAnimal.COLUMN_NAME],
        move: map[DBAnimal.COLUMN_MOVE],
        weight: map[DBAnimal.COLUMN_WEIGHT],
      );

  Map<String, dynamic> toMap() => {
        DBAnimal.COLUMN_IMAGE: image,
        DBAnimal.COLUMN_NAME: name,
        DBAnimal.COLUMN_MOVE: move,
        DBAnimal.COLUMN_WEIGHT: weight,
      };
}

String _assetAnimal = 'asset/image/animal';
List listAnimal = [
  Animal(
      image: '$_assetAnimal/burung.jpg',
      name: 'Bird',
      move: 'Fly, Walk',
      weight: 2.0),
  Animal(
      image: '$_assetAnimal/ikan.jpg',
      name: 'Fish',
      move: 'Swimm',
      weight: 0.27),
  Animal(
      image: '$_assetAnimal/kelinci.jpg',
      name: 'Rabbit',
      move: 'Walk, Jump',
      weight: 3.3),
  Animal(
      image: '$_assetAnimal/kucing.jpg',
      name: 'Cat',
      move: 'Walk, Jump',
      weight: 3.7),
  Animal(
      image: '$_assetAnimal/kuda.jpg',
      name: 'Horse',
      move: 'Walk, Run, Jump',
      weight: 350.0),
  Animal(
      image: '$_assetAnimal/kura-kura.jpg',
      name: 'Turtle',
      move: 'Swimm, Walk',
      weight: 50.0),
];
