import 'package:deeplink_google_firebase/home_view.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'dialog_loading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainView(),
    );
  }
}

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  void initDynamicLinks() async {
    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData? dynamicLink) async {
      final Uri? deepLink = dynamicLink?.link;

      if (deepLink != null) {
        print('DeepLink: ${deepLink.path} ');
        showDialogLoading();
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.pop(context);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomeView()));
        });
      }
    }, onError: (OnLinkErrorException e) async {
      print('onLinkError');
      print(e.message);
    });
  }

  void showDialogLoading() {
    showDialog(
      context: context,
      builder: (context) => const DialogLoading(),
    );
  }

  @override
  void initState() {
    super.initState();
    initDynamicLinks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DeepLink GG Firebase')),
      body: const Center(
        child: Text('This is Main View', style: TextStyle(fontSize: 40)),
      ),
    );
  }
}
