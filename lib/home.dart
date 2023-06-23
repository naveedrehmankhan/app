import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late InAppWebViewController webView;
  double _progess = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          toolbarHeight: 10,
          backgroundColor: Color.fromARGB(255, 1, 24, 49)),
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest:
                URLRequest(url: Uri.parse("https://chat.openai.com")),
            onWebViewCreated: (InAppWebViewController controller) {
              webView = controller;
            },
            onLoadStart: (controller, url) {},
            onProgressChanged:
                (InAppWebViewController controller, int progress) {
              setState(() {
                _progess = progress / 100;
              });
            },
          ),
          _progess < 1
              ? SizedBox(
                  height: 3,
                  child: LinearProgressIndicator(
                    value: _progess,
                    backgroundColor: Colors.orange.withOpacity(0.2),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
