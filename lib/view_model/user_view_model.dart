import 'package:flutter/cupertino.dart';
import 'package:get_provider_new/data/models/country_model/country_model.dart';
import 'package:get_provider_new/data/models/user_model/user_model.dart';
import 'package:get_provider_new/data/repository/country_repository.dart';

class UserViewModel extends ChangeNotifier {
  UserViewModel({
    required this.userRepo,
  });

  final DataRepository userRepo;

  bool isLoading = false;
  List<UserModel> users = [];

  fetchCurrencies() async {
    isLoading = true;
    notifyListeners();
    var user = await userRepo.getUser();
    isLoading = false;
    notifyListeners();
    if (user.isEmpty) {
      debugPrint("Bosh ekan hafa bomisan");
    } else {
      debugPrint("Hammasi yaxshi");
      users = user;
      notifyListeners();
    }
  }
}