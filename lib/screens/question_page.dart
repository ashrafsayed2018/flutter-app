import 'package:flutter/material.dart';
import 'package:forsale/values/images.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('questions page'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(Images.logo),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Scarlet johnson",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text("scarlet@gmail.com"),
                            ],
                          ),
                        ),
                        const Text("2 days ago"),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "lorem ipsum inkedkfj dfklsjf kjkldj kdsfj kldsjfkldsfj kllsdjfk djfsk",
                      maxLines: 2,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 1,
                      color: Colors.black26,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
