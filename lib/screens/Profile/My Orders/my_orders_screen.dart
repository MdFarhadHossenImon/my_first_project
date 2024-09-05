import 'package:flutter/material.dart';
import 'package:my_first_project/screens/Profile/My Orders/view_details.dart'; // Import the Order class from the correct file
import 'package:my_first_project/screens/Profile/My Orders/order_model.dart'; // Import the Order class

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  _MyOrdersScreenState createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  String _selectedStatus = 'All';

  final List<Order> _orders = [
    Order(
      orderId: 'ORD12345',
      date: 'August 10, 2024',
      total: '\$123.45',
      status: 'Delivered',
      itemsCount: 3,
    ),
    Order(
      orderId: 'ORD12346',
      date: 'August 12, 2024',
      total: '\$67.89',
      status: 'In Progress',
      itemsCount: 1,
    ),
    Order(
      orderId: 'ORD12345',
      date: 'August 16, 2024',
      total: '\$122.45',
      status: 'In Progress',
      itemsCount: 3,
    ),
    Order(
      orderId: 'ORD12345',
      date: 'August 10, 2024',
      total: '\$123.45',
      status: 'Delivered',
      itemsCount: 3,
    ),
    Order(
      orderId: 'ORD12345',
      date: 'August 10, 2024',
      total: '\$123.45',
      status: 'Cancelled',
      itemsCount: 3,
    ),
    Order(
      orderId: 'ORD12345',
      date: 'August 16, 2024',
      total: '\$122.45',
      status: 'In Progress',
      itemsCount: 3,
    ),
    // Add more orders as needed
  ];

  @override
  Widget build(BuildContext context) {
    // Filter orders based on the selected status
    final filteredOrders = _selectedStatus == 'All'
        ? _orders
        : _orders.where((order) => order.status == _selectedStatus).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.8),
        title: const Text('My Orders'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 29.0,
          fontWeight: FontWeight.w400,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white, size: 30.0),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Status Navigation Bar
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  StatusButton(
                    status: 'All',
                    isSelected: _selectedStatus == 'All',
                    onTap: () => _updateStatus('All'),
                  ),
                  StatusButton(
                    status: 'Delivered',
                    isSelected: _selectedStatus == 'Delivered',
                    onTap: () => _updateStatus('Delivered'),
                  ),
                  StatusButton(
                    status: 'In Progress',
                    isSelected: _selectedStatus == 'In Progress',
                    onTap: () => _updateStatus('In Progress'),
                  ),
                  StatusButton(
                    status: 'Cancelled',
                    isSelected: _selectedStatus == 'Cancelled',
                    onTap: () => _updateStatus('Cancelled'),
                  ),
                ],
              ),
            ),
            // Order Cards
            ...filteredOrders.map((order) => OrderCard(
              orderId: order.orderId,
              date: order.date,
              total: order.total,
              status: order.status,
              itemsCount: order.itemsCount,
            )),
          ],
        ),
      ),
    );
  }

  void _updateStatus(String status) {
    setState(() {
      _selectedStatus = status;
    });
  }
}

class StatusButton extends StatelessWidget {
  final String status;
  final bool isSelected;
  final VoidCallback onTap;

  const StatusButton({
    Key? key,
    required this.status,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        status,
        style: TextStyle(
          fontSize: 16,
          color: isSelected ? Colors.blue : Colors.black87,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final String orderId;
  final String date;
  final String total;
  final String status;
  final int itemsCount;

  const OrderCard({
    Key? key,
    required this.orderId,
    required this.date,
    required this.total,
    required this.status,
    required this.itemsCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white,
            Colors.grey.withOpacity(0.1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order ID and Date
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Order ID: $orderId',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                    overflow: TextOverflow.ellipsis, // Prevent overflow
                  ),
                ),
                Text(
                  date,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Total and Status
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Total: $total',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                    overflow: TextOverflow.ellipsis, // Prevent overflow
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    color: status == 'Delivered' ? Colors.green :
                    status == 'In Progress' ? Colors.orange : Colors.red,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    status,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Items Count
            Text(
              'Items: $itemsCount',
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
            // View Details Button
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderDetailsScreen(order: Order(
                        orderId: orderId,
                        date: date,
                        total: total,
                        status: status,
                        itemsCount: itemsCount,
                      )),
                    ),
                  );
                },
                child: const Text('View Details'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



