enum Role {
  user("USER"),
  manager("MANAGER"),
  employee("EMPLOYEE");

  const Role(this.label);

  final String label;

  factory Role.fromMap(String role) {
    return Role.values.where((el) => el.label == role).first;
  }

  toMap(){
    return label;
  }
}
