class FormValidation {
  String? firstName;
  String? lastName;
  String? dateofBirth;
  String? phone;
  String? email;
  String? username;
  String? password;
  String? confirmPassword;
  String? error;

  FormValidation(
      {this.firstName,
      this.lastName,
      this.dateofBirth,
      this.phone,
      this.email,
      this.username,
      this.password,
      this.confirmPassword,
      this.error});

  bool validateSignup() {
    RegExp emailRegEx = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    RegExp passwordRegEx =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

    if (email!.isEmpty) {
      error = "Email is empty";
      return false;
    }

    if (password!.isEmpty) {
      error = "Password is empty";
      return false;
    }

    if (firstName!.isEmpty) {
      error = "First Name is empty";
      return false;
    }

    if (lastName!.isEmpty) {
      error = "Last Name is empty";
      return false;
    }

    if (confirmPassword!.isEmpty) {
      error = "Confirm Password is empty";
      return false;
    }

    bool validEmail = emailRegEx.hasMatch(email!);
    bool validPassword = passwordRegEx.hasMatch(password!);
    bool matchingPassword = password == confirmPassword;

    if (!validEmail) {
      error = "Incorrect Email";
      return false;
    }

    if (!validPassword) {
      error = "Incorrect Password";
      return false;
    }

    if (!matchingPassword) {
      error = "Passwords do not match";
      return false;
    }

    return true;
  }
}
