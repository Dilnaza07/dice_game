
import 'package:dice_game/features/dice_cubit/dice_cubit.dart';
import 'package:dice_game/features/dice_cubit/dice_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DicePage extends StatelessWidget {
  const DicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context)=>DiceCubit(),
      child: const DiceGame(),
    );
  }
}

class DiceGame extends StatelessWidget {
  const DiceGame({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DiceCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dice Game',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.deepPurple,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DicesWidget(),
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[700],
                padding: EdgeInsets.all(16),
              ),
              onPressed: cubit.rollTheDice,
              child: Text(
                'Roll the Dice',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DiceBlocBuilder extends StatelessWidget {
  const DiceBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiceCubit, DiceState>(
        builder: (BuildContext context,state){
          return  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150,
                width: 150,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset(state.images[state.index1]),
                ),
              ),
              Container(
                height: 150,
                width: 150,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset(state.images[state.index2]),
                ),
              ),
            ],
          );
    }
    );
  }

}


class DicesWidget extends StatelessWidget {
  const DicesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final index1 = context.watch<DiceState>().index1;
    final index2 = context.watch<DiceState>().index2;
    final List images = context.watch<DiceState>().images;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 150,
          width: 150,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset(images[index1]),
          ),
        ),
        Container(
          height: 150,
          width: 150,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset(images[index2]),
          ),
        ),
      ],
    );
  }
}
