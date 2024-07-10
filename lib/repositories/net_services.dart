//import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fake_store_api/constants/app_constants.dart';
import 'package:fake_store_api/models/goods_model.dart';

class GetCategories {
  final Dio dio;

  GetCategories({required this.dio});

  Future<List<String>> getCategories() async {
    //try {
    final Response response = await dio.get(AppConstants.categoryUrl);

    List<String> stringList = List<String>.from(response.data);
    // List<String> stringList =
    //     response.data.map((e) => e.toString()).toList<String>();
    //print(stringList);
    return stringList;
    // } catch (e) {
    //   //print(e.toString());
    //   return [];
    // }
  }

  Future<List<GoodsModel>> getSubCategories(String categoryUrl) async {
    // try {
    final Response response = await dio.get(categoryUrl);
    //print(response);
    //final jsonResponse = jsonDecode(response.data);
    //print(jsonResponse);
    List goodsModels =
        (response.data).map((e) => GoodsModel.fromJson(e)).toList();
    List<GoodsModel> gmList = List<GoodsModel>.from(goodsModels);
    //print(gmList);
    return gmList;
    // } catch (e) {
    //   return [];
    // }
  }

  Future<void> sendEmail(
      {required String toName, required String email}) async {
    await dio.post(AppConstants.sendEmailUrl, data: {
      "service_id": AppConstants.serviceId,
      "template_id": AppConstants.templateId,
      "user_id": AppConstants.publicKey,
      "accessToken": AppConstants.privateKey,
      "template_params": {
        "emailAdress": email,
        "from_name": "Fake store",
        "to_name": toName,
        "message":
            "You have ordering goods in Fake store app.Thanks for testing app Fake store. Best regards!",
        "data": DateTime.now().toString()
      }
    });
  }
}
