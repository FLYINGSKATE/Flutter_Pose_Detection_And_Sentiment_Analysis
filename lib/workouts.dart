import 'package:flutter/material.dart';
import 'package:align_ai/widgets/search_bar.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sentiment_dart/sentiment_dart.dart';

class WorkOutPage extends StatefulWidget {
  @override
  _WorkOutPageState createState() => _WorkOutPageState();
}

class _WorkOutPageState extends State<WorkOutPage> {
  TextEditingController sentiTextController = TextEditingController();

  var output;
  final sentiment = Sentiment();
  int score = 0;

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: score>0?Colors.yellow:score!=0?Colors.blueGrey:Colors.white,
      body: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 50),
                Text(
                  'Sentiment Analysis',
                  style: TextStyle(
                    color: Color(0xFFFE7C7C),
                    fontWeight: FontWeight.bold,
                    fontSize: 28.0,
                  ),
                ),
                Center(
                  child: Container(
                    height: 300,
                    child: score>0?Image.asset('images/happy.png'):Image.asset('images/Sad.png'),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 300.0,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 20.0
                        )
                      ]
                  ),
                  child: Card(
                    elevation: 20.0,
                    color: Colors.black,
                    child: Text('$output',style: TextStyle(
                      color: Colors.green
                    ),),
                  ),
                ),
                SizedBox(
                  child: Container(
                    margin: EdgeInsets.only(top: 5),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TextField(
                      controller: sentiTextController,
                      onChanged: (value){
                        print(value);
                        output = sentiment.analysis(value,emoji: true);
                        setState(() {});
                        score = output["score"];
                        print(score);
                        print(output);
                      },
                      decoration: InputDecoration(
                        hintText: "Type Something...",
                        icon: Icon(LineAwesomeIcons.typo3),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          )
      ),
    );
  }
}

