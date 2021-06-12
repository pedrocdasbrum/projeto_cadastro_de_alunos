class Student {
  int? registration;
  String? name;
  String? email;

  Student({
    this.registration,
    this.name,
    this.email,
  });

  //De objeto para Map (mapa) - Usado para enviar ao banco de dados
  Map<String, dynamic> toMap() {
    return {
      'registration': this.registration,
      'name': this.name,
      'email': this.email,
    };
  }

  //De Map para objeto - Usado para buscar do banco de dados
  static Student toObjetic(Map<String, dynamic> data) {
    return Student(
      registration: data["registration"],
      name: data["name"],
      email: data["email"],
    );
  }
}
