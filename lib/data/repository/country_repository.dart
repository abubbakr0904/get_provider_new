import 'package:get_provider_new/data/models/country_model/country_model.dart';
import 'package:get_provider_new/data/network/api_provider.dart';

class CountryRepository{
  final ApiProvider apiProvider;

  CountryRepository({required this.apiProvider});

  Future<List<CountryModel>> getCountries(){
    return apiProvider.getCountry();
  }
}