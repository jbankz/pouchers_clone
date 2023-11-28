class Env {
  static late EnvState _env;

  static void setEnvironment(EnvState environment) {
    _env = environment;
  }

  static EnvState getEnvironment() {
    return _env;
  }
}

enum EnvState { test, production }

/// Base url here, for test and live
String baseUrl({int version = 1}) {
  // return Env.getEnvironment() == EnvState.test
  //     ? "https://poucher-api.enyata.com/api/v$version"
  //     : "https://api.pouchers.io/api/v$version";

  return 'https://poucher-backend-14fc00be4800.herokuapp.com/api/v$version';
}
//https://poucher-backend-14fc00be4800.herokuapp.com/api/v1/auth/validate-password-reset-code
//https://poucher-backend-14fc00be4800.herokuapp.com/api/v1/user/change-phone