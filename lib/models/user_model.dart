// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final String userID;
  String? name;
  String? email;
  int? phoneNumber;

  UserModel({
    required this.userID,
    this.name,
    this.email,
    this.phoneNumber,
  });
}
