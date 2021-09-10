class Question {
  final int id, score;
  final String question;
  final List<String> options;

  Question(this.id, this.score, this.question, this.options);
}

const List sample_data = [
  {
    "id": 1,
    "question": "Q1.Little interest or pleasure in doing things",
    "options": [
      {'text': 'Not at all', 'score': 0},
      {'text': 'Several days', 'score': 1},
      {'text': 'days More than half the days', 'score': 2},
      {'text': 'Nearly every day', 'score': 3}
    ]
  },
  {
    "id": 2,
    "question": "Q2.Feeling down, depressed, or hopeless",
    "options": [
      {'text': 'Not at all', 'score': 0},
      {'text': 'Several days', 'score': 1},
      {'text': 'days More than half the days', 'score': 2},
      {'text': 'Nearly every day', 'score': 3}
    ]
  },
  {
    "id": 3,
    "question": "Q3.Trouble falling or staying asleep, or sleeping too much",
    "options": [
      {'text': 'Not at all', 'score': 0},
      {'text': 'Several days', 'score': 1},
      {'text': 'days More than half the days', 'score': 2},
      {'text': 'Nearly every day', 'score': 3}
    ]
  },
  {
    "id": 4,
    "question": "Q4.Feeling tired or having little energy",
    "options": [
      {'text': 'Not at all', 'score': 0},
      {'text': 'Several days', 'score': 1},
      {'text': 'days More than half the days', 'score': 2},
      {'text': 'Nearly every day', 'score': 3}
    ]
  },
  {
    "id": 5,
    "question": "Q5.Poor appetite or overeating",
    "options": [
      {'text': 'Not at all', 'score': 0},
      {'text': 'Several days', 'score': 1},
      {'text': 'days More than half the days', 'score': 2},
      {'text': 'Nearly every day', 'score': 3}
    ]
  },
  {
    "id": 6,
    "question":
        "Q6.Feeling bad about yourself or that you are a failure or have let yourself or your family down",
    "options": [
      {'text': 'Not at all', 'score': 0},
      {'text': 'Several days', 'score': 1},
      {'text': 'days More than half the days', 'score': 2},
      {'text': 'Nearly every day', 'score': 3}
    ]
  },
  {
    "id": 7,
    "question":
        "Q7.Trouble concentrating on things, such as reading the newspaper or watching television",
    "options": [
      {'text': 'Not at all', 'score': 0},
      {'text': 'Several days', 'score': 1},
      {'text': 'days More than half the days', 'score': 2},
      {'text': 'Nearly every day', 'score': 3}
    ]
  },
  {
    "id": 8,
    "question":
        "Q8.Moving or speaking so slowly that other people could have noticed. Or the opposite being so figety or restless that you have been moving around a lot more than usual",
    "options": [
      {'text': 'Not at all', 'score': 0},
      {'text': 'Several days', 'score': 1},
      {'text': 'days More than half the days', 'score': 2},
      {'text': 'Nearly every day', 'score': 3}
    ]
  },
  {
    "id": 9,
    "question":
        "Q9.Thoughts that you would be better off dead, or of hurting yourself",
    "options": [
      {'text': 'Not at all', 'score': 0},
      {'text': 'Several days', 'score': 1},
      {'text': 'days More than half the days', 'score': 2},
      {'text': 'Nearly every day', 'score': 3}
    ]
  },
];
