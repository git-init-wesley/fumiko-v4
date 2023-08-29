class RegExps {
  static RegExp get mail => RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-\/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  static RegExp get password =>
      RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[@$!%*#?&]).{7,32}$");

  static RegExp get username => RegExp(r"^([a-zA-Z_.0-9]){3,16}$");
}
