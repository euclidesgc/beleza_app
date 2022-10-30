import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_manager/package_manager.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    Future.delayed(const Duration(seconds: 3)).then((_) {
      Modular.to.pushNamed('/home/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Center(
            child: CircularProgressIndicator(color: Colors.red),
          ),
        ],
      ),
    );
  }
}
