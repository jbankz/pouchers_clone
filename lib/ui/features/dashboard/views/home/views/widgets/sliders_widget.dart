import 'package:Pouchers/ui/features/admin/data/dao/banner_dao.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SlidersWidget extends HookConsumerWidget {
  const SlidersWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => ValueListenableBuilder<
          Box>(
      valueListenable: bannerDao.getListenable(),
      builder: (_, box, __) {
        final banners = bannerDao.retrieve(box);
        return banners.isEmpty
            ? const SizedBox.shrink()
            : SizedBox(
                height: 146.h,
                child: PageView.builder(
                    clipBehavior: Clip.none,
                    onPageChanged: (value) {},
                    controller:
                        PageController(viewportFraction: .77, initialPage: 1),
                    itemCount: banners.length,
                    itemBuilder: (_, index) => Padding(
                        padding: EdgeInsets.only(right: index == 0 ? 8.w : 8),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.r),
                            child: CachedNetworkImage(
                              imageUrl: banners[index].imageUrl ?? '',
                              progressIndicatorBuilder: (_, __, ___) =>
                                  Image.network(banners[index].imageUrl ?? '',
                                      fit: BoxFit.fill),
                              errorWidget: (_, __, ___) => Image.network(
                                banners[index].imageUrl ?? '',
                                fit: BoxFit.fill,
                              ),
                            )))));
      });
}
