import 'package:flutter/material.dart';
import 'package:watd/core/local_models/payment_model/payment_card.dart';
import 'package:watd/core/local_models/payment_model/payment_card_manager.dart';
import 'package:watd/core/theming/colors.dart';
import 'package:watd/features/account/presentation/widgets/card_number_input_formatter.dart';
import 'package:watd/features/account/presentation/widgets/user_info/presentation/widgets/user_info_text_form_field.dart';

class AddNewPaymentScreen extends StatefulWidget {
  final String userId; // Select payment cards for a specific user

  const AddNewPaymentScreen({super.key, required this.userId});

  @override
  _AddNewPaymentScreenState createState() => _AddNewPaymentScreenState();
}

class _AddNewPaymentScreenState extends State<AddNewPaymentScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cardHolderNameController =
      TextEditingController();
  final TextEditingController expiryMonthController = TextEditingController();
  final TextEditingController expiryYearController = TextEditingController();

  ValueNotifier<bool> isFormValid = ValueNotifier(false);

  @override
  void initState() {
    super.initState();

    // Add listeners to validate the form dynamically
    cardNumberController.addListener(validateForm);
    cardHolderNameController.addListener(validateForm);
    expiryMonthController.addListener(validateForm);
    expiryYearController.addListener(validateForm);
  }

  @override
  void dispose() {
    cardNumberController.removeListener(validateForm);
    cardHolderNameController.removeListener(validateForm);
    expiryMonthController.removeListener(validateForm);
    expiryYearController.removeListener(validateForm);

    cardNumberController.dispose();
    cardHolderNameController.dispose();
    expiryMonthController.dispose();
    expiryYearController.dispose();
    super.dispose();
  }

  void validateForm() {
    bool isValid = _formKey.currentState?.validate() ?? false;
    isFormValid.value = isValid;
  }

  void _confirmDetails() async {
    if (_formKey.currentState!.validate()) {
      PaymentCard newCard = PaymentCard(
        cardNumber: cardNumberController.text,
        cardHolderName: cardHolderNameController.text,
        expiryMonth: int.parse(expiryMonthController.text),
        expiryYear: int.parse(expiryYearController.text),
      );
      await PaymentCardManager().addPaymentCard(newCard, widget.userId);
      Navigator.pop(context, true);
    }
  }

  String? _validateCardNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter card number';
    }

    // Remove any non-digit characters before validation
    String digitsOnly = value.replaceAll(RegExp(r'\D'), '');
    if (digitsOnly.length != 16) {
      return 'Card number must be 16 digits';
    }
    return null;
  }

  String? _validateCardHolderName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter name on card';
    }
    final words = value.trim().split(RegExp(r'\s+'));
    if (words.length < 2) {
      return 'Holder name must be at least 2 words long';
    }
    return null;
  }

  String? _validateExpiryMonth(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter expiry month';
    }
    int? month = int.tryParse(value);
    if (month == null || month < 1 || month > 12) {
      return 'Invalid month';
    }
    return null;
  }

  String? _validateExpiryYear(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter expiry year';
    }
    int? year = int.tryParse(value);
    int currentYear = DateTime.now().year;
    if (year == null || value.length != 4) {
      return 'Please enter a valid four-digit year';
    }
    if (year < currentYear || year > currentYear + 10) {
      return 'Invalid year';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Add new payment"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Divider(),
                  SizedBox(height: 40),
                  UserInfoTextFormField(
                    controller: cardNumberController,
                    labelText: "Card number",
                    validator: _validateCardNumber,
                    keyboardType: TextInputType.number,
                    inputFormatters: [CardNumberInputFormatter()],
                  ),
                  SizedBox(height: 20),
                  UserInfoTextFormField(
                    controller: cardHolderNameController,
                    labelText: "Name on card",
                    validator: _validateCardHolderName,
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: UserInfoTextFormField(
                          controller: expiryMonthController,
                          labelText: "Expiry month",
                          validator: _validateExpiryMonth,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: UserInfoTextFormField(
                          controller: expiryYearController,
                          labelText: "Expiry year",
                          validator: _validateExpiryYear,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 100),
                  ValueListenableBuilder<bool>(
                    valueListenable: isFormValid,
                    builder: (context, isValid, child) {
                      return Center(
                        child: MaterialButton(
                          onPressed: isValid ? _confirmDetails : null,
                          color: isValid
                              ? ColorsManager.mainGreen
                              : Colors.grey,
                          disabledColor: Colors.grey,
                          padding:
                              EdgeInsets.symmetric(horizontal: 90, vertical: 16),
                          child: Text(
                            'Confirm details',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'cabin',
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
