Show Loading or error message in one widget.

```dart
import 'package:flutter/material.dart';
import 'package:overlay_view/overlay_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home View"),
      ),
      body: const OverlayWidget(
        loading: false,
        error: false,
        errorMessage: "",
        widget: Center(
          child: Text("Hello guys"),
        ),
      ),
    );
  }
}

```