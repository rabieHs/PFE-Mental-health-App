import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mental_health_app/auth/services/auth_services.dart';
import 'package:mental_health_app/meditation/models/meditation_model.dart';

class MeditationServices {
  getMeditation() async {
    final Mood = await AuthServices()
        .getUserMood(FirebaseAuth.instance.currentUser!.uid);
    final snapshot = await FirebaseFirestore.instance
        .collection(Mood)
        .doc('Meditation')
        .collection('Meditation')
        .orderBy('listen', descending: true)
        .get();
    List<Meditation> meditationList = snapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return Meditation.fromMap(data);
    }).toList();
    return meditationList;
  }

  updatemeditationListen(String docId, int listen) async {
    final Mood = await AuthServices()
        .getUserMood(FirebaseAuth.instance.currentUser!.uid);
    final _listen = listen + 1;
    await FirebaseFirestore.instance
        .collection(Mood)
        .doc('Meditation')
        .collection('Meditation')
        .doc(docId)
        .update({"listen": _listen}).then((value) => print('liten updated'));
  }

  getMeditationForSleep() async {
    final snapshot = await FirebaseFirestore.instance
        .collection("Sleep")
        .doc('Meditation')
        .collection('Meditation')
        .orderBy('listen', descending: true)
        .get();
    List<Meditation> meditationList = snapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return Meditation.fromMap(data);
    }).toList();
    return meditationList;
  }

  updatemeditationListenForSleep(String docId, int listen) async {
    final Mood = await AuthServices()
        .getUserMood(FirebaseAuth.instance.currentUser!.uid);
    final _listen = listen + 1;
    await FirebaseFirestore.instance
        .collection("Sleep")
        .doc('Meditation')
        .collection('Meditation')
        .doc(docId)
        .update({"listen": _listen}).then((value) => print('liten updated'));
  }
}
