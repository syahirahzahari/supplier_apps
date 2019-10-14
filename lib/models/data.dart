
class Data {
  int id;
  String brand;
  String price;
  String qty;
  String CreatedAt;
  String UpdatedAt;
  String DeletedAt;

  User(int id, String brand, String price, String qty, String CreatedAt,
      String UpdatedAt, String DeletedAt) {
    this.id = id;
    this.brand = brand;
    this.qty = qty;
    this.CreatedAt = CreatedAt;
    this.UpdatedAt = UpdatedAt;
    this.DeletedAt = DeletedAt;
  }

  Data.fromJson(Map json)
      : id = json['id'],
        brand = json['brand'],
        qty = json['qty'],
        CreatedAt = json['CreatedAt'],
        UpdatedAt = json['UpdatedAt'],
        DeletedAt = json['DeletedAt'];

  Map toJson() {
    return {'id': id, 'brand': brand, 'qty': qty,
            'CreatedAt' : CreatedAt, 'UpdatedAt' : UpdatedAt,
            'DeletedAt' : DeletedAt};
  }
}