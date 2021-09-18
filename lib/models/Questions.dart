// ignore_for_file: file_names

class Question {
  final int id;
  final String title;

  Question({
    required this.id,
    required this.title,
  });
}

const options = [
  {'text': 'Not at all', 'score': 0},
  {'text': 'Several days', 'score': 1},
  {'text': 'days More than half the days', 'score': 2},
  {'text': 'Nearly every day', 'score': 3}
];

var questionsList = [
  Question(
    id: 1,
    title: "Little interest or pleasure in doing things",
  ),
  Question(
    id: 2,
    title: "Feeling down, depressed, or hopeless",
  ),
  Question(
    id: 3,
    title: "Trouble falling or staying asleep, or sleeping too much",
  ),
  Question(
    id: 4,
    title: "Feeling tired or having little energy",
  ),
  Question(
    id: 5,
    title: "Poor appetite or overeating",
  ),
  Question(
    id: 6,
    title:
        "Feeling bad about yourself or that you are a failure or have let yourself or your family down",
  ),
  Question(
    id: 7,
    title:
        "Trouble concentrating on things, such as reading the newspaper or watching television",
  ),
  Question(
    id: 8,
    title:
        "Moving or speaking so slowly that other people could have noticed. Or the opposite being so figety or restless that you have been moving around a lot more than usual",
  ),
  Question(
    id: 9,
    title: "Thoughts that you would be better off dead, or of hurting yourself",
  ),
];



// {
//     "id": 1,
//     "title": "Little interest or pleasure in doing things",
//   },
//   {
//     "id": 2,
//     "title": "Feeling down, depressed, or hopeless",
//   },
//   {
//     "id": 3,
//     "title": "Q3.Trouble falling or staying asleep, or sleeping too much",
//   },
//   {
//     "id": 4,
//     "title": "Feeling tired or having little energy",
//   },
//   {
//     "id": 5,
//     "title": "Poor appetite or overeating",
//   },
//   {
//     "id": 6,
//     "title":
//         "Feeling bad about yourself or that you are a failure or have let yourself or your family down",
//   },
//   {
//     "id": 7,
//     "title":
//         "Trouble concentrating on things, such as reading the newspaper or watching television",
//   },
//   {
//     "id": 8,
//     "title":
//         "Moving or speaking so slowly that other people could have noticed. Or the opposite being so figety or restless that you have been moving around a lot more than usual",
//   },
//   {
//     "id": 9,
//     "title":
//         "Thoughts that you would be better off dead, or of hurting yourself",
//   },