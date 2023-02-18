class BingoState {}

class BingoInitialState extends BingoState {

}
class BingoAddNumberState extends BingoState {
  List userIndexList;
  BingoAddNumberState(this.userIndexList);
}
