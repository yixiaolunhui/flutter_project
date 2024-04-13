/// name : "Android开发工程师"
/// status : "急聘"
/// salaryRange : "3-6万元"
/// companyName : "百度"
/// financingStage : "已上市"
/// employeeNum : "10000以上"
/// tags : ["本科","SDK","设计模式"]
/// commutingTime : ""
/// address : ""
/// recruiter : {"name":"刘女士","icon":"https://www.baidu.com/xxx.png",", required String nameposition":"HR","status":""}

class WorkModel {
  WorkModel({
    String? name,
    String? status,
    String? salaryRange,
    String? companyName,
    String? financingStage,
    String? employeeNum,
    List<String>? tags,
    String? commutingTime,
    String? address,
    Recruiter? recruiter,
  }) {
    _name = name;
    _status = status;
    _salaryRange = salaryRange;
    _companyName = companyName;
    _financingStage = financingStage;
    _employeeNum = employeeNum;
    _tags = tags;
    _commutingTime = commutingTime;
    _address = address;
    _recruiter = recruiter;
  }

  WorkModel.fromJson(dynamic json) {
    _name = json['name'];
    _status = json['status'];
    _salaryRange = json['salaryRange'];
    _companyName = json['companyName'];
    _financingStage = json['financingStage'];
    _employeeNum = json['employeeNum'];
    _tags = json['tags'] != null ? json['tags'].cast<String>() : [];
    _commutingTime = json['commutingTime'];
    _address = json['address'];
    _recruiter = json['recruiter'] != null
        ? Recruiter.fromJson(json['recruiter'])
        : null;
  }

  String? _name;
  String? _status;
  String? _salaryRange;
  String? _companyName;
  String? _financingStage;
  String? _employeeNum;
  List<String>? _tags;
  String? _commutingTime;
  String? _address;
  Recruiter? _recruiter;

  WorkModel copyWith({
    String? name,
    String? status,
    String? salaryRange,
    String? companyName,
    String? financingStage,
    String? employeeNum,
    List<String>? tags,
    String? commutingTime,
    String? address,
    Recruiter? recruiter,
  }) =>
      WorkModel(
        name: name ?? _name,
        status: status ?? _status,
        salaryRange: salaryRange ?? _salaryRange,
        companyName: companyName ?? _companyName,
        financingStage: financingStage ?? _financingStage,
        employeeNum: employeeNum ?? _employeeNum,
        tags: tags ?? _tags,
        commutingTime: commutingTime ?? _commutingTime,
        address: address ?? _address,
        recruiter: recruiter ?? _recruiter,
      );

  String? get name => _name;

  String? get status => _status;

  String? get salaryRange => _salaryRange;

  String? get companyName => _companyName;

  String? get financingStage => _financingStage;

  String? get employeeNum => _employeeNum;

  List<String>? get tags => _tags;

  String? get commutingTime => _commutingTime;

  String? get address => _address;

  Recruiter? get recruiter => _recruiter;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['status'] = _status;
    map['salaryRange'] = _salaryRange;
    map['companyName'] = _companyName;
    map['financingStage'] = _financingStage;
    map['employeeNum'] = _employeeNum;
    map['tags'] = _tags;
    map['commutingTime'] = _commutingTime;
    map['address'] = _address;
    if (_recruiter != null) {
      map['recruiter'] = _recruiter?.toJson();
    }
    return map;
  }
}

/// name : "刘女士"
/// icon : "https://www.baidu.com/xxx.png"
/// position : "HR"
/// status : ""

class Recruiter {
  Recruiter({
    String? name,
    String? icon,
    String? position,
    String? status,
  }) {
    _name = name;
    _icon = icon;
    _position = position;
    _status = status;
  }

  Recruiter.fromJson(dynamic json) {
    _name = json['name'];
    _icon = json['icon'];
    _position = json['position'];
    _status = json['status'];
  }

  String? _name;
  String? _icon;
  String? _position;
  String? _status;

  Recruiter copyWith({
    String? name,
    String? icon,
    String? position,
    String? status,
  }) =>
      Recruiter(
        name: name ?? _name,
        icon: icon ?? _icon,
        position: position ?? _position,
        status: status ?? _status,
      );

  String? get name => _name;

  String? get icon => _icon;

  String? get position => _position;

  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['icon'] = _icon;
    map['position'] = _position;
    map['status'] = _status;
    return map;
  }
}
