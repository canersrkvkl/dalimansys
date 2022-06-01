import 'package:flutter/material.dart';

class NameSearch extends SearchDelegate{

  final List<String> names;

  NameSearch(this.names);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){},
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    final suggestions = names.where((name){
      return name.toLowerCase().contains(query.toLowerCase());
    });
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index){
        return ListTile(
          title: Text(suggestions.elementAt(index)),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = names.where((name){
      return name.toLowerCase().contains(query.toLowerCase());
    });
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index){
        return ListTile(
          title: Text(suggestions.elementAt(index)),
        );
      },
    );
  }
  
}