import 'package:flutter/material.dart';

class TrackOrderDetailsScreen extends StatelessWidget {
  const TrackOrderDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Track order details"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(),
            SizedBox(height: 6),
            Text(
              'Track order details',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 23),
            Text(
              'Order number',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '456123567',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Shipping history',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(),
            SizedBox(height: 16),
            _buildOrderStatusRow('Order date:', '21/08/2024'),
            _buildOrderStatusRow('Estimated delivery date:', '21/08/2024'),
            Divider(),
            SizedBox(height: 16),
            _buildShippingStatus('Bought', '21/08/2024'),
            _buildShippingStatus('Being prepared', '22/08/2024'),
            _buildShippingStatus('Sent', '23/08/2024'),
            _buildShippingStatus('Collected by courier', '23/08/2024'),
            _buildShippingStatus('Delivered', ''),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderStatusRow(String title, String date) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        Text(
          date,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildShippingStatus(String status, String date) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            status,
            style: TextStyle(fontSize: 16),
          ),
          Text(
            date,
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
