import 'package:flutter/material.dart';

class SearchResultsTile extends StatelessWidget {
  const SearchResultsTile({
    super.key,
    this.imgSize = 75,
    this.imgRadius = 4,
    this.imgPath,
    this.category,
    this.title,
    this.isResult = true,
    this.resultCount,
    this.location,
  });
  final double imgSize;
  final String? imgPath;
  final double imgRadius;
  final String? category;
  final String? title;
  final String? resultCount;
  final String? location;
  final bool isResult;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 8),
          width: imgSize,
          height: imgSize,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                imgPath ?? 'https://picsum.photos/250?image=9',
              ),
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(isResult ? 60 : imgRadius),
            ),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isResult ? const SizedBox.shrink() : Text(category ?? 'FOR MEN'),
            Text(title ?? 'Miko Salon'),
            isResult ? Text(resultCount ?? '122 Results') : Text(location ?? 'Ranchview'),
          ],
        ),
      ],
    );
  }
}
