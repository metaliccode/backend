import 'package:flutter/material.dart';
import 'package:training_flutter/helpers/constant.dart';
import 'package:training_flutter/models/api_response.dart';
import 'package:training_flutter/pages/login.dart';
import 'package:training_flutter/services/product_service.dart';
import 'package:training_flutter/services/user_service.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<dynamic> _productList = [];
  bool isLoading = true;

  // get all posts
  Future<void> getAllPosts() async {
    // panggil response dari model
    ApiResponse response = await getProduct();
    // jika response berhasil
    if (response.error == null) {
      // masukan data ke list _postList = []
      debugPrint('Response: ${response.data}');
      setState(() {
        isLoading = false;
        _productList = response.data as List<dynamic>;
      });
    } else {
      // jika gagal
      print(response.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (isLoading)
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _productList.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 5,
                  child: ListTile(
                    title: Text(_productList[index]['name']),
                    subtitle: Text(
                      _productList[index]['description'],
                    ),
                    leading: const Icon(
                      Icons.newspaper,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
