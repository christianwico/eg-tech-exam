import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background-login.png'),
          fit: BoxFit.cover,
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 60.0,
        vertical: 24.0,
      ),
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          _buildBrand(context),
          SizedBox(height: 16.0),
          _buildForm(context),
          _buildCopyFooter(),
        ],
      ),
    );
  }

  Widget _buildBrand(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(
            Icons.location_on,
            size: 36.0,
          ),
          Text(
            'StartUP',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 12.0,
            ),
            height: 12.0,
            width: 24.0,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.white,
                  width: 0.5,
                ),
              ),
            ),
          ),
          Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  fontSize: 10.0,
                  fontWeight: FontWeight.w100,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Expanded(
      child: Form(
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.person_outline,
                  color: Colors.white,
                  size: 16.0,
                ),
                hintText: 'USERNAME',
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.lock_outline,
                  color: Colors.white,
                  size: 16.0,
                ),
                hintText: 'PASSWORD',
              ),
              obscureText: true,
              obscuringCharacter: '*',
            ),
            DropdownButtonFormField<String>(
              items: [
                DropdownMenuItem(
                  child: Text('SELECT STARTUP'),
                ),
              ],
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.calendar_today_outlined,
                  color: Colors.white,
                  size: 16.0,
                ),
                hintText: 'SELECT STARTUP',
              ),
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 24.0),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                  ),
                ),
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all(Theme.of(context).accentColor),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                  ),
                  elevation: MaterialStateProperty.all(0.0),
                ),
                onPressed: () {},
              ),
            ),
            TextButton(
              child: Text(
                'I forgot my password!',
                style: TextStyle(color: Color(0xFF70003B), fontSize: 10.0),
              ),
              onPressed: () {},
            ),
            TextButton(
              child: Text.rich(
                TextSpan(
                  text: 'NOT A MEMBER? ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: 'REGISTER',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCopyFooter() {
    return Text(
      'Copyright © 2016 All right reserved. StartUP Project Manager',
      style: TextStyle(
        fontSize: 8.0,
      ),
    );
  }
}
