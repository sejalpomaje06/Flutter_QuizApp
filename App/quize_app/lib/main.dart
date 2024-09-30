//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizeApp(),
    );
  }
}

class QuizeApp extends StatefulWidget {
  const QuizeApp({super.key});
  @override
  State createState() => _QuizeAppState();
}

class _QuizeAppState extends State {
  ///List and List elements are from of map
  List<Map> allquestions = [
    {
      "question": "Which of NOT a programming lang",
      "options": ["Python", "JavaScript", "HTML", "Java"],
      "correctoption": 2,
    },
    {
      "question": "What is Git used for",
      "options": [
        "Testing Software",
        "Version Control",
        "Debugging",
        "Designing UI"
      ],
      "correctoption": 1,
    },
    {
      "question": "Which of used for Web Development",
      "options": ["Python", "CPP", "HTML", "Java"],
      "correctoption": 2,
    },
    {
      "question": "What is Refactoring",
      "options": [
        "Adding new feature",
        "Optimizing code Structure",
        "Fixing bugs",
        "Writing Documentation"
      ],
      "correctoption": 1,
    },
    {
      "question": "Which is backend programming lang",
      "options": ["Python", "JavaScript", "HTML", "CSS"],
      "correctoption": 0,
    },
    {
      "question": "What is use of Docker",
      "options": [
        "Containerization",
        "Version Control",
        "Code refactoring",
        "UI design"
      ],
      "correctoption": 0,
    },
    {
      "question": "Which lang is used for ios app development ",
      "options": ["Java", "JavaScript", "Swift", "C#"],
      "correctoption": 2,
    },
  ];
  int selectedAnswerIndex = -1;///shows if clicked or not
  bool questionpage = true;
  int correctAnswersCount = 0;
  bool isStartScreen = true;
  int currentquestion = 0;



  //Logic for Correct Option ,Wrong option(color change)
  MaterialStateProperty<Color?> checkAnswer(int answerIndex) {///answer index = button index
    if (selectedAnswerIndex != -1) {

      ///answer index show karavch lagel jri answer correct asel kiva wrong asel so condition check kartch rahil
      if (answerIndex == allquestions[currentquestion]["correctoption"]) {
        return const MaterialStatePropertyAll(Colors.green);
      } 

      
      else if (selectedAnswerIndex == answerIndex) {
        return const MaterialStatePropertyAll(Colors.red);
      }
       else {
        return const MaterialStatePropertyAll(null);
      }


      ///Starting Color is white so it is null
    } else {
      return const MaterialStatePropertyAll(null);
    }
  }



  
  @override
  Widget build(BuildContext context) {
    return isStartScreen ? startScreen() : isQuestionScreen();
  }

  //start Scrren Scaffold
  Scaffold startScreen() {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Quiz App",
          style: TextStyle(
              fontSize: 40, color: Colors.blue, fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              "https://miro.medium.com/v2/resize:fit:1000/1*FBRsnCP9wE84UVW1Kkv5Yw.jpeg",
              height: 500,
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isStartScreen = false; // Switch to question screen
                    questionpage = true;
                  });
                },
                child: const Text(
                  "Start Quiz",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Question Answers Scaffold
  Scaffold isQuestionScreen() {
    if (questionpage == true) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Quiz App",
            style: TextStyle(
                fontSize: 40, color: Colors.blue, fontWeight: FontWeight.w900),
          ),
          centerTitle: true,
          backgroundColor: Colors.amber,
        ),
         body: Stack(
        children: [
          // Add the background image
          Positioned.fill(
            child: Image.network(
              'https://example.com/background_image.jpg', // Replace with your image URL
              fit: BoxFit.cover, // Cover the entire screen
            ),
          ),
          
          // Add the content on top of the background
          Positioned.fill(
            child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 110,
                ),
                Text(
                  "Question : ${currentquestion + 1}/${allquestions.length}",
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.pink),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),

            ///Question Logic
            SizedBox(
              child: Text(
                allquestions[currentquestion]["question"],
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),

            //Option 1 Logic
            SizedBox(
              width: 310,
              height: 50,
              child: ElevatedButton(
                ///
                style: ButtonStyle(///button style return value-WidgetStatePropertyAll<color?> so check color also return WidgetStateproperty
                  backgroundColor: checkAnswer(0),
                ),
                onPressed: () {
                  if (selectedAnswerIndex == -1) {
                    selectedAnswerIndex = 0;///clicked on the selected 0 index button

                    /// check correct answer  count
                    if (selectedAnswerIndex ==
                        allquestions[currentquestion]["correctoption"]) {
                      correctAnswersCount++;
                    }

                    setState(() {});
                  }
                },
                child: Text(
                  "A.${allquestions[currentquestion]["options"][0]}",
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.purple),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),

            //Option 2 Logic
            SizedBox(
              width: 310,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: checkAnswer(1),
                ),
                onPressed: () {
                  if (selectedAnswerIndex == -1) {
                    selectedAnswerIndex = 1;
                    ///check correct answer count
                    if (selectedAnswerIndex ==
                        allquestions[currentquestion]["correctoption"]) {
                      correctAnswersCount++;
                    }
                    setState(() {});
                  }
                },
                child: Text(
                  "B.${allquestions[currentquestion]["options"][1]}",
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.purple),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),

            //Option 3 Logic
            SizedBox(
              width: 310,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: checkAnswer(2),
                ),
                onPressed: () {
                  if (selectedAnswerIndex == -1) {
                    selectedAnswerIndex = 2;

                    /// check correctanswwer count 
                    if (selectedAnswerIndex ==
                        allquestions[currentquestion]["correctoption"]) {
                      correctAnswersCount++;
                    }
                    setState(() {});
                  }
                },
                child: Text(
                  "C.${allquestions[currentquestion]["options"][2]}",
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.purple),
                ),
              ),
            ),

            //Option 4 Logic
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 310,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: checkAnswer(3),
                ),
                onPressed: () {
                  if (selectedAnswerIndex == -1) {
                    selectedAnswerIndex = 3;
                    ///check correct answer count
                    if (selectedAnswerIndex ==
                        allquestions[currentquestion]["correctoption"]) {
                      correctAnswersCount++;
                    }
                    setState(() {});
                  }
                  {}
                },
                child: Text(
                  "D.${allquestions[currentquestion]["options"][3]}",
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.purple),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),

            ///backbutton Logic
            ElevatedButton(
                onPressed: () {
                  if (currentquestion > 0) {
                    currentquestion--;

                    setState(() {
                      selectedAnswerIndex = 3;
                    });
                  }
                },
                child: const Icon(Icons.arrow_back))
          ],
        ),

        //Next button logic
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            
            
            ///SHOW NEXT QUESTION
            if (selectedAnswerIndex != -1) {

              ///Direct result Scrren la Score Show karaych asel tr
              
              // if (selectedAnswerIndex ==
              //           allquestions[currentquestion]["correctoption"]) {
              //         correctAnswersCount++;
              //       }
              
              if (currentquestion < allquestions.length - 1) {
                //print("Show next index");
                currentquestion++;

                
              } else {
                questionpage = false;

                ///Next page Congratulation
              }
              selectedAnswerIndex = -1;
              setState(() {});

              ///renders the Screen (build whole Screen)
            }
          },
          backgroundColor: Colors.amber,
          child: const Icon(
            Icons.forward,
            color: Colors.blue,
          ),
        ),
      );



      ///pagequestion=false
    } else {
      ///Scaffold Congratulation
      return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Quiz End",
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.blue,
                  fontWeight: FontWeight.w900),
            ),
            centerTitle: true,
            backgroundColor: Colors.amber,
          ),
          body: Center(
            child: Column(
              children: [
                Image.network(
                  "https://img.freepik.com/free-vector/trophy-award-laurel-wreath-composition-with-realistic-image-golden-cup-decorated-with-garland-with-reflection_1284-32301.jpg?size=626&ext=jpg&ga=GA1.1.713899515.1709452414&semt=ais_hybrid",
                  height: 400,
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  child: Text(
                    "Congratulations!!!",
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.amber,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Your Score: $correctAnswersCount/${allquestions.length}",
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      color: Colors.purple),
                ),
                const SizedBox(
                  height: 40,
                ),

                ///reset Button
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentquestion = 0;
                        questionpage = true;
                        correctAnswersCount = 0;
                        selectedAnswerIndex = -1;
                      });
                    },
                    child: const SizedBox(
                        width: 100,
                        height: 60,
                        child: Center(
                          child: Text(
                            "Reset",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        )))
              ],
            ),
          ));
    }
  }
}
