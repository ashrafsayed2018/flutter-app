import 'package:flutter/material.dart';
import 'package:forsale/application/classes/apportunity/apportunity.dart';
import 'package:forsale/values/images.dart';
import 'package:forsale/widgets/apportunity_links.dart';

class ApportunityDetail extends StatelessWidget {
  const ApportunityDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Apportunity apportunity =
        ModalRoute.of(context)!.settings.arguments as Apportunity;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(Images.logo),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Text("${apportunity.title!}",
                    style: const TextStyle(fontWeight: FontWeight.w600)),
              ),
              ApportunityLinks(
                categoryName: apportunity.category!.name,
                views: apportunity.id.toString(),
                deadline: apportunity.deadline,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TitleTextWidget(title: "Benefits"),
                    const SizedBox(
                      height: 15,
                    ),
                    Text("${apportunity.apportunityDetail!.benefits!}"),
                    const SizedBox(
                      height: 15,
                    ),
                    const TitleTextWidget(title: "Application process"),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                        "${apportunity.apportunityDetail!.applicationProcess!}"),
                    const SizedBox(
                      height: 15,
                    ),
                    const TitleTextWidget(title: "Further Queries"),
                    Text("${apportunity.apportunityDetail!.furtherQueries!}"),
                    const SizedBox(
                      height: 15,
                    ),
                    const TitleTextWidget(title: "Eligibilities"),
                    Text("${apportunity.apportunityDetail!.eligibilities!}"),
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

class TitleTextWidget extends StatelessWidget {
  final String? title;
  const TitleTextWidget({
    Key? key,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "$title",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
