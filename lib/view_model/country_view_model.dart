import 'package:flutter/cupertino.dart';
import 'package:get_provider_new/data/models/country_model/country_model.dart';
import 'package:get_provider_new/data/repository/country_repository.dart';

class CountryViewModel extends ChangeNotifier {
  CountryViewModel({
    required this.countryRepository,
  });

  final CountryRepository countryRepository;

  bool isLoading = false;
  List<CountryModel> countries = [];

  fetchCurrencies() async {
    isLoading = true;
    notifyListeners();
    var county = await countryRepository.getCountries();
    isLoading = false;
    notifyListeners();
    if (county.isEmpty) {
      debugPrint("Bosh ekan hafa bomisan");
    } else {
      debugPrint("Hammasi yaxshi");
      countries = county;
      notifyListeners();
    }
  }
}