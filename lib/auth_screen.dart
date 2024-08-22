import 'package:charachter_login/constants.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:rive/rive.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late StateMachineController? stateMachineController;

  SMIInput<bool>? isChecking;
  SMIInput<bool>? isHandsUp;
  SMIInput<bool>? trigSuccess;
  SMIInput<bool>? trigFail;
  SMINumber? numLook;
  void isCheckField() {
    isHandsUp?.change(false);
    isChecking?.change(true);
    numLook?.change(0);
  }

  void hidePassword() {
    isHandsUp?.change(true);
  }

  void moveEyeBall(String value) {
    double move = value.length.toDouble() * 2;
    numLook?.change(move);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.1,
                  ),
                  Container(
                      height: width * 0.75,
                      width: width * 0.75,
                      //color: Colors.red,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Constants.primary,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(width),
                        child: RiveAnimation.asset(
                          "assets/rive/animated_login_character.riv",
                          fit: BoxFit.fitHeight,
                          stateMachines: const ["Login Machine"],
                          onInit: (artboard) {
                            stateMachineController =
                                StateMachineController.fromArtboard(
                                    artboard, "Login Machine");
                            if (stateMachineController == null) return;
                            artboard.addController(stateMachineController!);
                            isChecking =
                                stateMachineController!.findInput("isChecking");
                            isHandsUp =
                                stateMachineController?.findInput("isHandsUp");
                            trigSuccess = stateMachineController
                                ?.findInput("trigSuccess");
                            trigFail =
                                stateMachineController?.findInput("trigFail");
                            numLook =
                                stateMachineController?.findSMI("numLook");
                          },
                        ),
                      )),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    onTap: isCheckField,
                    onChanged: moveEyeBall,
                    controller: usernameController,
                    validator: Constants.tfValidator,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.profile_circle),
                        labelText: "Username"),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    onTap: hidePassword,
                    controller: passwordController,
                    validator: Constants.tfValidator,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Iconsax.lock,
                        ),
                        labelText: "Password"),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        bool valid = formKey.currentState!.validate();
                        if (valid) {
                          isChecking!.change(false);
                          isHandsUp!.change(false);
                          trigFail!.change(false);
                          trigSuccess!.change(true); // for success
                          isChecking!.change(false);
                        } else {
                          isChecking!.change(false);
                          isHandsUp!.change(false);
                          trigFail!.change(true); // for unsuccess
                          trigSuccess!.change(false);
                          isChecking!.change(false);
                        }
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
