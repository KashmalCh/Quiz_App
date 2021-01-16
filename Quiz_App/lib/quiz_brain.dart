import 'question.dart';
class QuizBrain
{
  int _questionNumber = 0;

  List<Question>_questionBank = [ //max limit of questions is 13
    Question(q:'The five rings on the Olympic flags are interlocking.',a:true),
    Question(q:'K2 is the highest mountain in the world.',a:false), // Everest
    Question(q:'Sydney is the capital of Australia.', a:false),//canberra
    Question(q:'A group of swans is known as a bevy.',a:true),
    Question(q:'A heptagon has eight sides.',a:false), // seven
    Question(q:'The star sign of Capricorn is represented by a goat.',a:true),
    Question(q:'A fish cannot blink.',a:true),
    Question(q:'Switzerland shares land borders with four other countries.',a:false),// 5
    Question(q:'Knight is the only piece in chess which can only move diagonally.',a:false), //Bishop
    Question(q:'The mathematical name for the shape of a Pringle is hyperbolic paraboloid.',a:true)
  ];
  void reset()
  {
    _questionNumber = 0;
  }

  bool isFinished()
  {
    if(_questionNumber==(_questionBank.length-1)) return true;
    return false;
  }
  void nextQuestion()
  {
    if(_questionNumber< (_questionBank.length-1))
      {
        _questionNumber++;
      }
  }
  String getQuestion()
  {
    return _questionBank[_questionNumber].question;
  }
  bool getAnswer()
  {
    return _questionBank[_questionNumber].answer;
  }
}