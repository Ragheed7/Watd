import 'package:flutter/material.dart';
import 'package:waie/core/theming/colors.dart';
import 'package:waie/features/home/presentation/widgets/order_success_screen.dart';
import 'package:waie/features/account/presentation/widgets/user_info/presentation/widgets/user_info_text_form_field.dart';

class SellScreen extends StatefulWidget {
  @override
  _SellScreenState createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  final List<String> imageList = [
    "assets/images/img1.jpg",
    "assets/images/img2.jpg",
    "assets/images/img3.jpg",
    "assets/images/img4.jpg",
  ];

  final _formKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Sell"),
        centerTitle: true,
        backgroundColor: Colors.white,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(),
                  SizedBox(height: 10),
                  UserInfoTextFormField(
                    controller: titleController,
                    labelText: "Title",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter title';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 18),
                        Container(
                          height: 130,
                          child: ListView.builder(
                            itemCount: imageList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                width: 130,
                                margin: EdgeInsets.only(right: 10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    imageList[index],
                                    fit: BoxFit.cover,
                                    height: 130,
                                    width: 130,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Usage period',
                      filled: true,
                      fillColor: const Color(0xFFF5F5F5),
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            const BorderSide(width: 1, color: Colors.grey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            const BorderSide(width: 1, color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                            width: 1, color: ColorsManager.mainGreen),
                      ),
                      contentPadding: const EdgeInsets.all(10),
                    ),
                    items: [
                      DropdownMenuItem(
                          value: '1 month', child: Text('1 month')),
                      DropdownMenuItem(
                          value: '6 months', child: Text('6 months')),
                      DropdownMenuItem(value: '1 year', child: Text('1 year')),
                      DropdownMenuItem(value: '2 year', child: Text('2 year')),
                      DropdownMenuItem(value: '3 year', child: Text('3 year')),
                    ],
                    onChanged: (value) {},
                  ),
                  SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Category',
                      filled: true,
                      fillColor: const Color(0xFFF5F5F5),
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            const BorderSide(width: 1, color: Colors.grey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            const BorderSide(width: 1, color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                            width: 1, color: ColorsManager.mainGreen),
                      ),
                      contentPadding: const EdgeInsets.all(10),
                    ),
                    items: [
                      DropdownMenuItem(
                          value: 'Living Room', child: Text('Living Room')),
                      DropdownMenuItem(value: 'Office', child: Text('Office')),
                      DropdownMenuItem(
                          value: 'Bedroom', child: Text('Bedroom')),
                      DropdownMenuItem(
                          value: 'Dining Room', child: Text('Dining Room')),
                      DropdownMenuItem(
                          value: 'Lighting', child: Text('Lighting')),
                      DropdownMenuItem(
                          value: 'Kids Furniture',
                          child: Text('Kids Furniture')),
                    ],
                    onChanged: (value) {},
                  ),
                  SizedBox(height: 16),
                  UserInfoTextFormField(
                    controller: descriptionController,
                    labelText: "Description",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter description';
                      }
                      return null;
                    },
                    maxLines: 5,
                  ),
                  SizedBox(height: 15),
                  Center(
                    child: MaterialButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OrderSuccessScreen(),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Please fill all fields')),
                          );
                        }
                      },
                      color: Color.fromRGBO(118, 192, 67, 1),
                      padding:
                          EdgeInsets.symmetric(horizontal: 90, vertical: 16),
                      child: Text(
                        'Submit Request',
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
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
