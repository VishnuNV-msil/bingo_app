import 'dart:developer';

import 'bloc_event.dart';
import 'bloc_state.dart';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

class BingoBloc extends Bloc<BingoEvent, BingoState> {
  List userselectedlist = [];
  final List numbersList = List.generate(25, (int index) => '');
  int number = 0;
  List crossedList = [];
  final List dLeft = [4, 8, 12, 16, 20];
  final List dRight = [0, 6, 12, 18, 24];
  final List c1 = [0, 5, 10, 15, 20];
  final List c2 = [1, 6, 11, 16, 21];
  final List c3 = [2, 7, 12, 17, 22];
  final List c4 = [3, 8, 13, 18, 23];
  final List c5 = [4, 9, 14, 19, 24];
  final List r1 = [0, 1, 2, 3, 4];
  final List r2 = [5, 6, 7, 8, 9];
  final List r3 = [10, 11, 12, 13, 14];
  final List r4 = [15, 16, 17, 18, 19];
  final List r5 = [20, 21, 22, 23, 24];
  final List bingoList = [];

  @override
  BingoBloc() : super(BingoInitialState()) {
    on<BingoAddNumberEvent>((event, emit) {
      addToUserSelctedList(event.userIndexValue);
      emit(BingoAddNumberState(numbersList));
    });
  }
  void addToUserSelctedList(int index) {
    if (number == 25) {
      numbersList[index] = 'X';
      addToCrossedList(index);
    } else {
      if (userselectedlist.contains(index)) {
      } else {
        number = number + 1;
        userselectedlist.add(index);
        numbersList[index] = number;
      }
    }
  }

  void addToCrossedList(int index) {
    if (crossedList.contains(index)) {
    } else {
      crossedList.add(index);
      if (crossedList.length > 4) {
        checkBingo();
      }
    }
  }

  void checkBingo() {
    if (Set.of(crossedList).containsAll(r1) && !bingoList.contains('r1')) {
      bingoList.add('r1');
      drawline(r1);
    } else if (Set.of(crossedList).containsAll(r2) &&
        !bingoList.contains('r2')) {
      bingoList.add('r2');
      drawline(r2);
    } else if (Set.of(crossedList).containsAll(r3) &&
        !bingoList.contains('r3')) {
      bingoList.add('r3');
      drawline(r3);
    } else if (Set.of(crossedList).containsAll(r4) &&
        !bingoList.contains('r4')) {
      bingoList.add('r4');
      drawline(r4);
    } else if (Set.of(crossedList).containsAll(r5) &&
        !bingoList.contains('r5')) {
      bingoList.add('r5');
      drawline(r5);
    } else if (Set.of(crossedList).containsAll(c1) &&
        !bingoList.contains('c1')) {
      bingoList.add('c1');
      drawline(c1);
    } else if (Set.of(crossedList).containsAll(c2) &&
        !bingoList.contains('c2')) {
      bingoList.add('c2');
      drawline(c2);
    } else if (Set.of(crossedList).containsAll(c3) &&
        !bingoList.contains('c3')) {
      bingoList.add('c3');
      drawline(c3);
    } else if (Set.of(crossedList).containsAll(c4) &&
        !bingoList.contains('c4')) {
      bingoList.add('c4');
      drawline(c4);
    } else if (Set.of(crossedList).containsAll(c5) &&
        !bingoList.contains('c5')) {
      bingoList.add('c5');
      drawline(c5);
    } else if (Set.of(crossedList).containsAll(dLeft) &&
        !bingoList.contains('dLeft')) {
      bingoList.add('dLeft');
      drawline(dLeft);
    } else if (Set.of(crossedList).containsAll(dRight) &&
        !bingoList.contains('dRight')) {
      bingoList.add('dRight');
      drawline(dRight);
    } else {}
    log(crossedList.toString());
  }

  void drawline(List lineName) {
    // need to draw the line connecting items in lineName
    print('draw a line on ${bingoList.last}');
    print('lines drawn at $bingoList');
    if (bingoList.length > 4) {
      print("BINGO == BINGO");
    }
  }
}
