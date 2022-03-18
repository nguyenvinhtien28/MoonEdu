import 'package:flutter/material.dart';

import 'indicator.dart';

Future<void> showLoadingDialog(
    BuildContext context, {
      IndicatorColor? indicatorColor,
    }) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Center(
          child: Indicator(
            radius: 20.0,
            color: indicatorColor ?? IndicatorColor.none,
          ),
        ),
      );
    },
  );
}

class LoadingWidget extends StatefulWidget {
  final bool isLoading;
  final Widget child;

  const LoadingWidget({
    required this.isLoading,
    required this.child,
  });

  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late bool _overlayVisible;

  @override
  void initState() {
    super.initState();
    _overlayVisible = false;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _animation.addStatusListener((status) {
      status == AnimationStatus.forward
          ? setState(() => {_overlayVisible = true})
          : null;
      status == AnimationStatus.dismissed
          ? setState(() => {_overlayVisible = false})
          : null;
    });
    if (widget.isLoading) {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final widgets = <Widget>[];
    widgets.add(widget.child);

    if (_overlayVisible == true) {
      final modal = FadeTransition(
        opacity: _animation,
        child: Stack(
          children: <Widget>[
            Opacity(
              child: ModalBarrier(
                dismissible: false,
                color: Colors.grey[800],
              ),
              opacity: 0.5,
            ),
            const Center(
              child: Indicator(
                radius: 20.0,
                color: IndicatorColor.white,
              ),
            ),
          ],
        ),
      );
      widgets.add(modal);
    }

    return Stack(children: widgets);
  }

  @override
  void didUpdateWidget(LoadingWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!oldWidget.isLoading && widget.isLoading) {
      _controller.forward();
    }

    if (oldWidget.isLoading && !widget.isLoading) {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
