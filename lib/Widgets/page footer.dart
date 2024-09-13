import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'scroll.dart';
class pageFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Social Media Icons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 15,),
            IconButton(
              icon: Icon(Icons.facebook),
              onPressed: () {
                // Add your Facebook link
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.twitter,),
              onPressed: () {
                // Add your Twitter link
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.instagram),
              onPressed: () {
                // Add your Instagram link
              },
            ),
          ],
        ),
        // Navigation Links
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: () {}, child: Text("About Us")),
            Text(" | "),
            TextButton(onPressed: () {}, child: Text("Privacy Policy")),
            Text(" | "),
            TextButton(onPressed: () {}, child: Text("Contact")),
          ],
        ),
        // Copyright Notice
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '© 2024 Minders Project. All Rights Reserved.',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ),
        // Optional: Back to Top Button
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xff420516)
          ),
          onPressed: () {
            Scrollable.of(context)?.position?.moveTo(0.0);
            },
          child: Text("Back to Top",style: TextStyle(color: Colors.white),),
        ),
      ],
    );
  }
}
