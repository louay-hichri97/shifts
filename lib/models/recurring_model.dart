class Recurring {
  int? id;
  String? startAt;
  String? endAt;
  bool? isAvailable;

  Recurring(
      {
        this.id,
        this.startAt,
        this.endAt,
        this.isAvailable
      });

  Recurring.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    startAt = json["start_at"];
    endAt = json["end_at"];
    isAvailable = json["is_available"];

  }
}