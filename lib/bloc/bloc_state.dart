class BingoState {}

class BingoInitialState extends BingoState {}

class BingoAddNumberState extends BingoState {
  List userIndexList;
  List bingoList;
  BingoAddNumberState(this.userIndexList,this.bingoList);
}
