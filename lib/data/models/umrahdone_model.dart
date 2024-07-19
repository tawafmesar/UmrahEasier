class umrahdone_model {
  String? umrahdoneId;
  String? umrahdoneStatus;
  String? umrahdoneUserId;
  String? umrahdoneDate;

  umrahdone_model(
      {this.umrahdoneId,
        this.umrahdoneStatus,
        this.umrahdoneUserId,
        this.umrahdoneDate});

  umrahdone_model.fromJson(Map<String, dynamic> json) {
    umrahdoneId = json['umrahdone_id'];
    umrahdoneStatus = json['umrahdone_status'];
    umrahdoneUserId = json['umrahdone_user_id'];
    umrahdoneDate = json['umrahdone_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['umrahdone_id'] = this.umrahdoneId;
    data['umrahdone_status'] = this.umrahdoneStatus;
    data['umrahdone_user_id'] = this.umrahdoneUserId;
    data['umrahdone_date'] = this.umrahdoneDate;
    return data;
  }
}