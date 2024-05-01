import 'package:flutter_riverpod/flutter_riverpod.dart';

final ControllerProvider = StateNotifierProvider<Controller,int>((ref){
  return Controller(0);
});
class Controller extends StateNotifier<int>{
  Controller(super.state);

  void setPosition(int value){
    state = value;
  }
}
