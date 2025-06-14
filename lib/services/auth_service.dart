class AuthService {
  // Simulando um "banco de dados" com uma lista em memória
  static final List<Map<String, String>> _users = [];

  // Cadastrar um novo usuário
  static bool register(String email, String password) {
    // Verifica se o usuário já existe
    final exists = _users.any((user) => user['email'] == email);
    if (exists) return false;

    _users.add({'email': email, 'password': password});
    return true;
  }

  // Verifica se o login é válido
  static bool login(String email, String password) {
    return _users.any(
      (user) => user['email'] == email && user['password'] == password,
    );
  }

  // Para fins de debug
  static void printUsers() {
    for (var user in _users) {
      print("Usuário: ${user['email']}");
    }
  }
}
