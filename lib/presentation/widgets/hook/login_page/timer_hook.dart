import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

///
/// [endTime] : seconds
///
Timer useTimer(int endTime) {
  return use(_Timer(endTime));
}

class _Timer extends Hook<Timer> {
  const _Timer(this.endTime);

  final int endTime;

  @override
  __InfiniteTimerState createState() => __InfiniteTimerState();
}

class __InfiniteTimerState extends HookState<Timer, _Timer> {
  late Timer _timer;

  @override
  void initHook() {
    super.initHook();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timer.tick > hook.endTime){
        return _timer.cancel();
      }
      if(_timer.isActive){
        setState(() {});
      }
    });
  }

  @override
  void didUpdateHook(_Timer oldHook) {
    if(oldHook.endTime != hook.endTime){
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (timer.tick > hook.endTime){
          return _timer.cancel();
        }
        // setState(() {});
      });
    }
    super.didUpdateHook(oldHook);
  }
  @override
  Timer build(BuildContext context) {
    return _timer;
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
