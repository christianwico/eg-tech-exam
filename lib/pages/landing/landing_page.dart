import 'package:exam/models/profile.dart';
import 'package:exam/providers/auth/auth.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Profile? profile = context.read<Auth>().profile;

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background-landing.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 60.0,
          vertical: 24.0,
        ),
        width: double.maxFinite,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 24.0),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 48.0,
                  ),
                  profile != null
                      ? CircleAvatar(
                          backgroundColor: Theme.of(context).primaryColor,
                          foregroundImage: NetworkImage(profile.picture),
                          radius: 44.0,
                        )
                      : CircleAvatar(
                          backgroundColor: Theme.of(context).primaryColor,
                          child: Icon(
                            Icons.person,
                            size: 48.0,
                            color: Colors.white,
                          ),
                          radius: 44.0,
                        ),
                ],
              ),
              Card(
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    _buildListTile(profile?.nickname ?? 'Unknown', 'Nickname'),
                    _buildListTile(profile?.name ?? 'Unknown', 'Name'),
                    _buildListTile(
                        profile?.updatedAt ?? 'Unknown', 'Updated At'),
                  ],
                ),
              ),
              SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  child: Text(
                    'LOGOUT',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                    ),
                  ),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(
                        Theme.of(context).accentColor),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                    elevation: MaterialStateProperty.all(0.0),
                  ),
                  onPressed: context.read<Auth>().logoutAction,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListTile(String title, String subtitle) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(color: Colors.black),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}
