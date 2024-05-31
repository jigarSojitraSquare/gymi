

class AppUtils {

  static bool isEmailValid(String value) {
    if (value.isNotEmpty) {
      return value
          .contains(RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"));
    } else {
      return false;
    }
  }
}