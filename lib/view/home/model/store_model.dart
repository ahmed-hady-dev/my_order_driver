class StoreModel {
  final String storeName;
  final String description;
  final String storeImage;
  final String state;
  final double totalPrice;
  final double subTotalPrice;
  final double deliveryFees;
  final String payment;
  final String notes;

  StoreModel({
    required this.storeName,
    required this.description,
    required this.storeImage,
    required this.state,
    required this.totalPrice,
    required this.subTotalPrice,
    required this.deliveryFees,
    required this.payment,
    required this.notes,
  });
}

List<StoreModel> storeModelList = [
  StoreModel(
    storeName: 'Pizza Store',
    description: 'pizza',
    storeImage:
        'http://www.inoutdesigners.com/talabat/public/upload/item/1635358717software.jpg',
    state: 'Pending',
    totalPrice: 369,
    subTotalPrice: 354,
    deliveryFees: 15,
    payment: 'cash',
    notes: 'Don\'t Call',
  ),
  StoreModel(
    storeName: 'Pizza Store',
    description: 'pizza',
    storeImage:
        'http://www.inoutdesigners.com/talabat/public/upload/item/1635358717software.jpg',
    state: 'Pending',
    totalPrice: 369,
    subTotalPrice: 354,
    deliveryFees: 15,
    payment: 'cash',
    notes: 'Don\'t Call',
  ),
  StoreModel(
    storeName: 'Pizza Store',
    description: 'pizza',
    storeImage:
        'http://www.inoutdesigners.com/talabat/public/upload/item/1635358717software.jpg',
    state: 'Pending',
    totalPrice: 369,
    subTotalPrice: 354,
    deliveryFees: 15,
    payment: 'cash',
    notes: 'Don\'t Call',
  ),
  StoreModel(
    storeName: 'Pizza Store',
    description: 'pizza',
    storeImage:
        'http://www.inoutdesigners.com/talabat/public/upload/item/1635358717software.jpg',
    state: 'Pending',
    totalPrice: 369,
    subTotalPrice: 354,
    deliveryFees: 15,
    payment: 'cash',
    notes: 'Don\'t Call',
  ),
];
