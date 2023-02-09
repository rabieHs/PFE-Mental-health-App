import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mental_health_app/music/models/music.dart';

import '../../auth/services/auth_services.dart';

class MusicServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Music>> getMusic() async {
    String mood = await AuthServices()
        .getUserMood(FirebaseAuth.instance.currentUser!.uid);
    List<Music> musicList = [];
    QuerySnapshot snapshot = await _firestore
        .collection(mood)
        .doc('Music')
        .collection('Music')
        .orderBy('listen', descending: true)
        .get();

    musicList = snapshot.docs.map((docs) {
      Map<String, dynamic> musicData = docs.data() as Map<String, dynamic>;
      return Music.fromMap(musicData);
    }).toList();
    return musicList;
  }

  updatemeditationListen(String docId, int listen, String type) async {
    final Mood = await AuthServices()
        .getUserMood(FirebaseAuth.instance.currentUser!.uid);
    final _listen = listen + 1;
    await FirebaseFirestore.instance
        .collection(Mood)
        .doc(type)
        .collection(type)
        .doc(docId)
        .update({"listen": _listen}).then((value) => print('liten updated'));
  }
}
