import 'flag_model.dart';
import 'name_model.dart';

class CountryModel{
  final NameModel name;
  final List<dynamic> capital;
  final String flag;
  final FlagModel flagModel;

  CountryModel({required this.name , required this.capital , required this.flag , required this.flagModel});

  factory CountryModel.fromJson(Map<String ,dynamic> json){
    return CountryModel(
        name : NameModel.fromJson(json["name"]),
        capital: json["capital"] as List<dynamic>? ?? [],
        flag: json["flag"] as String? ?? "",
        flagModel: FlagModel.fromJson(json["flags"])
    );
  }

}