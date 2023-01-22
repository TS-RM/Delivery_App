import 'package:tashil_food_app/data/address/model/address_model.dart';
import 'package:tashil_food_app/data/firebase/crud_firebase.dart';

class AddressService {
  Future<AddressModel> addToAddress({
    required AddressModel addressModel,
  }) async {
    final address = await CrudFirebase().createData(
        tableName: AddressModel.tableName, data: addressModel.toJson());
    if (address != null) {
      final data = AddressModel.fromJson(address);
      return data;
    } else {
      throw Exception('Gagal Login');
    }
  }

  Future<List<AddressModel>?> getAllAddress(String value) async {
    var response = await CrudFirebase().readDataWhereNoEither(
        tableName: AddressModel.tableName, fieldName1: 'UserID', value1: value);
    if (response != null) {
      final dataResponse =
          response.map((data) => AddressModel.fromJson(data)).toList();
      return dataResponse;
    } else {
      return null;
    }
  }

  deleteOneAddress(String id) {
    CrudFirebase().deleteData(tableName: AddressModel.tableName, id: id);
  }
}
