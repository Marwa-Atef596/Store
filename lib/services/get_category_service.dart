// ignore_for_file: missing_required_param

import '../helper/api.dart';

class AllCategoryService {
  Future<List<dynamic>> getAllCategory() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products/categories');

    return data;
  }
}
