extension InputValidation on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final whitespaceRE = RegExp(r"\s+");
    List<String> nameTextControl =
        replaceAll(whitespaceRE, " ").trim().split(' ');

    return nameTextControl.length >= 2 ? true : false;
  }

  bool get isValidPassword {
    //TODO: Password validation will be more strange
    final passwordRegExp = RegExp(r"^[a-zA-Z0-9]{3,30}$");
    return passwordRegExp.hasMatch(this);
  }

  bool get isNotNull {
    // ignore: unnecessary_null_comparison
    return this != null;
  }
}
