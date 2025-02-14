import 'package:flutter/material.dart';
import 'package:movies_app/theme/app_image.dart';
import 'package:movies_app/theme/app_style.dart';

import '../../../theme/app_colors.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/cutom_button.dart';
import '../../widgets/language_toggle_switch.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'login_screen';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image(
                image: AssetImage(AppImage.logo),
              ),
              CustomTextField(
                hintText: "Email",
                icon: Icons.email,
              ),
              const SizedBox(
                height: 22,
              ),
              CustomTextField(
                hintText: "Password",
                icon: Icons.lock,
                isPassword: true,
              ),
              const SizedBox(
                height: 16,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forget Password?",
                    style: AppStyle.regular14Yellow,
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              CustomButton(
                text: "Login",
                color: AppColors.yellowColor,
                onPressed: () {
                  // Login action
                },
              ),
              SizedBox(
                height: 22,
              ),
              InkWell(
                onTap: () {
                },
                child: Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Don’t Have Account?",
                        style: AppStyle.regular14White,
                      ),
                      TextSpan(
                          text: " Create One",
                          style: AppStyle.bold14Yellow,
                         ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      endIndent: 20,
                      indent: 20,
                      thickness: 2,
                      color: AppColors.yellowColor,
                    ),
                  ),
                  Text(
                    "OR",
                    textAlign: TextAlign.center,
                    style: AppStyle.regular14Yellow,

                  ),
                  Expanded(
                    child: Divider(
                      endIndent: 20,
                      indent: 20,
                      thickness: 2,
                      color: AppColors.yellowColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              CustomButton(
                text: "Login With Google",
                color: AppColors.yellowColor,
                assetImage: AppImage.google_icon,
                isLeading: true,
                onPressed: () {},
              ),
              SizedBox(
                height: 24,
              ),
              LanguageToggleSwitch(
                onToggle: (isEnglish) {
                  print(isEnglish ? "English Selected" : "Arabic Selected");
                },
              ),
              SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
