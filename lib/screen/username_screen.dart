import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/shared_preference.dart';
import '../routes/route_name.dart';
import '../widgets/common_widget.dart';

class UserNameScreen extends ConsumerStatefulWidget {
  const UserNameScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UserNameScreenState createState() => _UserNameScreenState();
}

class _UserNameScreenState extends ConsumerState<UserNameScreen> {
  TextEditingController userNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              inputTextField(
                controller: userNameController,
                hintTxt: "Username",
                textClr: Colors.black,
              ),
              const SizedBox(
                height: 25,
              ),
              textBtn(
                height: 55,
                width: 330,
                color: Colors.white,
                bgClr: const Color(0xFFea1580),
                radius: 12,
                text: "SIGN IN",
                function: () {
                  if (_formKey.currentState!.validate()) {
                    Future.delayed(
                      const Duration(seconds: 3),
                      () {
                        final sharedPreferences =
                            ref.read(sharedUtilityProvider);
                        sharedPreferences.setUsername(userNameController.text);
                        sharedPreferences.setHome(true);
                        Navigator.pushNamed(
                          context,
                          RouteName.homeScreen,
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
