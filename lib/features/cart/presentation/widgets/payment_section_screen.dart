import 'package:flutter/material.dart';
import 'package:waie/core/local_models/payment_model/payment_card.dart';
import 'package:waie/core/theming/colors.dart';

class PaymentSectionScreen extends StatefulWidget {
  final PaymentCard paymentCard;
  final Function(String cvv) onCvvChanged; 

  const PaymentSectionScreen({
    Key? key,
    required this.paymentCard,
    required this.onCvvChanged,
  }) : super(key: key);

  @override
  _PaymentSectionScreenState createState() => _PaymentSectionScreenState();
}

class _PaymentSectionScreenState extends State<PaymentSectionScreen> {
  final TextEditingController _cvvController = TextEditingController();
  final FocusNode _cvvFocusNode = FocusNode();
  String? _cvvError;

  @override
  void initState() {
    super.initState();
    _cvvController.addListener(_onCvvChanged);
  }

  @override
  void dispose() {
    _cvvController.removeListener(_onCvvChanged);
    _cvvController.dispose();
    _cvvFocusNode.dispose();
    super.dispose();
  }

  void _onCvvChanged() {
    final cvv = _cvvController.text;
    if (cvv.length > 4) {
      setState(() {
        _cvvError = "CVV can't exceed 3 digits";
      });
    } else if (cvv.length < 3) {
      setState(() {
        _cvvError = "CVV must be at exactly 3 digits";
      });
    } else {
      setState(() {
        _cvvError = null;
      });
    }
    widget.onCvvChanged(cvv);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Card Number: ${widget.paymentCard.maskedCardNumber}",
            style: TextStyle(fontSize: 16),
          ),
          Text(
            "Card Holder: ${widget.paymentCard.cardHolderName}",
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 4),
          Text(
            "Expiry: ${widget.paymentCard.expiryMonth.toString().padLeft(2, '0')}/${widget.paymentCard.expiryYear}",
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 16),
          // CVV Input Field
          TextField(
            controller: _cvvController,
            focusNode: _cvvFocusNode,
            keyboardType: TextInputType.number,
            obscureText: true, 
            decoration: InputDecoration(
              prefixIcon: Padding(padding: EdgeInsets.only(left: 8), child: Icon(Icons.payment, size: 30,)),
              labelText: "CVV",
              hintText: "Enter CVV",
              errorText: _cvvError,
              border: OutlineInputBorder(),
            ),
            maxLength: 3, // CVV is 3 digits
          ),
        ],
      ),
    );
  }
}
