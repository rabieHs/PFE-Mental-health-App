import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mental_health_app/meditation/models/meditation_model.dart';

class MeditationServices {
  getMeditation(String Mood) async {
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

  updatemeditationListen(String docId, int listen, String Mood) async {
    final _listen = listen + 1;
    await FirebaseFirestore.instance
        .collection(Mood)
        .doc('Meditation')
        .collection('Meditation')
        .doc(docId)
        .update({"listen": _listen}).then((value) => print('liten updated'));
  }
}
