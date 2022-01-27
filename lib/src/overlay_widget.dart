import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OverlayWidget extends StatefulWidget {
  final Widget widget;
  final bool loading;
  final bool error;
  final String errorMessage;

  const OverlayWidget({
    Key? key,
    required this.loading,
    required this.error,
    required this.errorMessage,
    required this.widget,
  }) : super(key: key);

  @override
  _OverlayWidgetState createState() => _OverlayWidgetState();
}

class _OverlayWidgetState extends State<OverlayWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.widget,
        Builder(
          builder: (BuildContext context) {
            if (widget.loading) {
              return Container(
                color: Colors.black.withAlpha(60),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    child: Platform.isIOS
                        ? const CupertinoActivityIndicator()
                        : const CircularProgressIndicator(),
                  ),
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}