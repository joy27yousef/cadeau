import 'package:cadeau/core/widgets/appbar_screens.dart';
import 'package:cadeau/features/social_section/screens/widgets/invent_friends_part.dart';
import 'package:cadeau/features/social_section/screens/widgets/my_friends_part.dart';
import 'package:cadeau/features/social_section/screens/widgets/people_you_know_part.dart';
import 'package:cadeau/features/social_section/screens/widgets/search_for_friends_part.dart';
import 'package:flutter/material.dart';

class SocialPage extends StatelessWidget {
  const SocialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarMainScreens(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InventFriendsPart(),
            SearchForFriendsPart(),
            MyFriendsPart(withPadding: false),
            PeopleYouKnowPart(),
          ],
        ),
      ),
    );
  }
}
