class UserCreationReq {
  String ? firstName;
  String ? lastName;
  String ? email;
  String ? password;
  int ? gender;
  String ? age;

  UserCreationReq({
    required this.firstName,
    required this.email,
    required this.lastName,
    required this.password
  });
}