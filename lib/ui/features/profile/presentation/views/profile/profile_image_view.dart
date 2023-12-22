import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

import '../../../data/dao/user_dao.dart';

class ProfileImageView extends StatelessWidget {
  const ProfileImageView({super.key});

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<Box>(
      valueListenable: userDao.getListenable(),
      builder: (_, box, __) {
        final user = userDao.returnUser(box);
        return Scaffold(
          appBar: AppBar(),
          body: Hero(
            tag: user.profilePicture ?? '',
            child: Center(
              child: CachedNetworkImage(
                imageUrl: user.profilePicture ?? '',
                width: double.infinity,
                height: 400.h,
              ),
            ),
          ),
        );
      });
}
