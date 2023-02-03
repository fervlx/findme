import 'package:flutter/material.dart';

class SearchSiteDelegate extends SearchDelegate {

  SearchSiteDelegate() : super(searchFieldLabel: 'Buscar', searchFieldStyle: const TextStyle( fontSize: 18.0 ));

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = ''
        ,
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListTile(title: Text('Result'));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListTile(title: Text('suggestion'));
  }

}