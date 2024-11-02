import 'package:flutter/material.dart';
import 'package:waie/core/helpers/spacing.dart';
import 'package:waie/core/theming/colors.dart';

class AccountHeaderWidget extends StatelessWidget {
  final String accountName;
  final String phoneNumber;

  const AccountHeaderWidget({
    super.key,
    required this.accountName,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.grey[300],
            child: Icon(
              Icons.person,
              size: 50,
              color: ColorsManager.grey,
            ),
          ),
          verticalSpace(8),
          Text(
            accountName,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            phoneNumber,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
