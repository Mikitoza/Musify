import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}
///TODO:Need design this and think about theme
class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent),
      child: SafeArea(
        top: false,
        bottom: false,
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ColoredBox(
                color: Colors.black,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                  width: double.infinity,
                  child: const ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16),
                      topLeft: Radius.circular(16),
                    ),
                    child: Text('AAlasdair'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
