import 'dart:math';
import 'package:flutter/material.dart';
import 'shimmer.dart';
import 'styling.dart';

part 'skeleton.dart';

class SkeletonItem extends StatelessWidget {
  final Widget child;
  const SkeletonItem({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    if (Shimmer.of(context) == null) {
      return ShimmerWidget(
        child: _SkeletonWidget(isLoading: true, skeleton: child),
      );
    }

    return child;
  }
}

class SkeletonAvatar extends StatelessWidget {
  final SkeletonAvatarStyle style;
  const SkeletonAvatar({super.key, this.style = const SkeletonAvatarStyle()});

  @override
  Widget build(BuildContext context) => SkeletonItem(
        child: Padding(
          padding: style.padding,
          child: LayoutBuilder(
            builder: (context, constraints) => Container(
              width: ((style.randomWidth != null && style.randomWidth!) ||
                      (style.randomWidth == null &&
                          (style.minWidth != null && style.maxWidth != null)))
                  ? doubleInRange(
                      style.minWidth ??
                          ((style.maxWidth ?? constraints.maxWidth) / 3),
                      style.maxWidth ?? constraints.maxWidth)
                  : style.width,
              height: ((style.randomHeight != null && style.randomHeight!) ||
                      (style.randomHeight == null &&
                          (style.minHeight != null && style.maxHeight != null)))
                  ? doubleInRange(
                      style.minHeight ??
                          ((style.maxHeight ?? constraints.maxHeight) / 3),
                      style.maxHeight ?? constraints.maxHeight)
                  : style.height,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                shape: style.shape,
                borderRadius:
                    style.shape != BoxShape.circle ? style.borderRadius : null,
              ),
            ),
          ),
        ),
      );
}

class SkeletonLine extends StatelessWidget {
  final SkeletonLineStyle style;
  const SkeletonLine({super.key, this.style = const SkeletonLineStyle()});

  @override
  Widget build(BuildContext context) => SkeletonItem(
        child: Align(
          alignment: style.alignment,
          child: Padding(
              padding: style.padding,
              child: LayoutBuilder(
                builder: (context, constraints) => Container(
                  width: ((style.randomLength != null && style.randomLength!) ||
                          (style.randomLength == null &&
                              (style.minLength != null &&
                                  style.maxLength != null)))
                      ? doubleInRange(
                          style.minLength ??
                              ((style.maxLength ?? constraints.maxWidth) / 3),
                          style.maxLength ?? constraints.maxWidth)
                      : style.width,
                  height: style.height,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: style.borderRadius,
                  ),
                ),
              )),
        ),
      );
}

class SkeletonParagraph extends StatelessWidget {
  final SkeletonParagraphStyle style;

  const SkeletonParagraph(
      {super.key, this.style = const SkeletonParagraphStyle()});

  @override
  Widget build(BuildContext context) => SkeletonItem(
        child: Padding(
          padding: style.padding,
          child: Column(
            children: [
              for (var i = 1; i <= style.lines; i++) ...[
                SkeletonLine(
                  style: style.lineStyle,
                ),
                if (i != style.lines)
                  SizedBox(
                    height: style.spacing,
                  )
              ]
            ],
          ),
        ),
      );
}

class SkeletonListTile extends StatelessWidget {
  final bool hasLeading;
  final SkeletonAvatarStyle? leadingStyle;
  final SkeletonLineStyle? titleStyle;
  final bool hasSubtitle;
  final SkeletonLineStyle? subtitleStyle;
  final EdgeInsetsGeometry? padding;
  final double? contentSpacing;
  final double? verticalSpacing;
  final Widget? trailing;

  const SkeletonListTile(
      {super.key,
      this.hasLeading = true,
      this.leadingStyle,
      this.titleStyle = const SkeletonLineStyle(height: 22),
      this.subtitleStyle = const SkeletonLineStyle(
        height: 16,
        padding: EdgeInsetsDirectional.only(end: 32),
      ),
      this.hasSubtitle = false,
      this.padding = const EdgeInsets.symmetric(vertical: 8),
      this.contentSpacing = 8,
      this.verticalSpacing = 8,
      this.trailing});

  @override
  Widget build(BuildContext context) => SkeletonItem(
        child: Padding(
          padding: padding ?? EdgeInsets.zero,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (hasLeading)
                SkeletonAvatar(
                  style: leadingStyle ?? const SkeletonAvatarStyle(),
                ),
              SizedBox(
                width: contentSpacing,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SkeletonLine(
                      style: titleStyle ?? const SkeletonLineStyle(),
                    ),
                    if (hasSubtitle) ...[
                      SizedBox(
                        height: verticalSpacing,
                      ),
                      SkeletonLine(
                        style: subtitleStyle ?? const SkeletonLineStyle(),
                      ),
                    ]
                  ],
                ),
              ),
              if (trailing != null) trailing!,
            ],
          ),
        ),
      );
}

class SkeletonListView extends StatelessWidget {
  final Widget? item;
  final Widget Function(BuildContext, int)? itemBuilder;
  final int? itemCount;
  final bool scrollable;
  final EdgeInsets? padding;
  final double? spacing;

  const SkeletonListView(
      {super.key,
      this.item,
      this.itemBuilder,
      this.itemCount,
      this.scrollable = false,
      this.padding = const EdgeInsets.symmetric(horizontal: 16),
      this.spacing = 8});

  @override
  Widget build(BuildContext context) => SkeletonItem(
        child: ListView.builder(
          padding: padding,
          physics: scrollable ? null : const NeverScrollableScrollPhysics(),
          itemCount: itemCount,
          itemBuilder: itemBuilder ??
              (context, index) =>
                  item ?? const SkeletonListTile(hasSubtitle: true),
        ),
      );
}

double doubleInRange(num start, num end) =>
    Random().nextDouble() * (end - start) + start;
