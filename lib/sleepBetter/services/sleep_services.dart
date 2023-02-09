import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mental_health_app/music/models/music.dart';

import '../../auth/services/auth_services.dart';

class SleepServices {
  getCalmingSounds(String type) async {
    final snapshot = await FirebaseFirestore.instance
        .collection("Sleep")
        .doc(type)
        .collection(type)
        .get();
    final List<Music> sounds = snapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

      return Music.fromMap(data);
    }).toList();

    return sounds;
  }

  updatemeditationListen(
    String docId,
    int listen,
    String type,
  ) async {
    final _listen = listen + 1;
    await FirebaseFirestore.instance
        .collection('Sleep')
        .doc(type)
        .collection(type)
        .doc(docId)
        .update({"listen": _listen}).then((value) => print('liten updated'));
  }
}
