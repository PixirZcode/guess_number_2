import 'dart:math';

class Game {
  int answer = 0; // instance field
  int count = 0; // นับรอบที่ทาย
  Game({int maxRandom = 100}){
    var r = Random();
    answer =  r.nextInt(maxRandom) + 1;
    print('│◆ คำตอบคือ $answer');
    print('│────────────────────────────────────────────');
  }

  int doGuess(int num){
    if (num > answer) {
      count += 1;
      print('│➧ $num is too high ▲');
      print('│────────────────────────────────────────────');
      return 0;
    } else if (num < answer){
      count += 1;
      print('│➧ $num is too low ▼');
      print('│────────────────────────────────────────────');
      return 0;
    } else {
      count += 1;
      print('│➧ $num is correct ✔, total guesses: $count');
      print('│────────────────────────────────────────────');
      print('│           ❤ THE END THANK YOU ❤           ');
      print('└────────────────────────────────────────────');
      return 1;
    }
  }
}