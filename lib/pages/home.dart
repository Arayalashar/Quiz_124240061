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
                  builder: (context) => DetailPage(food: culinaryList[index]),
                ),
              );
            },
            child: ListTile(
              title: Text(culinaryList[index].name),
              subtitle: Text('${culinaryList[index].category}'" - "'${culinaryList[index].origin}'),
              leading: Image.network(culinaryList[index].imageUrl, width: 50, height: 50, fit: BoxFit.cover),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          );
        });
  }
}