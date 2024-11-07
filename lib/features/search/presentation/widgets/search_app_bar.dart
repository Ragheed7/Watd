import 'package:flutter/material.dart';
import 'package:waie/core/theming/colors.dart';

class SearchAppBar extends StatefulWidget {
  const SearchAppBar({super.key});

  @override
  _SearchAppBarState createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose(); // Dispose of the FocusNode when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width / 1.75,
      child: TextField(
        focusNode: _focusNode, // Assign the FocusNode
        autofocus: false,      // Ensure autofocus is false
        style: TextStyle(
          fontSize: 16,
          letterSpacing: 0.5,
          wordSpacing: 1,
        ),
        cursorColor: ColorsManager.mainGreen,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.black12.withOpacity(0.05),
          hintText: 'Search',
          prefixIcon: Icon(
            Icons.search,
            color: ColorsManager.mainGreen,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
