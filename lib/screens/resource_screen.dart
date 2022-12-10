import 'package:flutter/material.dart';
import 'package:homebrew_dripper/models/resource_info.dart';

class ResourceDetailScreen extends StatelessWidget {
  ResourceInfo resource;
  ResourceDetailScreen(this.resource);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resources"),
        //backgroundColor: Colors.transparent,
        //elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xFF4C748B),
            ),
            key: Key('goBackR'),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Column(
        children: [
          Text("${resource.link}"),
        ],
      ),
    );
  }
}
