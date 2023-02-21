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
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BingoBloc(),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 50, bottom: 200, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Center(
              child: Text(
                "Bingo",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                    fontSize: 30),
              ),
            ),
            BlocBuilder<BingoBloc, BingoState>(
              builder: (context, state) {
                return Stack(
                  children: [
                    Flexible(
                      child: Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.width - 40,
                        width: MediaQuery.of(context).size.width - 10,
                        decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: CustomPaint(
                              foregroundPainter: GridLines(
                                  Paint()
                                    ..color = Colors.black
                                    ..strokeWidth = 6.0,
                                  state is BingoAddNumberState
                                      ? state.bingoList
                                      : []),
                              child: GridView.builder(
                                  itemCount: 25,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 5,
                                          childAspectRatio: 1),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return ButtonWidget(
                                      buttonTapped: () {
                                        BlocProvider.of<BingoBloc>(context).add(
                                            BingoAddNumberEvent(
                                                index));
                                      },
                                      buttonText: state is BingoAddNumberState
                                          ? state.userIndexList[index]
                                              .toString()
                                          : '',
                                      textColor: Colors.black,
                                    );
                                  }),
                            )),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class GridLines extends CustomPainter {
  final Paint _paint;
  final List bingoList;
  GridLines(this._paint, this.bingoList);

  @override
  void paint(Canvas canvas, Size size) {
    double cellWidth = size.width / 5;
    double cellHeight = size.height / 5;
    double lineLength = size.width * 5;
    double offsetX;
    double offsetY;

    if (bingoList.contains('c1')) {
      offsetX = cellWidth / 2;
      drawLineVerticalLine(canvas, offsetX);
    }
    if (bingoList.contains('c2')) {
      offsetX = cellWidth * 1.5;
      drawLineVerticalLine(canvas, offsetX);
    }
    if (bingoList.contains('c3')) {
      offsetX = cellWidth * 2.5;
      drawLineVerticalLine(canvas, offsetX);
    }
    if (bingoList.contains('c4')) {
      offsetX = cellWidth * 3.5;
      drawLineVerticalLine(canvas, offsetX);
    }
    if (bingoList.contains('c5')) {
      offsetX = cellWidth * 4.5;
      drawLineVerticalLine(canvas, offsetX);
    }

    if (bingoList.contains('r1')) {
      offsetY = cellHeight / 2;
      drawHorizontalLine(canvas, offsetY);
    }
    if (bingoList.contains('r2')) {
      offsetY = cellHeight * 1.5;
      drawHorizontalLine(canvas, offsetY);
    }
    if (bingoList.contains('r3')) {
      offsetY = cellHeight * 2.5;
      drawHorizontalLine(canvas, offsetY);
    }
    if (bingoList.contains('r4')) {
      offsetY = cellHeight * 3.5;
      drawHorizontalLine(canvas, offsetY);
    }
    if (bingoList.contains('r5')) {
      offsetY = cellHeight * 4.5;
      drawHorizontalLine(canvas, offsetY);
    }
    if (bingoList.contains('dRight')) {
      canvas.drawLine(
        const Offset(0, 0),
        Offset(lineLength/5, lineLength/5),
        _paint,
      );
    }
    if (bingoList.contains('dLeft')) {
      canvas.drawLine(
        Offset(0, lineLength/5),
        Offset(lineLength/5, 0),
        _paint,
      );
    }
  }

  void drawLineVerticalLine(Canvas canvas, double offsetX) {
    double lineLength = 350.0;
    canvas.drawLine(
      Offset(offsetX, 0),
      Offset(offsetX, lineLength + 8),
      _paint,
    );
  }

  void drawHorizontalLine(Canvas canvas, double offsetY) {
    double lineLength = 350.0;
    canvas.drawLine(
      Offset(0, offsetY),
      Offset(lineLength + 8, offsetY),
      _paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
