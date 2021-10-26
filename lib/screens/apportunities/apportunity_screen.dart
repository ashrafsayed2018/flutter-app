import 'package:flutter/material.dart';
import 'package:forsale/application/state/apportunity_state.dart';
import 'package:forsale/router/router_constants.dart';
import 'package:forsale/screens/apportunities/apportunity_detail.dart';
import 'package:forsale/values/images.dart';
import 'package:forsale/widgets/apportunity_links.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class ApportunitiesScreen extends StatefulWidget {
  const ApportunitiesScreen({Key? key}) : super(key: key);

  @override
  _ApportunitiesScreenState createState() => _ApportunitiesScreenState();
}

class _ApportunitiesScreenState extends State<ApportunitiesScreen> {
  final _apportunityStateRM = RM.get<ApportunityState>();

  // scroll page when we reach the end of the screen
  ScrollController? _scrollController;

  @override
  void didChangeDependencies() {
    _scrollController = ScrollController();
    _scrollController!.addListener(() {
      double scrollvalue = _scrollController!.position.pixels;
      double screenHeigh = _scrollController!.position.maxScrollExtent;

      if (scrollvalue >= screenHeigh && !_apportunityStateRM.state.loading) {
        _getNewApportunities();
      }
    });
    // }

    _getNewApportunities();
    super.didChangeDependencies();
  }

  void _getNewApportunities() {
    _apportunityStateRM.setState((state) => state.getAllApportunities());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Apportunity page"),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: StateBuilder<ApportunityState>(
          observe: () => _apportunityStateRM,
          builder: (_, model) {
            return Column(
              children: [
                ...model.state.apportunities.map(
                  (apportunity) => GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        approtunityDetail,
                        arguments: apportunity,
                      );
                    },
                    child: Column(
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
                        ApportunityLinks(
                          categoryName: apportunity.category!.name,
                          views: apportunity.id.toString(),
                          deadline: apportunity.deadline,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
