class Sitetlistmodel {
  bool? status;
  String? msg;
  int? totalLength;
  int? page;
  int? limit;
  List<Data>? data;
  String? name;

  Sitetlistmodel(
      {this.status,
      this.msg,
      this.totalLength,
      this.page,
      this.limit,
      this.data,
      this.name});

  Sitetlistmodel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    totalLength = json['totalLength'];
    page = json['page'];
    limit = json['limit'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['msg'] = msg;
    data['totalLength'] = totalLength;
    data['page'] = page;
    data['limit'] = limit;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['name'] = name;
    return data;
  }
}

class Data {
  String? sId;
  int? totalHoursWorkersSpend;
  int? totalWork;
  List<double>? location;
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
  bool? isEmployeesWorking;
  int? noofEmployeesWorking;
  int? noofEmployeesNotPunchIn;
  int? noofEmployeesPunchIn;

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
      this.isEmployeesWorking,
      this.noofEmployeesWorking,
      this.noofEmployeesNotPunchIn,
      this.noofEmployeesPunchIn});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    totalHoursWorkersSpend = json['totalHoursWorkersSpend'];
    totalWork = json['totalWork'];
    location = json['location'].cast<double>();
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
    isEmployeesWorking = json['isEmployeesWorking'];
    noofEmployeesWorking = json['NoofEmployeesWorking'];
    noofEmployeesNotPunchIn = json['NoofEmployeesNotPunchIn'];
    noofEmployeesPunchIn = json['NoofEmployeesPunchIn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['totalHoursWorkersSpend'] = totalHoursWorkersSpend;
    data['totalWork'] = totalWork;
    data['location'] = location;
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
    data['isEmployeesWorking'] = isEmployeesWorking;
    data['NoofEmployeesWorking'] = noofEmployeesWorking;
    data['NoofEmployeesNotPunchIn'] = noofEmployeesNotPunchIn;
    data['NoofEmployeesPunchIn'] = noofEmployeesPunchIn;
    return data;
  }
}
