
class Order {
  final String orderId;
  final String date;
  final String total;
  final String status;
  final int itemsCount;

  Order({
    required this.orderId,
    required this.date,
    required this.total,
    required this.status,
    required this.itemsCount,
  });
}
