part of dashboard;

UserProfileResModel userProfileResModelFromJson(String str) =>
    UserProfileResModel.fromJson(json.decode(str));

String userProfileResModelToJson(UserProfileResModel data) =>
    json.encode(data.toJson());

class UserProfileResModel {
  UserProfileResModel({
    required this.message,
    required this.data,
  });

  final String message;

  final List<Pdata> data;

  factory UserProfileResModel.fromJson(Map<String, dynamic> json) =>
      UserProfileResModel(
        message: json["message"],
        data: List<Pdata>.from(json["data"].map((x) => Pdata.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Pdata {
  Pdata({
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

  final int? pid;
  final String? pname;
  final String? pcat;
  final String? psize;
  final String? punit;
  final int? pqty;
  final int? pprice;
  final int? psprice;
  final String? pcode;
  final String? psupp;
  final String? pdate;
  final String? pstatus;
  final String? pbarcode;

  factory Pdata.fromJson(Map<String, dynamic> json) => Pdata(
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
        pdate: json["pdate"],
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
        "pdate": pdate,
        "pstatus": pstatus,
        "pbarcode": pbarcode,
      };
}
