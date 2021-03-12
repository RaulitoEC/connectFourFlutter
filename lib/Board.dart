import 'package:flutter/material.dart';
import 'components/Chips.dart';
import 'components/DropButton.dart';
import 'Player.dart';

class Board extends StatefulWidget {
  final Player1 player1;
  final Player2 player2;

  Board(this.player1, this.player2);

  @override
  _BoardState createState() => _BoardState(player1, player2);
}

class _BoardState extends State<Board> {
  static const diagonalDown = 'diagonalDown';
  static const diagonalUp = 'diagonalUp';
  static const horizontal = 'horizontal';
  static const vertical = 'vertical';

  final Player1 player1;
  final Player2 player2;

  int currentPlayer = 1;
  List<bool> showDrops = [true, true, true, true, true, true, true];
  List nodes = List.generate(7, (int index) {
    return List.generate(6, (int jIndex) {
      // print("index $index");
      return new ChipNode(index, jIndex, Colors.white);
      // return new ChipNode(jIndex, index, Colors.white);
    }, growable: false);
  }, growable: false);

  _BoardState(this.player1, this.player2);

  void disableDropButtons () {
    setState(() {
      showDrops = [false, false, false, false, false, false, false];
    });
  }

  int findLength(String pId, int length, ChipNode prevNode, String dir) {
    print("dir $dir length $length");
    if (length < 4) {
      if (dir == diagonalDown) {
        if (prevNode.x - 1 >= 0 && prevNode.y + 1 < 6 && nodes[prevNode.x - 1][prevNode.y + 1].pId == pId) {
          print("d-down");
          return findLength(pId, length + 1, nodes[prevNode.x - 1][prevNode.y + 1], dir);
        }
      }
      if (dir == diagonalUp) {
        if (prevNode.x + 1 < 7 && prevNode.y + 1 < 6 && nodes[prevNode.x + 1][prevNode.y + 1].pId == pId) {
          print("d-up");
          return findLength(pId, length + 1, nodes[prevNode.x + 1][prevNode.y + 1], dir);
        }
      }
      if (dir == horizontal) {
        if (prevNode.x + 1 < 7 && nodes[prevNode.x + 1][prevNode.y].pId == pId) {
          print("d-hor");
          return findLength(pId, length + 1, nodes[prevNode.x + 1][prevNode.y], dir);
        }
      }
      if (dir == vertical) {
        if (prevNode.y + 1 < 6 && nodes[prevNode.x][prevNode.y + 1].pId == pId) {
          print("d-vert");
          return findLength(pId, length + 1, nodes[prevNode.x][prevNode.y + 1], dir);
        }
      }
    }
    return length;
  }

  void insertPlayerChip(int column) {
    setState(() {
      for (int y = 0; y < 6; y++) {
        if (nodes[column][y].pId == null) {
          setState(() {
            nodes[column][y] = new ChipNode.withPlayer(
              column,
              y,
              currentPlayer == 1 ? player1.pId : player2.pId,
              currentPlayer == 1 ? player1.color : player2.color,
            );
          });
          break;
        }
      }
    });
  }

  bool isColumnFull(column) {
    return nodes[column][5].pId != null;
  }

  bool isWinner(String pId, int length) {
    bool isWinner = false;
    for (int y = 0; y < 6; y++) {
      for (int x = 0; x < 7; x++) {
        // print(nodes[x]);
        if (nodes[x][y].pId == pId && (
          findLength(pId, 1, nodes[x][y], diagonalDown) == 4 ||
          findLength(pId, 1, nodes[x][y], diagonalUp) == 4 ||
          findLength(pId, 1, nodes[x][y], horizontal) == 4 ||
          findLength(pId, 1, nodes[x][y], vertical) == 4
        )) {
          isWinner = true;
          break;
        }
      }
      if (isWinner) {
        break;
      }
    }
    return isWinner;
  }

  void runGameLoop(column) {
    // turn off all drops
    disableDropButtons();
    // insert new chip
    insertPlayerChip(column);
    // check if player is a winner
    if (isWinner(currentPlayer == 1 ? player1.pId : player2.pId, 0)) {
      print("show winner card (not created yet)");
    } else {
      // check if board is full
      if (
        isColumnFull(0) && isColumnFull(1) &&
        isColumnFull(2) && isColumnFull(3) &&
        isColumnFull(4) && isColumnFull(5) &&
        isColumnFull(6)
      ) {
        print("Show Draw Card");
      } else {
        // set currentPlayer to the other player
        setState(() {
          currentPlayer = currentPlayer == 1 ? 2 : 1;
        });
        // enable valid columns
        setState(() {
          showDrops = [
            !isColumnFull(0), !isColumnFull(1),
            !isColumnFull(2), !isColumnFull(3),
            !isColumnFull(4), !isColumnFull(5),
            !isColumnFull(6)
          ];
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
          children: <Widget>[
            for(int i = 0; i < 7; i++) DropButton(showDrops[i], () { runGameLoop(i); })
          ]
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
          children: <Widget>[
            ColorChip(nodes[0][5].color,),
            ColorChip(nodes[1][5].color,),
            ColorChip(nodes[2][5].color,),
            ColorChip(nodes[3][5].color,),
            ColorChip(nodes[4][5].color,),
            ColorChip(nodes[5][5].color,),
            ColorChip(nodes[6][5].color,),
          ]
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
          children: <Widget>[
            ColorChip(nodes[0][4].color,),
            ColorChip(nodes[1][4].color,),
            ColorChip(nodes[2][4].color,),
            ColorChip(nodes[3][4].color,),
            ColorChip(nodes[4][4].color,),
            ColorChip(nodes[5][4].color,),
            ColorChip(nodes[6][4].color,),
          ]
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
          children: [
            ColorChip(nodes[0][3].color,),
            ColorChip(nodes[1][3].color,),
            ColorChip(nodes[2][3].color,),
            ColorChip(nodes[3][3].color,),
            ColorChip(nodes[4][3].color,),
            ColorChip(nodes[5][3].color,),
            ColorChip(nodes[6][3].color,),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
          children: [
            ColorChip(nodes[0][2].color,),
            ColorChip(nodes[1][2].color,),
            ColorChip(nodes[2][2].color,),
            ColorChip(nodes[3][2].color,),
            ColorChip(nodes[4][2].color,),
            ColorChip(nodes[5][2].color,),
            ColorChip(nodes[6][2].color,),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
          children: [
            ColorChip(nodes[0][1].color,),
            ColorChip(nodes[1][1].color,),
            ColorChip(nodes[2][1].color,),
            ColorChip(nodes[3][1].color,),
            ColorChip(nodes[4][1].color,),
            ColorChip(nodes[5][1].color,),
            ColorChip(nodes[6][1].color,),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
          children: [
            ColorChip(nodes[0][0].color,),
            ColorChip(nodes[1][0].color,),
            ColorChip(nodes[2][0].color,),
            ColorChip(nodes[3][0].color,),
            ColorChip(nodes[4][0].color,),
            ColorChip(nodes[5][0].color,),
            ColorChip(nodes[6][0].color,),
          ],
        ),
      ],
    );
  }
}