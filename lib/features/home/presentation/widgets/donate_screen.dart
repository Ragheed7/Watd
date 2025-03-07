import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:watd/core/helpers/constants.dart';
import 'package:watd/core/helpers/error_dialog.dart';
import 'package:watd/core/networking/api_error_handler.dart';
import 'package:watd/core/networking/api_error_model.dart';
import 'package:watd/core/theming/colors.dart';
import 'package:watd/features/account/presentation/widgets/user_info/presentation/widgets/user_info_text_form_field.dart';
import 'package:watd/features/home/data/model/services/create_service_request.dart';
import 'package:watd/features/home/logic/cubit/create_service_cubit.dart';
import 'package:watd/features/home/logic/cubit/create_service_state.dart';
import 'package:watd/features/home/presentation/widgets/order_success_screen.dart';
import 'package:image/image.dart' as img;

class DonateScreen extends StatefulWidget {
  @override
  _DonateScreenState createState() => _DonateScreenState();
}

class _DonateScreenState extends State<DonateScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController descriptionController = TextEditingController();

  List<File> selectedImages = [];
  ApiErrorModel apiErrorModel = DataSource.DEFAULT.getFailure();
  ValueNotifier<bool> isFormValid = ValueNotifier(false);

  @override
  void initState() {
    super.initState();

    // Add listener to validate the form dynamically
    descriptionController.addListener(validateForm);
  }

  @override
  void dispose() {
    descriptionController.removeListener(validateForm);
    descriptionController.dispose();
    super.dispose();
  }

  void validateForm() {
    bool isValid = descriptionController.text.isNotEmpty &&
        selectedImages.isNotEmpty;
    isFormValid.value = isValid;
  }

  Future<void> pickImages() async {
    final ImagePicker _picker = ImagePicker();
    try {
      final List<XFile>? pickedFiles = await _picker.pickMultiImage();
      if (pickedFiles != null && pickedFiles.isNotEmpty) {
        setState(() {
          selectedImages = pickedFiles.map((e) => File(e.path)).toList();
          validateForm(); // Revalidate form when images are added
        });
      }
    } catch (e) {
      print('Error picking images: $e');
    }
  }

  Future<String> compressAndEncodeImage(File file) async {
    try {
      final bytes = await file.readAsBytes();
      img.Image? image = img.decodeImage(bytes);
      if (image == null) return '';

      img.Image resized = img.copyResize(image, width: 800);
      Uint8List compressed =
          Uint8List.fromList(img.encodeJpg(resized, quality: 70));
      return base64Encode(compressed);
    } catch (e) {
      print('Error compressing image: $e');
      return '';
    }
  }

  void submitRequest(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      if (selectedImages.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please upload at least one image')),
        );
        return;
      }

      List<String> imagesString64 = [];
      for (var imageFile in selectedImages) {
        String base64Image = await compressAndEncodeImage(imageFile);
        if (base64Image.isNotEmpty) {
          imagesString64.add(base64Image);
        }
      }

      CreateServiceRequest request = CreateServiceRequest(
        requestType: RequestType.Donate,
        productDetails: descriptionController.text,
        requestedPrice: 0,
        purchasePrice: 0,
        imagesString64: imagesString64,
      );

      context.read<CreateServiceCubit>().submitCreateService(request);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateServiceCubit, CreateServiceState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Failure,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const Center(
                child: CircularProgressIndicator(color: ColorsManager.mainGreen,),
              ),
            );
          },
          success: (data) {
            Navigator.of(context).pop(); // Close the loading dialog
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OrderSuccessScreen(),
              ),
            );
          },
          failure: (error) {
            Navigator.of(context).pop(); // Close the loading dialog
            showErrorDialog(context, apiErrorModel.message ?? "");
          },
        );
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Donate"),
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
                    // Image upload section
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      width: MediaQuery.of(context).size.width,
                      height: 150,
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
                        children: [
                          SizedBox(height: 18),
                          Expanded(
                            child: ListView.builder(
                              itemCount: selectedImages.length + 1,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                if (index == selectedImages.length) {
                                  return GestureDetector(
                                    onTap: pickImages,
                                    child: Container(
                                      width: 100,
                                      margin: EdgeInsets.only(
                                          right: 10, bottom: 18),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Icon(
                                        Icons.add_a_photo,
                                        size: 50,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                  );
                                } else {
                                  return Stack(
                                    children: [
                                      Container(
                                        width: 100,
                                        margin: EdgeInsets.only(right: 10),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.file(
                                            selectedImages[index],
                                            fit: BoxFit.cover,
                                            height: 114,
                                            width: 120,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 5,
                                        right: 15,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              selectedImages.removeAt(index);
                                              validateForm(); // Revalidate form when removing images
                                            });
                                          },
                                          child: CircleAvatar(
                                            radius: 12,
                                            backgroundColor: Colors.red,
                                            child: Icon(
                                              Icons.close,
                                              size: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    UserInfoTextFormField(
                      controller: descriptionController,
                      labelText: "Description",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a description';
                        }
                        final words = value.trim().split(RegExp(r'\s+'));
                        if (words.length < 10) {
                          return 'Description must be at least 10 words long';
                        }
                        return null;
                      },
                      maxLines: 5,
                    ),
                    SizedBox(height: 100),
                    ValueListenableBuilder<bool>(
                      valueListenable: isFormValid,
                      builder: (context, isValid, child) {
                        return Center(
                          child: MaterialButton(
                            onPressed: isValid
                                ? () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          backgroundColor: Colors.white,
                                          title: Text("Confirm Submission"),
                                          content: Text(
                                              "Are you sure you want to submit this request?"),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text("Cancel",
                                                  style: TextStyle(
                                                      color: Colors.red)),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                submitRequest(context);
                                              },
                                              child: Text(
                                                "Confirm",
                                                style: TextStyle(
                                                    color: ColorsManager
                                                        .mainGreen),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                : null,
                            color: isValid
                                ? ColorsManager.mainGreen
                                : Colors.grey,
                            disabledColor: Colors.grey,
                            padding: EdgeInsets.symmetric(
                                horizontal: 90, vertical: 16),
                            child: Text(
                              'Submit Request',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'cabin',
                                fontSize: 18,
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
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

