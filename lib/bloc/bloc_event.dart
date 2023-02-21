abstract class BingoEvent {}

class BingoInitialEvent extends BingoEvent {}

class BingoAddNumberEvent extends BingoEvent {
  int userIndexValue;
  BingoAddNumberEvent(this.userIndexValue);
}
