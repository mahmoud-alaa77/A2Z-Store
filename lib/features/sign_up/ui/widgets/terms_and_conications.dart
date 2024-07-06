


import 'package:flutter/material.dart';
import 'package:online_store/core/theming/app_colors.dart';

class TermsAndCondications extends StatefulWidget {
  const TermsAndCondications({
    super.key,
  });

  @override
  State<TermsAndCondications> createState() => _TermsAndCondicationsState();
}

class _TermsAndCondicationsState extends State<TermsAndCondications> {
  bool isAgree = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Checkbox(
            value: isAgree,
            onChanged: (value) {
              setState(() {
                isAgree = !isAgree;
              });
            },
            checkColor: Colors.white,
            activeColor:AppColors.darkGray ,
            ),
       const Text(
            "By creating an account you have to agree\nwith our terms & condications .")
      ],
    );
  }
}
