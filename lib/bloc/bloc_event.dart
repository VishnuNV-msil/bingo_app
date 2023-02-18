abstract class BingoEvent {}

class BingoInitialEvent extends BingoEvent {}

class BingoAddNumberEvent extends BingoEvent {
  int userIndexValue;
  List numberList;
  BingoAddNumberEvent(this.userIndexValue,this.numberList);
}
