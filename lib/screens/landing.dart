import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podster_flutter/components/text_button.dart';
import 'package:podster_flutter/components/link_button.dart';


class Landing extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                top: 55.0,
                bottom: 25.0,
              ),
              child: Text(
                'Podster',
                style: TextStyle(
                  fontSize: 50.0,
                ),
              ),
            ),
            Expanded(
              child: SvgPicture.asset(
                'assets/images/podster-logo.svg',
                semanticsLabel: 'Podster Logo',
                height: 256.0,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 25.0,
                horizontal: 55.0,
              ),
              child: Text(
                'Choose to make sense of the world around you. Choose Podster.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextButton(
                    label: 'Sign in with Email',
                    onTap: () {
                      Navigator.pushNamed(context, '/for_you');
                    },
                  ),
                  TextButton(
                    label: 'Sign in with Google',
                    onTap: () {
                      Navigator.pushNamed(context, '/for_you');
                    },
                  ),
                  TextButton(
                    label: 'Sign in with Facebook',
                    onTap: () {
                      Navigator.pushNamed(context, '/for_you');
                    }
                  ),
                  LinkButton(
                    label: 'Don\'t have an account? Sign up now!',
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => SimpleDialog(
                          title: Text('Feature Not Available'),
                          children: <Widget>[
                            SimpleDialogOption(
                              onPressed: () {},
                              child: const Text('Code: not_impl'),
                            ),
                          ],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
