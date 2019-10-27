


import 'package:flutter_trip/model/common_model.dart';

class SalesBoxModel{
  final String icon;
  final String moreUrl;
  final CommonModel bigcard1;
  final CommonModel bigcard2;
  final CommonModel bigcard3;
  final CommonModel bigcard4;
  SalesBoxModel( {this.icon, this.moreUrl, this.bigcard1, this.bigcard2, this.bigcard3, this.bigcard4});

  factory SalesBoxModel.fromJson(Map<String,dynamic>json){
    return SalesBoxModel(
      icon: json["icon"],
      moreUrl: json["moreUrl"],
      bigcard1: json["bigcard1"],
      bigcard3: json["bigcard3"],
      bigcard4: json["bigcard4"]
    );
  }
}