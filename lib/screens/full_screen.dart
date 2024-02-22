import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FullScreen extends StatelessWidget {
  const FullScreen({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    final WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.disabled)
      ..loadRequest(
        Uri.parse(url),
      );

    return Scaffold(
      body: SafeArea(
        child: WebViewWidget(controller: controller),
      ),
    );
  }
}
