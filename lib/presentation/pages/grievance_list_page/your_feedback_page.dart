import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grievance_portal/gen/fonts.gen.dart';
import 'package:grievance_portal/presentation/widgets/common_appbar.dart';

class YourFeedBackPage extends StatelessWidget {
  const YourFeedBackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(title: "Send_us_your_feedback".tr),
      body: Column(
        children: [
          Opacity(
            opacity: 0.6,
            child: Text(
              "are_you_satisfied".tr,
              style: const TextStyle(
                  fontFamily: FontFamily.urbanistMedium, fontSize: 16),
            ),
          ),
          RadioListTile(
            value: "1",
            groupValue: "satisfied",
            onChanged: (value) {},
            title: const Text("Yes"),
          ),
          RadioListTile(
            value: "2",
            groupValue: "satisfied",
            onChanged: (value) {},
            title: const Text("No"),
          )
        ],
      ),
    );
  }
}
