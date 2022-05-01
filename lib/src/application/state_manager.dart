// Developed by Eng Mouaz M AlShahmeh
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_flutter/src/data/network.dart';
import 'package:riverpod_flutter/src/domain/photo.dart';

final photoStateFuture = FutureProvider<List<Photo>>((ref) async {
  return fetchPhotos();
});
