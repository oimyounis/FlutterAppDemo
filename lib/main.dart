import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

import './src/views/detail_view.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: Stack(
          children: <Widget>[
            RandomWords(),
            GestureDetector(
              child: Container(
                width: 450,
                height: 300,
                color: Colors.black38.withOpacity(0.5),
              ),
              onTap: () {
                print('you tapped the container');
              },
            )
          ],
        )
      )
    );
  }
}


class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final List<WordPair> _suggestions = <WordPair>[];
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return _buildSuggestions();
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        // The itemBuilder callback is called once per suggested
        // word pairing, and places each suggestion into a ListTile
        // row. For even rows, the function adds a ListTile row for
        // the word pairing. For odd rows, the function adds a
        // Divider widget to visually separate the entries. Note that
        // the divider may be difficult to see on smaller devices.
        itemBuilder: (BuildContext _context, int i) {
          // Add a one-pixel-high divider widget before each row
          // in the ListView.
          if (i.isOdd) {
            return new Divider();
          }

          // The syntax "i ~/ 2" divides i by 2 and returns an
          // integer result.
          // For example: 1, 2, 3, 4, 5 becomes 0, 1, 1, 2, 2.
          // This calculates the actual number of word pairings
          // in the ListView,minus the divider widgets.
          final int index = i ~/ 2;
          // If you've reached the end of the available word
          // pairings...
          if (index >= _suggestions.length) {
            // ...then generate 10 more and add them to the
            // suggestions list.
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        }
    );
  }

  Widget _buildRow(WordPair pair) {
    return new ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.black,
        child: Text(pair.toString().substring(0,1).toUpperCase()),
      ),
      trailing: Icon(Icons.favorite,
      color: Colors.green,),
      subtitle: Text('My subtitle text'),
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),

      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context) => DetailView(pair))
        );
      },
    );
  }
}

