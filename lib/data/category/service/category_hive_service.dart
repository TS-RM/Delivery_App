import 'package:flutter/material.dart';
import 'package:tashil_food_app/constants/init/init_boxses.dart';
import 'package:tashil_food_app/data/category/model/category_model.dart';

class CategoryHiveService {
  CategoryModel? getCategoryData(String id) {
    final box = Boxes.getCategoryData();
    final data = box.get(id);
    if (data != null) {
      return data;
    } else {
      return null;
    }
  }

  Future addCategoryData({
    required CategoryModel categoryModel,
  }) async {
    deleteAllCategory();
    final box = Boxes.getCategoryData();
    await box.put(categoryModel.id, categoryModel);
    debugPrint('${box.keys}');
    debugPrint('تم حفظ  القسم في التخزين المحلي');
  }

  Future addListCategory({
    required List<CategoryModel> dataCategory,
  }) async {
    // deleteAllCategory();
    final box = Boxes.getCategoryData();
    for (var category in dataCategory) {
      await box.put(category.id, category);
      debugPrint('${box.keys}');
      debugPrint('تم حفظ  القسم في التخزين المحلي');
    }
  }

  void deleteCategoryData(String id) {
    final box = Boxes.getCategoryData();
    box.delete(id);
    debugPrint('تم حذف قسم بنجاح');
  }

  void deleteAllCategory() {
    final box = Boxes.getCategoryData();
    box.clear();
    debugPrint('تم حذف كل الاقسام بنجاح');
  }

  List<CategoryModel>? getAllCategory() {
    final box = Boxes.getCategoryData();
    final data = box.values.toList();
    if (data.isNotEmpty) {
      return data;
    } else {
      return null;
    }
  }
}
