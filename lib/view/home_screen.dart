import 'package:flutter/material.dart';

class Meal {
  String imageSrc;

  String title;

  Meal({this.imageSrc, this.title});
}

class HomePage extends StatefulWidget {
  final List<Meal> list = <Meal>[
    Meal(imageSrc: 'assets/52770.jpg', title: 'Xiyar'),
    Meal(imageSrc: 'assets/52783.jpg', title: 'Pomidor'),
    Meal(imageSrc: 'assets/52796.jpg', title: 'Lobya'),
  ];

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: Search(widget.list));
            },
            icon: Icon(Icons.search),
          )
        ],
        centerTitle: true,
        title: Text('Search Bar'),
      ),
      body: ListView.builder(
        itemCount: widget.list.length,
        itemBuilder: (context, index) {
          var meal = widget.list[index];
          return ListTile(
            leading: Image(image: AssetImage(meal.imageSrc)),
            title: Text(meal.title),
            subtitle: Text('sadsdadasd'),
          );
        },
      ),
    );
  }
}

class Search extends SearchDelegate<Meal> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  String selectedResult = "";

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Center(
        child: Text(selectedResult),
      ),
    );
  }

  final List<Meal> listExample;
  Search(this.listExample);

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Meal> suggestionList = [];
    query.isEmpty
        ? suggestionList = listExample //In the true case
        : suggestionList.addAll(listExample.where(
            // In the false case
            (element) => element.title.contains(query),
          ));

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        var meal = suggestionList[index];
        return ListTile(
            title: Image(image: AssetImage(meal.imageSrc)),
            subtitle: Text(meal.title));
      },
    );
  }
}
