class Aluno {
  final String id;
  final String nome;
  final String email;
  final String telefone;
  final String latitude;
  final String longitude;

  Aluno({
    required this.id,
    required this.nome,
    required this.email,
    required this.telefone,
    required this.latitude,
    required this.longitude,
  });

  factory Aluno.fromJson(Map<String, dynamic> json) {
    return Aluno(
      id: json['id']?.toString() ?? '',
      nome: json['nome'] ?? '',
      email: json['email'] ?? '',
      telefone: json['telefone'] ?? '',
      latitude: json['latitude'] ?? '',
      longitude: json['longitude'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'telefone': telefone,
      'latitude': latitude,
      'longitude': longitude
    };
  }
}