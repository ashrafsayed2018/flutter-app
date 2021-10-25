import 'package:flutter/material.dart';
import 'package:forsale/application/state/apportunity_state.dart';
import 'package:forsale/values/images.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class ApportunitiesScreen extends StatefulWidget {
  const ApportunitiesScreen({Key? key}) : super(key: key);

  @override
  _ApportunitiesScreenState createState() => _ApportunitiesScreenState();
}

class _ApportunitiesScreenState extends State<ApportunitiesScreen> {
  final _apportunityStateRM = RM.get<ApportunityState>();

  @override
  void initState() {
    _apportunityStateRM.setState((state) => state.getAllApportunities());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle _iconTextStyle = const TextStyle(
      fontFamily: "Dosis",
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );
    double iconSize = 16;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Apportunity page"),
      ),
      body: SingleChildScrollView(
        child: StateBuilder<ApportunityState>(
          observe: () => _apportunityStateRM,
          builder: (_, model) {
            return Column(
              children: [
                ...model.state.apportunities.map((apportunity) => Column(
                      children: [
                        Image.asset(Images.logo),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 5),
                          child: Text("${apportunity.title}",
                              style: const TextStyle(
                                  fontFamily: "Dosis",
                                  fontWeight: FontWeight.w600)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.school,
                                    size: iconSize,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "scoolarship",
                                  style: _iconTextStyle,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.remove_red_eye,
                                  size: iconSize,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '123',
                                  style: _iconTextStyle,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.share,
                                    size: iconSize,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "share",
                                  style: _iconTextStyle,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.event,
                                    size: iconSize,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "${apportunity.deadline}",
                                  style: _iconTextStyle,
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ))
              ],
            );
          },
        ),
      ),
    );
  }
}
