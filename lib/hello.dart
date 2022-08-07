import 'dart:io';
import 'game.dart';

// top-level function
void main(){

  var result = 0;
  var myList = <int>[];
  int count = 0; // ไว้เป็นตัวนับในรอบเกมนั้นๆว่าทายไปกี่เลขแล้วใส่ใน myList

  do {
    count = 0;
    // ส่วนของการทำงานทายเลข
    stdout.write('˃ Enter a maximum number to random: ');

    var ipMaxNum = stdin.readLineSync();
    var tryIpMaxNum = int.tryParse(ipMaxNum!);

    print('┌────────────────────────────────────────────');
    print('│             GUESS THE NUMBER            ');
    print('│────────────────────────────────────────────');

    // เลขเลือกสูงสุดไม่มีค่าให้ทำเป็นค่า default ที่ตั้งไว้
    if (tryIpMaxNum == null) {
      var game = Game();
      do {
        stdout.write('│ Please guess the number between 1 and 100: ');

        var input = stdin.readLineSync();
        var guess = int.tryParse(input!);

        if (guess == null) {
          stdout.write('│ Please Enter Number Only');
          continue;
        }
        result = game.doGuess(guess);
        count += 1;

      }while(result != 1); // ถ้าในส่วนของเงื่อนไขนี้ ลูปนี้มีการทายถูกจะเด้งไปยัง if ด้านล่าง

    } else { // ส่วนของมีค่าให้เอาเลขสูงสุดนั้นมาใส่ได้เลย
      var game = Game(maxRandom: tryIpMaxNum);
      do {
        stdout.write('│ Please guess the number between 1 and $tryIpMaxNum: ');

        var input = stdin.readLineSync();
        var guess = int.tryParse(input!);

        if (guess == null) {
          stdout.write('│ Please Enter Number Only');
          continue;
        }
        result = game.doGuess(guess);
        count += 1;

      }while(result != 1); // ถ้าในส่วนของเงื่อนไขนี้ ลูปนี้มีการทายถูกจะเด้งไปยัง if ด้านล่าง
    }
    var flag = false;
    // ส่วนของเลือกเล่นต่อหรือไม่
    if(result == 1) { // เมื่อตอบถูกให้ถามว่าเล่นต่อไหม
      do {
        stdout.write('Play again (y/n) : ');
        var inputYN = stdin.readLineSync();

        if (inputYN == 'n' || inputYN == 'N') {
          myList.add(count);
          result = 1;
          flag = true;

        } else if (inputYN == 'y' || inputYN == 'Y') {
          myList.add(count);
          result = 0;
          flag = true;
        }
      }while (!flag); // ถ้ายัง false ก็จะให้วนถามไปจนกว่าจะพิมพ์ y/Y/n/N ถูก
      }

  } while(result != 1); // จะจบลูปใหญ่ก็ต่อเมื่อ result = 1

  var rounds = myList.length;
  print('★ You’ve played $rounds games');

  for(var i = 0; i < myList.length; i++){
    print('★ Game #${i+1}: ${myList[i]} guesses');
  }
}
