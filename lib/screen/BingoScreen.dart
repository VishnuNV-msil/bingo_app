
import 'package:bingo_app/bloc/bloc_event.dart';
import 'package:bingo_app/bloc/bloc_state.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bingo_bloc.dart';
import 'BoxWidget.dart';

class BingoScreen extends StatefulWidget {
  const BingoScreen({Key? key}) : super(key: key);

  @override
  State<BingoScreen> createState() => _BingoScreenState();
}

class _BingoScreenState extends State<BingoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Let's play Bingo",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: const BingoTable(),
    );
  }
}

class BingoTable extends StatefulWidget {
  const BingoTable({Key? key}) : super(key: key);

  @override
  State<BingoTable> createState() => _BingoTableState();
}

class _BingoTableState extends State<BingoTable> {
  final List numbersList = List.generate(25, (int index) => '');
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BingoBloc(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Center(
                child: Text(
              "Bingo",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.purple, fontSize: 30),
            )),
            BlocBuilder<BingoBloc, BingoState>(
              builder: (context, state) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: GridView.builder(
                        itemCount: numbersList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 5),
                        itemBuilder: (BuildContext context, int index) {
                          return ButtonWidget(
                            buttonTapped: () {
                              BlocProvider.of<BingoBloc>(context)
                                  .add(BingoAddNumberEvent(index, numbersList));
                            },
                            buttonText: state is BingoAddNumberState ? state.userIndexList[index].toString() :
                            numbersList[index].toString(),
                            textColor: Colors.black,
                          );
                        }),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
