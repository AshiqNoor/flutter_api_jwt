part of '../views/screens/dashboard_screen.dart';

UserProfileModel userProfileModelFromJson(String str) =>
    UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) =>
    json.encode(data.toJson());

class UserProfileModel {
  UserProfileModel({
    required this.message,
    required this.authorization,
    required this.data,
  });

  final String message;
  final String authorization;
  final List<Stock> data;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      UserProfileModel(
        message: json["message"],
        authorization: json["Authorization"],
        data: List<Stock>.from(json["data"].map((x) => Stock.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "Authorization": authorization,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Stock {
  Stock({
    required this.pid,
    required this.pname,
    required this.pcat,
    required this.psize,
    required this.punit,
    required this.pqty,
    required this.pprice,
    required this.psprice,
    required this.pcode,
    required this.psupp,
    required this.pdate,
    required this.pstatus,
    required this.pbarcode,
  });

  final int pid;
  final String pname;
  final String pcat;
  final String psize;
  final String punit;
  final int pqty;
  final int pprice;
  final int psprice;
  final String pcode;
  final String psupp;
  final DateTime pdate;
  final String pstatus;
  final String pbarcode;

  factory Stock.fromJson(Map<String, dynamic> json) => Stock(
        pid: json["pid"],
        pname: json["pname"],
        pcat: json["pcat"],
        psize: json["psize"],
        punit: json["punit"],
        pqty: json["pqty"],
        pprice: json["pprice"],
        psprice: json["psprice"],
        pcode: json["pcode"],
        psupp: json["psupp"],
        pdate: DateTime.parse(json["pdate"]),
        pstatus: json["pstatus"],
        pbarcode: json["pbarcode"],
      );

  Map<String, dynamic> toJson() => {
        "pid": pid,
        "pname": pname,
        "pcat": pcat,
        "psize": psize,
        "punit": punit,
        "pqty": pqty,
        "pprice": pprice,
        "psprice": psprice,
        "pcode": pcode,
        "psupp": psupp,
        "pdate": pdate.toIso8601String(),
        "pstatus": pstatus,
        "pbarcode": pbarcode,
      };
}
