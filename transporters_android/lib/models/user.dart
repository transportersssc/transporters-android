class User {
  String? firstName;
  String? lastName;
  String? dateofBirth;
  String? phone;
  String? email;
  String? username;
  String? password;

  User(this.firstName, this.lastName, this.email, this.username, this.password,
      this.dateofBirth, this.phone);

  User getUserData() {
    return User(
        firstName, lastName, email, username, password, dateofBirth, phone);
  }
}
