
class UserModel {
  final int status;
  final ProfileData profileData;

  UserModel({
    required this.status,
    required this.profileData,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    status: json["status"],
    profileData: ProfileData.fromJson(json["profile_data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "profile_data": profileData.toJson(),
  };
}

class ProfileData {
  final String name;
  final String role;
  final String profilePic;
  final int age;
  final String userId;
  final int mobileNumber;

  ProfileData({
    required this.name,
    required this.role,
    required this.profilePic,
    required this.age,
    required this.userId,
    required this.mobileNumber,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
    name: json["name"],
    role: json["role"],
    profilePic: json["profile_pic"],
    age: json["age"],
    userId: json["user_id"],
    mobileNumber: json["mobile_number"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "role": role,
    "profile_pic": profilePic,
    "age": age,
    "user_id": userId,
    "mobile_number": mobileNumber,
  };
}
