abstract class DataBaseService {
  Future<void> addData(
      {required String collectionPath,
      required Map<String, dynamic> data,
      String? docId});
  Future<Map<String, dynamic>> getData(
      {required String docId, required String collectionPath});

  Future<bool> checkIfUserExists(
      {required String userId, required String collectionPath});
}
