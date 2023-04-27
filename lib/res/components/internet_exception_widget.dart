import 'package:flutter/material.dart';
import 'package:getx_mvvm/res/colors/color.dart';
import 'package:getx_mvvm/res/components/round_button.dart';

class InternetExceptionWidget extends StatelessWidget {
  final VoidCallback onPress;

  const InternetExceptionWidget({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: height * .15),
          Icon(Icons.cloud_off, size: 50, color: AppColors.alertColor),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Center(child: Text('No Internet')),
          ),
          SizedBox(height: height * .15),
          RoundButton(
            title: 'Retry',
            onPress: onPress,
          )
        ],
      ),
    );
  }
}
