import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OverlayWidget extends StatefulWidget {
  final Widget child;
  final Widget? loadingChild;
  final Widget? emptyChild;
  final VoidCallback? onRetry;
  final String? errorMessage;
  final bool loading;
  final bool error;
  final bool empty;

  const OverlayWidget({
    Key? key,
    this.loading = false,
    this.error = false,
    this.empty = false,
    required this.errorMessage,
    required this.child,
    this.loadingChild,
    this.emptyChild,
    this.onRetry,
  }) : super(key: key);

  @override
  _OverlayWidgetState createState() => _OverlayWidgetState();
}

class _OverlayWidgetState extends State<OverlayWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        Builder(
          builder: (BuildContext context) {
            if (widget.loading) {
              return Container(
                color: Colors.black.withAlpha(60),
                child: Center(
                  child: Builder(
                    builder: (BuildContext context) {
                      if (widget.loadingChild != null) {
                        return widget.loadingChild!;
                      } else {
                        if (Platform.isIOS) {
                          return const CupertinoActivityIndicator();
                        } else {
                          return const CircularProgressIndicator();
                        }
                      }
                    },
                  ),
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Builder(
            builder: (BuildContext context) {
              if (widget.error) {
                return Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          CupertinoIcons.exclamationmark_triangle,
                          color: Theme.of(context).primaryColor,
                          size: 32.0,
                        ),
                      ),
                      Text(widget.errorMessage ?? "Something went wrong"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OutlinedButton(
                          onPressed: widget.onRetry!,
                          child: const Text("Retry"),
                          // child: Text(""),
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Builder(
            builder: (BuildContext context) {
              if (widget.empty) {
                if (widget.emptyChild != null) {
                  return widget.emptyChild!;
                } else {
                  return Container(
                    color: Colors.white,
                    child: const Center(
                      child: Text("Empty"),
                    ),
                  );
                }
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      ],
    );
  }
}
