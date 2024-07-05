class UserCreationReq {
  String ? firstName;
  String ? lastName;
  String ? email;
  String ? password;

  UserCreationReq({
    required this.firstName,
    required this.email,
    required this.lastName,
    required this.password
  });
}