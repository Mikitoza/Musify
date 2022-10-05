import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'like_cubit.dart';
import 'like_state.dart';

class LikeButton extends StatelessWidget {
  final String name;
  final String fullname;
  final bool isIcon;
  final String cover;
  final int id;
  const LikeButton({
    Key? key,
    required this.name,
    required this.fullname,
    required this.isIcon,
    required this.cover,
    required this.id,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LikeButtonCubit, LikeButtonState>(
      builder: (context, state) {
        if (isIcon) {
          return ListTile(
              minLeadingWidth: 30,
              contentPadding: const EdgeInsets.symmetric(horizontal: 30),
              onTap: () {},
              leading: !state.isLiked
                  ? const Icon(
                      CupertinoIcons.heart,
                      color: Colors.grey,
                    )
                  : Icon(
                      CupertinoIcons.heart_solid,
                      color: Colors.lightGreen[700],
                    ),
              title: Text(
                !state.isLiked ? "like" : "liked",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontSize: 20, color: Colors.white),
              ));
        } else {
          return InkWell(
            onTap: () {},
            child: !state.isLiked
                ? const Icon(
                    CupertinoIcons.heart,
                    color: Colors.grey,
                    size: 30,
                  )
                : Icon(
                    CupertinoIcons.heart_solid,
                    color: Colors.lightGreen[700],
                    size: 30,
                  ),
          );
        }
      },
    );
  }
}
