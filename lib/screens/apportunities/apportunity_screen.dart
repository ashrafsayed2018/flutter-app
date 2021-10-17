import 'package:flutter/material.dart';

class ApportunitiesScreen extends StatefulWidget {
  const ApportunitiesScreen({Key? key}) : super(key: key);

  @override
  _ApportunitiesScreenState createState() => _ApportunitiesScreenState();
}

class _ApportunitiesScreenState extends State<ApportunitiesScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Apportunity page"),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
