// ignore_for_file: missing_required_param

import '../helper/api.dart';
import '../model/product_model.dart';

class CtegoryService {
  Future<List<ProductModel>> getCategoryProduct(String categoryName) async {
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$categoryName');

    List<ProductModel> productList = [];
    for (int i = 0; i < data.length; i++) {
      productList.add(
        ProductModel.fromjson(data[i]),
      );
    }
    return productList;
  }
}
