import 'package:get_provider_new/data/models/country_model/country_model.dart';
import 'package:get_provider_new/data/models/user_model/user_model.dart';
import 'package:get_provider_new/data/network/api_provider.dart';

class DataRepository{
  final ApiProvider apiProvider;

  DataRepository({required this.apiProvider});

  Future<List<CountryModel>> getCountries(){
    return apiProvider.getCountry();
  }
  Future<List<UserModel>> getUser(){
    return apiProvider.getUser();
  }
}