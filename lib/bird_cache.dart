import 'package:horus/models/birds.dart';

class BirdCache {
  static Birds? birdsList;

  static Bird? getBirdByName(String commonName) {
    List<Bird> birdList = birdsList!.birdList;
    return birdList.firstWhere(
      (bird) => bird.commonName.toLowerCase() == commonName.toLowerCase(),
      orElse: () => throw Exception('Bird not found'),
    );
  }
}
