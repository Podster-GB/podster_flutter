import 'package:flutter/material.dart';
import 'package:podster_flutter/components/list_item.dart';

class ShowItem implements ListItem {
  final String imageUrl;
  final String title;

  ShowItem({@required this.imageUrl, @required this.title});
  
  @override
  Widget buildTile(BuildContext context) {
    return ListTile(
      leading: Image.network(imageUrl),
      title: Text(title),
    );
  }
}