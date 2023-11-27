class EmployeesListModel {
  bool? status;
  String? msg;
  int? totalLength;
  int? page;
  int? limit;
  List<Data>? data;

  EmployeesListModel(
      {this.status,
      this.msg,
      this.totalLength,
      this.page,
      this.limit,
      this.data});

  EmployeesListModel.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}

class Data {
  String? sId;
  int? totalHoursSpend;
  int? additionWorkTimeAmount;
  int? dailyWage;
  String? status;
  UserId? userId;
  String? name;
  String? gender;
  String? addess;
  String? state;
  String? district;
  WorkCategoryId? workCategoryId;
  String? createDate;
  String? updateDate;
  int? iV;

  Data(
      {this.sId,
      this.totalHoursSpend,
      this.additionWorkTimeAmount,
      this.dailyWage,
      this.status,
      this.userId,
      this.name,
      this.gender,
      this.addess,
      this.state,
      this.district,
      this.workCategoryId,
      this.createDate,
      this.updateDate,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    totalHoursSpend = json['totalHoursSpend'];
    additionWorkTimeAmount = json['additionWorkTimeAmount'];
    dailyWage = json['dailyWage'];
    status = json['status'];
    userId = json['userId'] != null ? UserId.fromJson(json['userId']) : null;
    name = json['name'];
    gender = json['gender'];
    addess = json['addess'];
    state = json['state'];
    district = json['district'];
    workCategoryId = json['workCategoryId'] != null
        ? WorkCategoryId.fromJson(json['workCategoryId'])
        : null;
    createDate = json['create_date'];
    updateDate = json['update_date'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['totalHoursSpend'] = totalHoursSpend;
    data['additionWorkTimeAmount'] = additionWorkTimeAmount;
    data['dailyWage'] = dailyWage;
    data['status'] = status;
    if (userId != null) {
      data['userId'] = userId!.toJson();
    }
    data['name'] = name;
    data['gender'] = gender;
    data['addess'] = addess;
    data['state'] = state;
    data['district'] = district;
    if (workCategoryId != null) {
      data['workCategoryId'] = workCategoryId!.toJson();
    }
    data['create_date'] = createDate;
    data['update_date'] = updateDate;
    data['__v'] = iV;
    return data;
  }
}

class UserId {
  String? sId;
  String? role;
  int? usertype;
  String? status;
  String? phone;
  String? name;
  String? password;
  String? createDate;
  String? updateDate;
  int? iV;
  String? workerId;

  UserId(
      {this.sId,
      this.role,
      this.usertype,
      this.status,
      this.phone,
      this.name,
      this.password,
      this.createDate,
      this.updateDate,
      this.iV,
      this.workerId});

  UserId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    role = json['role'];
    usertype = json['usertype'];
    status = json['status'];
    phone = json['phone'];
    name = json['name'];
    password = json['password'];
    createDate = json['create_date'];
    updateDate = json['update_date'];
    iV = json['__v'];
    workerId = json['workerId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['role'] = role;
    data['usertype'] = usertype;
    data['status'] = status;
    data['phone'] = phone;
    data['name'] = name;
    data['password'] = password;
    data['create_date'] = createDate;
    data['update_date'] = updateDate;
    data['__v'] = iV;
    data['workerId'] = workerId;
    return data;
  }
}

class WorkCategoryId {
  String? sId;
  String? status;
  String? name;
  String? createDate;
  String? updateDate;
  int? iV;

  WorkCategoryId(
      {this.sId,
      this.status,
      this.name,
      this.createDate,
      this.updateDate,
      this.iV});

  WorkCategoryId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    status = json['status'];
    name = json['name'];
    createDate = json['create_date'];
    updateDate = json['update_date'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['status'] = status;
    data['name'] = name;
    data['create_date'] = createDate;
    data['update_date'] = updateDate;
    data['__v'] = iV;
    return data;
  }
}
