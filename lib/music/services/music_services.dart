import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mental_health_app/music/models/music.dart';

class MusicServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Music>> getMusic(String mood) async {
    List<Music> musicList = [];
    QuerySnapshot snapshot = await _firestore
        .collection(mood)
        .doc('Music')
        .collection('Music')
        .get();

    musicList = snapshot.docs.map((docs) {
      Map<String, dynamic> musicData = docs.data() as Map<String, dynamic>;
      return Music.fromMap(musicData);
    }).toList();
    return musicList;
  }
}
