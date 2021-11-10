class OrdersModel {
  final String itemName;
  final String itemImage;
  final String description;
  final double price;

  OrdersModel({
    required this.description,
    required this.itemName,
    required this.itemImage,
    required this.price,
  });
}

List<OrdersModel> ordersModelList = [
  OrdersModel(
    itemName: 'Pizza Runch',
    description: 'Pizza',
    itemImage:
        'http://www.inoutdesigners.com/talabat/public/upload/item/1635358717software.jpg',
    price: 30.0,
  ),
  OrdersModel(
    itemName: 'Pizza Runch',
    description: 'Pizza',
    itemImage:
        'http://www.inoutdesigners.com/talabat/public/upload/item/1635358717software.jpg',
    price: 30.0,
  ),
  OrdersModel(
    itemName: 'Pizza Runch',
    description: 'Pizza',
    itemImage:
        'http://www.inoutdesigners.com/talabat/public/upload/item/1635358717software.jpg',
    price: 30.0,
  ),
];
