import 'package:flutter/material.dart';
import '../models/culinaryList.dart';
import 'detail.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: culinaryList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(culinary: culinaryList[index]),
                ),
              );
            },
            child: ListTile(
              title: Text(culinaryList[index].name),
              subtitle: Text(culinaryList[index].category),
              leading: Image.network(culinaryList[index].imageUrl),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          );
        });
  }
}