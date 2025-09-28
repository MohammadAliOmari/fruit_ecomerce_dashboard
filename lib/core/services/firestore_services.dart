import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_dashboard/core/services/data_base_services.dart';

class FirestoreServices implements DataBaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData(
      {required String collectionPath,
      required Map<String, dynamic> data,
      String? docId}) async {
    if (docId != null) {
      await firestore.collection(collectionPath).doc(docId).set(data);
    } else {
      await firestore.collection(collectionPath).add(data);
    }
  }

  @override
  Future<Map<String, dynamic>> getData(
      {required String docId, required String collectionPath}) async {
    var data = await firestore.collection(collectionPath).doc(docId).get();
    return data.data()!;
  }

  @override
  Future<bool> checkIfUserExists(
      {required String userId, required String collectionPath}) async {
    var data = await firestore.collection(collectionPath).doc(userId).get();
    return data.exists;
  }
}
