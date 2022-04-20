class User extends Object{
  int? id;
  String? fullName;
  String? email;
  String? department;
  List<String> positions = <String>[];
  String? profileImage;
  DateTime? registrationDate;

  User(this.id, this.fullName, this.email, this.department, this.positions,
      this.profileImage, this.registrationDate);
}