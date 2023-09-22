class Modal {
  Modal({
    this.id,
    this.name,
  });

  String? id;
  String? name;

  factory Modal.fromMap(Map<String, dynamic> json) => Modal(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
  };
}
