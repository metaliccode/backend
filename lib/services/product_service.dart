import 'dart:convert';

import 'package:training_flutter/helpers/constant.dart';
import 'package:training_flutter/models/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:training_flutter/models/product_model.dart';

// get all posts
Future<ApiResponse> getProduct() async {
  ApiResponse apiResponse = ApiResponse();
  try {
    final response = await http.get(Uri.parse(productURL), headers: {
      'Accept': 'application/json',
    });

    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body)['data'];
        // .map((p) => Product.fromJson(p))
        // .toList();
        apiResponse.data as List<dynamic>;
        break;
      case 401:
        apiResponse.error = unauthorized;
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}
