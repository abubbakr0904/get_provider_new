import 'dart:convert';

import 'package:get_provider_new/data/models/country_model/country_model.dart';
import 'package:get_provider_new/utils/api/api.dart';
import 'package:http/http.dart' as http;
class ApiProvider{
  Future<List<CountryModel>> getCountry()async{
    try {
      http.Response response = await http.get(Uri.parse(AppApi.countriesApi));
      if(response.statusCode == 200){
        return (jsonDecode(response.body) as List?)?.map((e) => CountryModel.fromJson(e)).toList() ?? [];
      }
      return [];
    }
    catch(error){
      rethrow;
    }
  }
}