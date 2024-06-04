import 'package:app/model/category_model.dart';
import 'package:app/shared/api.dart';
import 'package:dio/dio.dart';

class CategoryRepository {
  Future getCategory(accessToken) async {
    final response = await api.get("/category/",
        options: Options(headers: {"Authorization": 'Bearer $accessToken'}));
    List<Category> listCategory = [];

    for (int i = 0; i < response.data.length; i++) {
      listCategory.add(Category.fromMap(response.data[i]));
    }
    return listCategory;
  }
}
