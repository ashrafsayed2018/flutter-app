import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forsale/application/classes/forum/question.dart';
import 'package:forsale/application/state/forum_state.dart';
import 'package:forsale/values/images.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage>
    with AutomaticKeepAliveClientMixin {
  final _forumStateRM = RM.get<ForumSate>();
  ScrollController? _scrollController;

  @override
  void didChangeDependencies() {
    _scrollController = ScrollController();
    _scrollController!.addListener(() {
      double scrollvalue = _scrollController!.position.pixels;
      double screenHeigh = _scrollController!.position.maxScrollExtent;

      if (scrollvalue >= screenHeigh && !_forumStateRM.state.loading) {
        _getQuestions();
      }
    });
    super.didChangeDependencies();
    _getQuestions();
  }

  void _getQuestions() {
    _forumStateRM.setState(
      (questionsState) => questionsState.getAllQuestions(),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('questions page'),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: StateBuilder<ForumSate>(
          observe: () => _forumStateRM,
          builder: (_, model) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  ...model.state.questions.map((question) => GestureDetector(
                        onTap: () {},
                        child: Container(
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${question.createdBy!.firstName} ${question.createdBy!.lastName}",
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "${question.createdBy!.email}",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text("2 days ago"),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${question.question}",
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
                        ),
                      ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}




// Container(
//           padding: const EdgeInsets.symmetric(horizontal: 15),
//           child: Column(
//             children: [
//               Container(
//                 padding: const EdgeInsets.only(top: 20),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         CircleAvatar(
//                           radius: 30,
//                           backgroundImage: AssetImage(Images.logo),
//                         ),
//                         const SizedBox(
//                           width: 10,
//                         ),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: const [
//                               Text(
//                                 "Scarlet johnson",
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               Text("scarlet@gmail.com"),
//                             ],
//                           ),
//                         ),
//                         const Text("2 days ago"),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     const Text(
//                       "lorem ipsum inkedkfj dfklsjf kjkldj kdsfj kldsjfkldsfj kllsdjfk djfsk",
//                       maxLines: 2,
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 15,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Container(
//                       height: 1,
//                       color: Colors.black26,
//                     )
//                   ],
//                 ),
//               )
//             ],
//           ),
//         )
