// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/model/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widget/custom_button.dart';
import 'package:store_app/widget/custom_txt_field.dart';

class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage({
    super.key,
  });
  static String id = 'Update product';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? name, desc, image, price;
  bool isLoding = false;
  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoding,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            'Update product',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                onChanged: (val) {
                  name = val;
                },
                hintText: 'Product Name',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                onChanged: (val) {
                  desc = val;
                },
                hintText: 'description',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                inputType: TextInputType.number,
                onChanged: (val) {
                  price = val;
                },
                hintText: 'price',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                onChanged: (val) {
                  image = val;
                },
                hintText: 'image',
              ),
              const SizedBox(
                height: 50,
              ),
              CustomButon(
                text: 'Update Product',
                onTap: () async {
                  isLoding = true;
                  setState(() {});
                    //await UpdateProduct(product);
                  try {
                    await UpdateProduct(product);
                    print("success");
                  } catch (e) {
                    print(e.toString());
                  }
                  isLoding = false;
                  setState(() {});
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> UpdateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
      title: name == null ? product.title : name!,
      price: price == null ? product.price.toString() : price!,
      desc: desc == null ? product.description : desc!,
      image: image == null ? product.image : image!,
      category: product.category,
      id: product.id,
    );
  }
}
