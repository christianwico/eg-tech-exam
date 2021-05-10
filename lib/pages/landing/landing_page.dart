import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 48.0,
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
                    _buildListTile('Testing for layout', 'Name'),
                    _buildListTile('Testing for layout', 'Name'),
                    _buildListTile('Testing for layout', 'Name'),
                    _buildListTile('Testing for layout', 'Name'),
                    _buildListTile('Testing for layout', 'Name'),
                    _buildListTile('Testing for layout', 'Name'),
                    _buildListTile('Testing for layout', 'Name'),
                    _buildListTile('Testing for layout', 'Name'),
                    _buildListTile('Testing for layout', 'Name'),
                    _buildListTile('Testing for layout', 'Name'),
                  ],
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
