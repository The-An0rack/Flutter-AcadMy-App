import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';

import '../mock_data/user_profile_data.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Widget avatar =
      randomAvatar(user.email, trBackground: true, height: 100, width: 100);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.blueGrey),
                child: avatar),
            Text(
              user.name,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Text(
              "(" + user.email + ")",
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Text(
              "Batch: " + user.batch,
              style: Theme.of(context).textTheme.headline1,
            ),
          ],
        ),
      ),
    );
  }
}
