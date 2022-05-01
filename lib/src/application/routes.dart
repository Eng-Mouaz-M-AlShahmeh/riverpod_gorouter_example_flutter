// Developed by Eng Mouaz M AlShahmeh
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_flutter/src/domain/photo.dart';
import 'package:riverpod_flutter/src/presentation/photo_details.dart';
import 'package:riverpod_flutter/src/presentation/photos_list.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => const HomePage(),
    ),
    GoRoute(
        path: '/details',
        builder: (BuildContext context, GoRouterState state) {
          return PhotoDetails(photo: state.extra! as Photo);
        }),
  ],
);
