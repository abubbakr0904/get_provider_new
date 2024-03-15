import 'flag_model.dart';
import 'name_model.dart';

class CountryModel{
  final NameModel name;
  final String region;
  final String flag;
  final FlagModel flagModel;

  CountryModel({required this.name , required this.region , required this.flag , required this.flagModel});

  factory CountryModel.fromJson(Map<String ,dynamic> json){
    return CountryModel(
        name : NameModel.fromJson(json["name"]),
        region: json["region"] as String ?? "",
        flag: json["flag"] as String? ?? "",
        flagModel: FlagModel.fromJson(json["flags"])
    );
  }

}