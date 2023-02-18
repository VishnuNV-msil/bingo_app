import 'bloc_event.dart';
import 'bloc_state.dart';
import 'package:bloc/bloc.dart';

class BingoBloc extends Bloc<BingoEvent, BingoState> {
  List userselectedlist = [];
  final List numbersList = List.generate(25, (int index) => '');
  int number = 0;
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
    } else {
      if (userselectedlist.contains(index)) {
      } else {
        number = number + 1;
        userselectedlist.add(index);
        numbersList[index] = number;
      }
    }
  }
}
