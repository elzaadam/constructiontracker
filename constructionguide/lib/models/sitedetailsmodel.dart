class Sitedetailsmodel {
  bool? status;
  String? msg;
  Data? data;

  Sitedetailsmodel({this.status, this.msg, this.data});

  Sitedetailsmodel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? sId;
  int? totalHoursWorkersSpend;
  int? totalWork;
  List<void>? location;
  String? status;
  String? userId;
  String? clientId;
  String? siteName;
  String? siteLocation;
  String? contactPersonName;
  int? siteContactPhone;
  String? siteContactAddress;
  String? work;
  String? createDate;
  String? updateDate;
  int? iV;
  List<void>? workersDetails;

  Data(
      {this.sId,
      this.totalHoursWorkersSpend,
      this.totalWork,
      this.location,
      this.status,
      this.userId,
      this.clientId,
      this.siteName,
      this.siteLocation,
      this.contactPersonName,
      this.siteContactPhone,
      this.siteContactAddress,
      this.work,
      this.createDate,
      this.updateDate,
      this.iV,
      this.workersDetails});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    totalHoursWorkersSpend = json['totalHoursWorkersSpend'];
    totalWork = json['totalWork'];
    // if (json['location'] != null) {
    //   location = <Null>[];
    //   json['location'].forEach((v) {
    //     location!.add(new Null.fromJson(v));
    //   });
    // }
    status = json['status'];
    userId = json['userId'];
    clientId = json['clientId'];
    siteName = json['siteName'];
    siteLocation = json['siteLocation'];
    contactPersonName = json['contactPersonName'];
    siteContactPhone = json['siteContactPhone'];
    siteContactAddress = json['siteContactAddress'];
    work = json['work'];
    createDate = json['create_date'];
    updateDate = json['update_date'];
    iV = json['__v'];
    // if (json['workersDetails'] != null) {
    //   workersDetails = <Null>[];
    //   json['workersDetails'].forEach((v) {
    //     workersDetails!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['totalHoursWorkersSpend'] = totalHoursWorkersSpend;
    data['totalWork'] = totalWork;
    // if (this.location != null) {
    //   data['location'] = this.location!.map((v) => v.toJson()).toList();
    // }
    data['status'] = status;
    data['userId'] = userId;
    data['clientId'] = clientId;
    data['siteName'] = siteName;
    data['siteLocation'] = siteLocation;
    data['contactPersonName'] = contactPersonName;
    data['siteContactPhone'] = siteContactPhone;
    data['siteContactAddress'] = siteContactAddress;
    data['work'] = work;
    data['create_date'] = createDate;
    data['update_date'] = updateDate;
    data['__v'] = iV;
    // if (this.workersDetails != null) {
    //   data['workersDetails'] =
    //       this.workersDetails!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}
