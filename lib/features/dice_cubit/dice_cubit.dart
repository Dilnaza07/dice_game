import 'dart:math';

import 'package:dice_game/features/dice_cubit/dice_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiceCubit extends Cubit<DiceState> {

  DiceCubit():super(DiceState(index1: 0, index2: 0));
  Random random = new Random();



  void rollTheDice() {
    emit(DiceState(index1: random.nextInt(6), index2: random.nextInt(6)));
  }
}
