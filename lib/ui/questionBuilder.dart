import 'package:quizApp/ui/question.dart';

int _questionNumber = 0;

class QuestionBuilder {
  List<Question> _questionBank = [
    Question(
        "Cyclones spin in a clockwise direction in the southern hemisphere",
        true),
    Question("Goldfish only have a memory of three seconds", false),
    Question("The capital of Libya is Benghazi", true),
    Question("Dolly Parton is the godmother of Miley Cyrus", true),
    Question(
        "Roger Federer has won the most Wimbledon titles of any player", false),
    Question("An octopus has five hearts", true),
    Question(
        "Brazil is the only country in the Americas to have the official language of Portuguese",
        true),
    Question(
        "The Channel Tunnel is the longest rail tunnel in the world", false),
    Question(
        "Darth Vader famously says the line “Luke, I am your father” in The Empire Strikes Back",
        true),
    Question(
        "Olivia Newton-John represented the UK in the Eurovision Song Contest in 1974, the year ABBA won with “Waterloo”",
        false),
    Question("Stephen Hawking declined a knighthood from the Queen", true),
    Question(
        "Japan and Russia did not sign a peace treaty after World War Two so are technically still at war",
        true),
    Question(
        "The mathematical name for the shape of a Pringle is hyperbolic paraboloid",
        false),
    Question(
        "Charlie Chaplin came first in a Charlie Chaplin look-alike contest",
        true),
    Question("Michael Keaton’s real name is Michael Douglas", true),
    Question("  The Great Wall of China is visible from space", true),
  ];

  Question getQuestion() {
    return _questionBank[_questionNumber];
  }

  bool isLast() => (_questionNumber == _questionBank.length - 1);

  nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }
}
