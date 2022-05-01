// Developed by Eng Mouaz M AlShahmeh
import 'package:flutter/material.dart';
import 'package:riverpod_flutter/src/domain/photo.dart';

class PhotoDetails extends StatelessWidget {
  const PhotoDetails({Key? key, required this.photo}) : super(key: key);
  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(title: Text(photo.title!), centerTitle: true),
      body: Column(
        children: [
          const SizedBox(height: 10),
          CircleAvatar(
            radius: 150,
            backgroundImage: NetworkImage(photo.thumbnailUrl!),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Text(photo.title!,
                style: const TextStyle(fontSize: 28),
                textAlign: TextAlign.center),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Text(photo.url!,
                style: const TextStyle(fontSize: 20, color: Colors.blue),
                textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}
