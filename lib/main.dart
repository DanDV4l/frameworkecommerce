import 'package:ecommerce/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initialize = Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    return FutureBuilder<FirebaseApp>(
      future: _initialize,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            color: Colors.black,
            child: const Center(
                child: CircularProgressIndicator(color: Colors.white)),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return const AppWidget();
        }
        return const SizedBox();
      },
    );
  }
}
