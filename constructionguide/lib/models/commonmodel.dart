class Commonmodel {
  bool? status;
  String? token;
  String? role;
  String? id;
  String? msg;

  Commonmodel({this.status, this.token, this.role, this.id, this.msg});

  Commonmodel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    token = json['token'];
    role = json['role'];
    id = json['id'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['token'] = token;
    data['role'] = role;
    data['id'] = id;
    data['msg'] = msg;
    return data;
  }
}
