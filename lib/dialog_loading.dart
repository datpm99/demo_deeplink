import 'package:flutter/material.dart';

class DialogLoading extends StatelessWidget {
  const DialogLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      title: const Text('Loading Deeplink...'),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const[
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
