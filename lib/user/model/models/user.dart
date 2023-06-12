import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  final String username;
  final String email;
  final String password;
  final String mobile;

  User(this.username, this.email, this.password, this.mobile);
  User.fromJson(Map data)
      : username = data['username'],
        email = data['email'],
        password = data['password'],
        mobile = data['mobile'];
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['email'] = email;
    data['password'] = password;
    data['mobile'] = mobile;

    return data;
  }
}
