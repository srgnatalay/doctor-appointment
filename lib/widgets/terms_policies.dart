import 'package:flutter/material.dart';

import '../utils/config.dart';
import '../utils/text.dart';

class TermsAndPoliciesText extends StatelessWidget {
  const TermsAndPoliciesText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 40,
          width: 121,
          child: TextButton(
            onPressed: () {},
            child: Text(
              AppText.enText["terms_conditions"]!,
              style: Config.termsPoliciesStyle(),
            ),
          ),
        ),
        Text(
          "'nı ve",
          style: Config.infoTextStyle(),
        ),
        SizedBox(
          height: 40,
          width: 128,
          child: TextButton(
            onPressed: () {},
            child: Text(
              AppText.enText["privacy_policy"]!,
              style: Config.termsPoliciesStyle(),
            ),
          ),
        ),
        Text(
          "'nı",
          style: Config.infoTextStyle(),
        ),
      ],
    );
  }
}
