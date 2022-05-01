// Developed by Eng Mouaz M AlShahmeh
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_flutter/src/application/state_manager.dart';
import 'package:riverpod_flutter/src/domain/photo.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<Photo>> photos = ref.watch(photoStateFuture);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: const Text('Riverpod Get Dummy API'), centerTitle: true),
      body: photos.when(
          data: (photos) {
            return ListView.builder(
                itemCount: photos.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      context.push('/details', extra: photos[index]);
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(photos[index].thumbnailUrl!),
                      ),
                      title:
                          Text('${photos[index].id}. ${photos[index].title}'),
                    ),
                  );
                });
          },
          error: (e, stack) => Center(
                child: Text(e.toString()),
              ),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
