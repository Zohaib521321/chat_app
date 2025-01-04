class ApiProvider {
  Future<Map<String, dynamic>> getUserData(String id) async {
    // Mocked API response
    return {'id': id, 'name': 'John Doe', 'email': 'john.doe@example.com'};
  }
}
