

class ExpertProfileModel {
  final String mobile;
  final String username;
  final String email;
  final bool auth;
  final bool verified;
  final dynamic image;
  final bool isVerified;

  ExpertProfileModel({
    required this.mobile,
    required this.username,
    required this.email,
    required this.auth,
    required this.verified,
    required this.image,
    required this.isVerified,
  });

  factory ExpertProfileModel.fromJson(Map<String, dynamic> json) {
    return ExpertProfileModel(
      mobile: json['mobile'],
      username: json['username'],
      email: json['email'],
      auth: json['auth'],
      verified: json['verified'],
      image: json['image'],
      isVerified: json['isVerified'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mobile': mobile,
      'username': username,
      'email': email,
      'auth': auth,
      'verified': verified,
      'image': image,
      'isVerified': isVerified,
    };
  }
}
