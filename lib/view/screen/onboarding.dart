import 'package:ecommerce_app/controller/onboarding_controller.dart';
import 'package:ecommerce_app/view/widget/onboarding_widgets/custom_botton_onbaording.dart';
import 'package:ecommerce_app/view/widget/onboarding_widgets/custom_dotted.dart';
import 'package:ecommerce_app/view/widget/onboarding_widgets/onbaording_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  
  Widget build(BuildContext context) {
    Get.put(OnboardingControllerImpl());
    return  const Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          
          child: Column(
            children: [
              SizedBox(height: 15,),
              Expanded(flex: 3, child: OnboardingItem()),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      CustomDotted(),
                      Spacer(
                        flex: 2,
                      ),
                      CustomBottonOnbaording()
                    ],
                  ))
            ],
          ),
        ));
  }
}
