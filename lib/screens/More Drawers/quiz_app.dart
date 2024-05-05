import 'package:flutter/material.dart';
import 'package:securityapp/screens/vault/vaultpage.dart';


class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz'),
          backgroundColor: Colors.orangeAccent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black,),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VaultPage(),
                ),
              );
            },
          ),
        ),
        body: QuizScreen(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  String _selectedAnswer = '';

  void _answerQuestion(String selectedAnswer) {
    setState(() {
      _selectedAnswer = selectedAnswer;
    });
  }

  final List<Question> _questions = [
    Question(
      'What is a common method for preventing malware infections through user education?',
      ['A. Regularly updating software',
        'B. Clicking on unknown links',
        'C. Opening email attachments from unknown sources',
        'D. Educating users about phishing and safe online practices',],
      'D. Educating users about phishing and safe online practices',
    ),
    Question(
      'Which type of malware replicates itself across networks without requiring user interaction?',
      ['A. Virus',
        'B. Adware',
        'C. Worm',
        'D. Keylogger'],
      'C. Worm',
    ),
    Question(
        'What is the purpose of regular backups in malware prevention?',
        ['A. Paying ransom in case of an attack', 'B. Isolating critical systems', 'C. Restoring data in case of an infection', 'D. Allowing malware to spread easily'],
        'C. Restoring data in case of an infection'
    ),
    Question(
      'What does DNS stand for in computer networking?',
      ['A. Dynamic Network Server',
        'B. Domain Name System',
        'C. Data Network Security',
        'D. Digital Naming Service',],
      'B. Domain Name System',
    ),
    Question(
      'Which protocol is responsible for the transmission of email messages on the Internet?',
      ['A. SMTP',
        'B. FTP',
        'C. UDP',
        'D. IP',],
      'A. SMTP',
    ),
    Question(
      'What is the primary function of ARP (Address Resolution Protocol) in networking?',
      [ 'A. Routing data packets',
        'B. Resolving IP addresses to MAC addresses',
        'C. Securing network communications',
        'D. Managing network topology',],
      'B. Resolving IP addresses to MAC addresses',
    ),
    Question(
      'Which protocol is used for retrieving email from a mail server to a client device?',
      [ 'A. SMTP',
        'B. POP3',
        'C. UDP',
        'D. HTTP',],
      'B. POP3',
    ),
    Question(
        'What does BGP (Border Gateway Protocol) facilitate in networking?',
        [ 'A. Email transmission',
          'B. Dynamic routing between autonomous systems',
          'C. File transfer',
          'D. Network address translation',],
        'B. Dynamic routing between autonomous systems'
    ),
    Question(
        'Which type of malware disguises itself as legitimate software but performs malicious actions?',
        [ 'A. Spyware',
          'B. Trojan Horse',
          'C. Worm',
          'D. Ransomware',],
        'B. Trojan Horse'
    ),
    Question(
        'What is the primary purpose of a rootkit ?',
        [ 'A. Encrypting files',
          'B. Concealing its presence or other malware on a system',
          'C. Monitoring network traffic',
          'D. Capturing keystrokes',],
        'B. Concealing its presence or other malware on a system'
    ),
    Question(
        'What is the primary purpose of a rootkit ?',
        [ 'A. Encrypting files',
          'B. Concealing its presence or other malware on a system',
          'C. Monitoring network traffic',
          'D. Capturing keystrokes',],
        'B. Concealing its presence or other malware on a system'
    ),
    Question(
        'What is the primary purpose of spyware ?',
        [ 'A. Encrypting files',
          'B. Monitoring user activities without consent',
          'C. Replicating itself across networks',
          'D. Blocking network traffic',],
        'B. Monitoring user activities without consent'
    ),
    Question(
        'Which term refers to a network of compromised computers controlled by a single entity?',
        [ 'A. Adware',
          'B. Keyloggers',
          'C. Botnet',
          'D. Worm',],
        'C. Botnet'
    ),
    Question(
        'Which type of malware encrypts a users files and demands a ransom for their release?',
        [ 'A. Worm',
          'B. Adware',
          'C. Ransomware',
          'D. Virus',],
        'C. Ransomware'
    ),
    // Add more questions as needed
  ];

  void _goToNextQuestion() {
    setState(() {
      if (_selectedAnswer.isNotEmpty) {
        if (_currentQuestionIndex < _questions.length - 1) {
          _currentQuestionIndex++;
          _selectedAnswer = '';
        }
      }
    });
  }

  void _goToPreviousQuestion() {
    setState(() {
      if (_currentQuestionIndex > 0) {
        _currentQuestionIndex--;
        _selectedAnswer = '';
      }
    });
  }

  bool _isNextButtonEnabled() {
    return _selectedAnswer.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Question ${_currentQuestionIndex + 1}/${_questions.length}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 18),
            Text(
              _questions[_currentQuestionIndex].questionText,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Column(
              children: _questions[_currentQuestionIndex]
                  .options
                  .map((option) {
                bool isCorrect =
                    _questions[_currentQuestionIndex].correctAnswer == option;
                bool isSelected = _selectedAnswer == option;

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ElevatedButton(
                    onPressed: () => _answerQuestion(option),
                    style: ElevatedButton.styleFrom(
                      primary: isSelected
                          ? (isCorrect ? Colors.green : Colors.red)
                          : null,
                    ),
                    child: Text(option),
                  ),
                );
              })
                  .toList(),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _goToPreviousQuestion,
                  child: Text('<<'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                  ),
                ),
                ElevatedButton(
                  onPressed: _isNextButtonEnabled()
                      ? _goToNextQuestion
                      : null,
                  child: Text('>>'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightGreenAccent,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Question {
  final String questionText;
  final List<String> options;
  final String correctAnswer;

  Question(this.questionText, this.options, this.correctAnswer);
}
