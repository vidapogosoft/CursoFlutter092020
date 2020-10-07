class Cliente {
  int id;
  String name;
  String phone;

  Cliente({this.id, this.name, this.phone});

//para insertar los datos en la bd, necesitamos convertirlos a map
  Map<String, dynamic> tomap() => {
        "id": id,
        "name": name,
        "phone": phone,
      };

  //Salidas de informacion pasarlos de Map a Json
  factory Cliente.fromMap(Map<String, dynamic> json) => new Cliente(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
      );
}
