class Validator {
  static validateLogin(String value) {
    if (value.isEmpty) {
      return 'Preencha o login';
    }
    return null;
  }

  static validatePassword(String value) {
    if (value.isEmpty) {
      return 'Preencha a senha';
    }
    if(value.length < 3){
      return 'A senha precisa ter no mínimo 3 dígitos';
    }

    return null;
  }
}
