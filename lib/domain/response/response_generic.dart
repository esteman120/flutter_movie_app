class ResponseGeneric {
  ResponseGeneric({
    this.data,
    this.success,
  });

  dynamic data;
  bool? success;

  factory ResponseGeneric.fromJson(Map<String, dynamic> json) =>
      ResponseGeneric(
        data: json["data"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "success": success,
      };
}
