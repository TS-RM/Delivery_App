import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tashil_food_app/data/services/check_internet.dart';
import 'package:tashil_food_app/constants/enums/status_request.dart';

class CrudFirebase {
  Future<Map<String, dynamic>?> createData({
    required String tableName,
    required Map<String, dynamic> data,
  }) async {
    try {
      final doc = FirebaseFirestore.instance.collection(tableName).doc();
      data['id'] = doc.id;
      await doc.set(data);
      return data;
    } on FirebaseException catch (e) {
      debugPrint(e.code);
      debugPrint(e.message);
      return null;
    }
  }

  Future<Map<String, dynamic>?> createDataNested({
    required String tableName,
    required String tableName1,
    required String id,
    required Map<String, dynamic> data,
  }) async {
    try {
      final doc = FirebaseFirestore.instance
          .collection(tableName)
          .doc(id)
          .collection(tableName1)
          .doc();
      data['id'] = doc.id;
      await doc.set(data);
      return data;
    } on FirebaseException catch (e) {
      debugPrint(e.code);
      debugPrint(e.message);
      return null;
    }
  }

  Future<List<Map<String, dynamic>>?> getDataNested({
    required String tableName,
    required String id,
    required String nestedTableName,
  }) async {
    try {
      List<Map<String, dynamic>> data = [];
      final dataReference = FirebaseFirestore.instance
          .collection(tableName)
          .doc(id)
          .collection(nestedTableName);
      QuerySnapshot querySnapshot = await dataReference.get();
      List<QueryDocumentSnapshot> listDocs = querySnapshot.docs;
      data = listDocs.map((e) => e.data()).toList().cast();
      if (data.isNotEmpty) {
        return data;
      } else {
        return data;
      }
    } on FirebaseException catch (e) {
      debugPrint(e.code);
      debugPrint(e.message);
      return null;
    }
  }

  Future<Either<StatusRequest, List<Map<String, dynamic>>>> readDataAll({
    required String tableName,
  }) async {
    try {
      // Todo
      if (await checkInternet()) {
        List<Map<String, dynamic>> data = [];
        CollectionReference mealsReference =
            FirebaseFirestore.instance.collection(tableName);
        QuerySnapshot querySnapshot = await mealsReference.get();

        List<QueryDocumentSnapshot> listDocs = querySnapshot.docs;
        data = listDocs.map((e) => e.data()).toList().cast();

        if (data.isNotEmpty) {
          return Right(data);
        } else {
          return const Left(StatusRequest.failure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (cc) {
      print('%%%%%%%%%%%%%%%%%%%%%%%%%');
      return const Left(StatusRequest.serverFailure);
    }
  }

  Future<Either<StatusRequest, List<Map<String, dynamic>>>> readDataLimit({
    required String tableName,
    required int limit,
  }) async {
    try {
      // Todo
      if (await checkInternet()) {
        List<Map<String, dynamic>> data = [];
        CollectionReference mealsReference =
            FirebaseFirestore.instance.collection(tableName);
        QuerySnapshot querySnapshot = await mealsReference.limit(limit).get();

        List<QueryDocumentSnapshot> listDocs = querySnapshot.docs;
        data = listDocs.map((e) => e.data()).toList().cast();

        if (data.isNotEmpty) {
          return Right(data);
        } else {
          return const Left(StatusRequest.failure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      return const Left(StatusRequest.serverFailure);
    }
  }

  Future<List<Map<String, dynamic>>?> readDataAllNotEither({
    required String tableName,
  }) async {
    try {
      List<Map<String, dynamic>> data = [];
      CollectionReference mealsReference =
          FirebaseFirestore.instance.collection(tableName);
      QuerySnapshot querySnapshot = await mealsReference.get();
      List<QueryDocumentSnapshot> listDocs = querySnapshot.docs;
      data = listDocs.map((e) => e.data()).toList().cast();
      if (data.isNotEmpty) {
        return data;
      } else {
        return null;
      }
    } on FirebaseException catch (e) {
      debugPrint(e.code);
      debugPrint(e.message);
      return null;
    }
  }

  Future<Either<StatusRequest, List<Map<String, dynamic>>>> readDataWhere({
    required String tableName,
    required String fieldName1,
    required String value1,
  }) async {
    try {
      if (await checkInternet()) {
        List<Map<String, dynamic>> data = [];
        CollectionReference mealsReference =
            FirebaseFirestore.instance.collection(tableName);
        QuerySnapshot querySnapshot =
            await mealsReference.where(fieldName1, isEqualTo: value1).get();
        List<QueryDocumentSnapshot> listDocs = querySnapshot.docs;
        data = listDocs.map((e) => e.data()).toList().cast();
        if (data.isNotEmpty) {
          return Right(data);
        } else {
          return const Left(StatusRequest.failure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } on FirebaseException catch (e) {
      debugPrint(e.code);
      debugPrint(e.message);
      return const Left(StatusRequest.serverFailure);
    }
  }

  Future<List<Map<String, dynamic>>?> readDataWhereNoEither({
    required String tableName,
    required String fieldName1,
    required String value1,
  }) async {
    try {
      List<Map<String, dynamic>> data = [];
      CollectionReference mealsReference =
          FirebaseFirestore.instance.collection(tableName);
      QuerySnapshot querySnapshot =
          await mealsReference.where(fieldName1, isEqualTo: value1).get();
      List<QueryDocumentSnapshot> listDocs = querySnapshot.docs;
      data = listDocs.map((e) => e.data()).toList().cast();
      return data;
    } on FirebaseException catch (e) {
      debugPrint(e.code);
      debugPrint(e.message);
      return null;
    }
  }

  Future<List<Map<String, dynamic>>?> readDataWhere2Field({
    required String tableName,
    required String fieldName1,
    required String value1,
    required String fieldName2,
    required num value2,
  }) async {
    try {
      List<Map<String, dynamic>> data = [];
      CollectionReference mealsReference =
          FirebaseFirestore.instance.collection(tableName);
      QuerySnapshot querySnapshot = await mealsReference
          .where(fieldName1, isEqualTo: value1)
          .where(fieldName2, isEqualTo: value2)
          .get();
      List<QueryDocumentSnapshot> listDocs = querySnapshot.docs;
      data = listDocs.map((e) => e.data()).toList().cast();
      if (data.isNotEmpty) {
        return data;
      } else {
        return null;
      }
    } on FirebaseException catch (e) {
      print('=========================');
      debugPrint(e.code);
      debugPrint(e.message);
      print('=========================');
      return null;
    }
  }

  Future<List<Map<String, dynamic>>?> readDataWhere2FieldString({
    required String tableName,
    required String fieldName1,
    required String value1,
    required String fieldName2,
    required String value2,
  }) async {
    try {
      List<Map<String, dynamic>> data = [];
      CollectionReference mealsReference =
          FirebaseFirestore.instance.collection(tableName);
      QuerySnapshot querySnapshot = await mealsReference
          .where(fieldName1, isEqualTo: value1)
          .where(fieldName2, isEqualTo: value2)
          .get();
      List<QueryDocumentSnapshot> listDocs = querySnapshot.docs;
      data = listDocs.map((e) => e.data()).toList().cast();
      if (data.isNotEmpty) {
        return data;
      } else {
        return null;
      }
    } on FirebaseException catch (e) {
      print('=========================');
      debugPrint(e.code);
      debugPrint(e.message);
      print('=========================');
      return null;
    }
  }

  Future<List<Map<String, dynamic>>?> readDataWhereIsSearch({
    required String tableName,
    required String fieldName1,
    required String value1,
  }) async {
    try {
      if (await checkInternet()) {
        List<Map<String, dynamic>> data = [];
        CollectionReference mealsReference =
            FirebaseFirestore.instance.collection(tableName);
        QuerySnapshot querySnapshot = await mealsReference
            .where(fieldName1,
                isGreaterThanOrEqualTo: value1,
                isLessThan: value1.substring(0, value1.length - 1) +
                    String.fromCharCode(
                        value1.codeUnitAt(value1.length - 1) + 1))
            .get();
        // where('userName', isGreaterThanOrEqualTo: query, isLessThan: query.substring(0, query.length-1) + String.fromCharCode(query.codeUnitAt(query.length - 1) + 1))
        List<QueryDocumentSnapshot> listDocs = querySnapshot.docs;
        data = listDocs.map((e) => e.data()).toList().cast();
        if (data.isNotEmpty) {
          return data;
        } else {
          return data;
        }
      } else {
        return null;
      }
    } on FirebaseException catch (e) {
      debugPrint(e.code);
      debugPrint(e.message);
      return null;
    }
  }

  Stream readDataAllStream({
    required String tableName,
  }) async* {
    try {
      final data = FirebaseFirestore.instance
          .collection(tableName)
          .snapshots()
          .map(
              (snapshot) => snapshot.docs.map((doc) => doc.data()).toList()); //
      // yield data.first; // convert data return in future
      yield data;
    } on FirebaseException catch (e) {
      debugPrint(e.code);
      debugPrint(e.message);
    }
  }

  Future<Map<String, dynamic>?> readDataOneRow({
    required String tableName,
    required String id,
  }) async {
    try {
      final docUser = FirebaseFirestore.instance.collection(tableName).doc(id);
      final snapshot = await docUser.get();
      if (snapshot.exists) {
        return snapshot.data();
      } else {
        return null;
      }
    } on FirebaseException catch (e) {
      debugPrint(e.code);
      debugPrint(e.message);
      return null;
    }
  }

  Future upDateData({
    required String tableName,
    required String id,
    required Map<String, dynamic> data,
  }) async {
    try {
      final docUser = FirebaseFirestore.instance.collection(tableName).doc(id);
      docUser.update(data);
    } on FirebaseException catch (e) {
      debugPrint(e.code);
      debugPrint(e.message);
    }
  }

  Future upDateDataNested({
    required String tableName,
    required String id,
    required String nestedTableName,
    required String nestedId,
    required Map<String, dynamic> data,
  }) async {
    try {
      final docUser = FirebaseFirestore.instance
          .collection(tableName)
          .doc(id)
          .collection(nestedTableName)
          .doc(nestedId);
      docUser.update(data);
    } on FirebaseException catch (e) {
      debugPrint(e.code);
      debugPrint(e.message);
    }
  }

  deleteData({
    required String tableName,
    required String id,
  }) {
    try {
      final docUser = FirebaseFirestore.instance.collection(tableName).doc(id);
      docUser.delete();
    } on FirebaseException catch (e) {
      print(e.code);
      print(e.message);
    }
  }

  deleteDataNested({
    required String tableName,
    required String id,
    required String nestedTableName,
    required String nestedId,
  }) {
    try {
      final docUser = FirebaseFirestore.instance
          .collection(tableName)
          .doc(id)
          .collection(nestedTableName)
          .doc(nestedId);
      docUser.delete();
    } on FirebaseException catch (e) {
      print(e.code);
      print(e.message);
    }
  }

  Future<int> getCountRow({
    required String tableName,
    required String fieldName,
    required String value,
  }) async {
    final data = await FirebaseFirestore.instance
        .collection(tableName)
        .where(fieldName, isEqualTo: value)
        .get();
    int totalCount = 0;
    totalCount = data.docs.length;
    // for (var doc in data.docs.length) {
    //   totalCount++;
    // }

    return totalCount;
  }

  Future<Either<StatusRequest, List<Map<String, dynamic>>>>
      readDataLimitAndOrderBy({
    required String tableName,
    required int limit,
    required String orderByField,
  }) async {
    try {
      // Todo
      if (await checkInternet()) {
        List<Map<String, dynamic>> data = [];
        CollectionReference mealsReference =
            FirebaseFirestore.instance.collection(tableName);
        QuerySnapshot querySnapshot = await mealsReference
            .limit(limit)
            .orderBy(orderByField, descending: true)
            .get();

        List<QueryDocumentSnapshot> listDocs = querySnapshot.docs;
        data = listDocs.map((e) => e.data()).toList().cast();

        if (data.isNotEmpty) {
          return Right(data);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (cc) {
      print('%%%%%%%%%%%%%%%%%%%%%%%%%');
      return const Left(StatusRequest.serverFailure);
    }
  }
}
