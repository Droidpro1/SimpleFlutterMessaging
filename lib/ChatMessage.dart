import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget{
  /* This creates a widget for a message, with a container that has
  a Row that contains the contact's avatar (filled with the first letter
  of their name) at the start, then a column widget that has the contact's
  name at the top then the actual text of the message underneath it
   */
  ChatMessage({this.text, this.animationController});
  final String _name = "Your Name";
  final String text;
  final AnimationController animationController;
  @override
  Widget build(BuildContext context) {
    return new SizeTransition(
      sizeFactor: new CurvedAnimation(
          parent: animationController,
          curve: Curves.easeOut
      ),
      axisAlignment: 0.0,
      child: new Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: new CircleAvatar(child: new Text(_name[0])),
            ),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(_name, style: Theme.of(context).textTheme.subhead),
                new Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: new Text(text)
                )
              ],
            )
          ],
        ),
      )
    );
  }
}