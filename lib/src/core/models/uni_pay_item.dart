import '../../utils/uni_enums.dart';

class UniPayItem {
  ///* Item id
  late String id;

  ///* Item name
  late String name;

  ///* Item quantity
  late int quantity;

  ///* Item price including tax and vat
  late num price;

  ///* Item SKU
  late String sku;

  ///* Item Type

  late UniPayItemType itemType;

  ///* All items total price
  num get totalPrice => price * quantity;

  UniPayItem({
    required this.id,
    required this.name,
    required this.quantity,
    required this.price,
    String? sku,
    this.itemType = UniPayItemType.product,
  }) : sku = sku ?? id;

  UniPayItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    quantity = json['quantity'];
    price = json['price'];
    sku = json['sku'];
    itemType = UniPayItemType.values[json['itemType']];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['quantity'] = quantity;
    data['price'] = price;
    data['sku'] = sku;
    data['itemType'] = itemType.index;
    return data;
  }
}
