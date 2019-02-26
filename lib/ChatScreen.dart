import 'package:flutter/material.dart';
import 'ChatMessage.dart';

class ChatScreen extends StatefulWidget {
  @override
  State createState() => new ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = new TextEditingController(); //to manage interactions withing the text field
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Friendlychat")),
      body: new Column(
        children: <Widget>[
          new Flexible(
            child: new ListView.builder(
              padding: new EdgeInsets.all(8.0),
              reverse: true, //starts at the bottom of the screen
              /*This builds each widget in the list. We don't need the current
              build context since the widgets are Stateless, so that param
              becomes an '_' indicating that it wont be used  */
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length
            )
          ),
          new Divider (height: 1.0),
          new Container(
            decoration: new BoxDecoration(
              color: Theme.of(context).cardColor
            ),
            child: _buildTextComposer()
          )
        ]
      )
    );
  }

  Widget _buildTextComposer() {
    /*this method builds and returns a container
    that contains the textFied for inputting texts
    for the message*/

    //this is just for consistent themeing
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      /*to properly implement a good looking field with a send button
       we need a Row object that contains a widget with the container for the
       button and flexible TextField so that the field can adjust to whatever
       space NOT taken up by the button*/
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                controller: _textController,
                //once text is submitted, call clearSubmitted helper function
                onSubmitted: _handleSubmitted,
                decoration: new InputDecoration.collapsed(
                  hintText: "Send a message")
              )
            ),
            new Container(
              margin: new EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: () => _handleSubmitted(_textController.text))
            )
          ]
        )
      )
    );
  }
  void _handleSubmitted(String text) {
    //when the user sends the message, clear the input and add it to the list
    _textController.clear();
    ChatMessage message = new ChatMessage(
      text: text
    );
    //once the message has been sent, use setState the rebuild the UI
    setState(() {
      _messages.insert(0, message);
    });
  }
}