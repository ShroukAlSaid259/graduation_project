class workDayModel {
  int? id;
  int? clinicalId;
  String? fromTime;
  String? toTime;
  int? status;
  int? statusDay;
  String? createdAt;
  String? updatedAt;

  workDayModel(
      {this.id,
        this.clinicalId,
        this.fromTime,
        this.toTime,
        this.status,
        this.statusDay,
        this.createdAt,
        this.updatedAt});

  workDayModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clinicalId = json['Clinical_Id'];
    fromTime = json['From_Time'];
    toTime = json['To_Time'];
    status = json['Status'];
    statusDay = json['StatusDay'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Clinical_Id'] = this.clinicalId;
    data['From_Time'] = this.fromTime;
    data['To_Time'] = this.toTime;
    data['Status'] = this.status;
    data['StatusDay'] = this.statusDay;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}