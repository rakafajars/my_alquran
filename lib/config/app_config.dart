enum Environment {
  DEV,
  STAG,
  PROD,
}

enum UserRole {
  GUEST,
  MEMBER,
  CHEMIST,
  DOCTOR,
}

class ConfigUrl {
  static const String baseUrl = "baseUrl";

  static Map<String, dynamic> debugConstants = {
    baseUrl: "https://api-football.azharimm.tk/",
  };
  static Map<String, dynamic> stagConstants = {
    baseUrl: "",
  };
  static Map<String, dynamic> prodConstants = {
    baseUrl: "",
  };
}

class Constants {
  static Map<String, dynamic> config;
  static UserRole _userRole;

  static void setEnvironment(Environment env) {
    switch (env) {
      case Environment.DEV:
        config = ConfigUrl.debugConstants;
        break;
      case Environment.STAG:
        config = ConfigUrl.stagConstants;
        break;
      case Environment.PROD:
        config = ConfigUrl.prodConstants;
        break;
    }
  }

  static String get baseUrl => config[ConfigUrl.baseUrl];

  static void setUserRole(UserRole role) => _userRole = role;

  static UserRole get userRole => _userRole;
}

class ConstantUserRole {
  static const String KEY_USER_ROLE = "user-role";

  static const String MEMBER = "member";
  static const String GUEST = "guest";
  static const String CHEMIST = "chemist";
  static const String DOCTOR = "doctor";
}
