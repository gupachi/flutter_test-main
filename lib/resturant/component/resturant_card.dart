import 'package:flutter/material.dart';
import 'package:untitled1/common/const/colors.dart';
class RestaurantCard extends StatelessWidget {
  final Widget  image;
  final String name;
  final List<String> tags;
  final int ratingCount;
  final int deliveryTime;
  final int deliveryFee;
  final double ratings;
  const RestaurantCard({
    required this.image,
    required this.name,
    required this.tags,
    required this.ratingCount,
    required this.deliveryTime,
    required this.deliveryFee,
    required this.ratings,

    Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: image,
        ),
        const SizedBox(height: 16.0),
        Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:[
        Text(
          name,
       style: TextStyle(
        fontSize: 20.0,
    ),
        ),
          const SizedBox(height: 16.0),
    Text(tags.join(' ·'),
      style: TextStyle(
        color: BODY_TEXT_COLOR,
        fontSize: 14.0,

      ),

    ),
          const SizedBox(height: 8.0),
          Row(
            children: [
              _IconText(icon: Icons.star, label:
             ratings.toString(),
              ),
              renderDot(),
              _IconText(icon: Icons.receipt, label:
              ratingCount.toString(),
              ),
              renderDot(),
              _IconText(icon: Icons.timelapse_outlined, label:
                '$deliveryTime 분',
              ),
              renderDot(),
              _IconText(icon: Icons.monetization_on, label:
              deliveryFee == 0 ? '무료' : deliveryFee.toString(),

              ),
              renderDot(),
            ],
          )
      ],
    ),
    ],
    );
  }

}
renderDot(){
  return Padding(padding: const EdgeInsets.symmetric(horizontal: 4.0),
 child: Text(

    '.',
  style:TextStyle(
  fontSize: 12.0,
  fontWeight:FontWeight.w500,
  ),
  ),
  );
}
// icon
class _IconText extends StatelessWidget{
  final IconData icon;
  final String label;
  const _IconText({
    required this.icon, required this.label, Key? key})
  : super(key: key);

  get deliveryTime => null;

  get ratings => null;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: PRIMARY_COLOR,
          size: 14.0,
        ),
        const SizedBox(width : 8.0),
        Text(
          label,
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w500,

          ),
        ),
        const SizedBox(width: 8.0),
        Row(
          children: [
            _IconText(icon: Icons.star, label: ratings.toString()
            ),
            _IconText(icon: Icons.receipt, label: ratingCount.toString()),
            _IconText(icon: Icons.timelapse_outlined, label: '$deliveryTime 분',
            ),
            _IconText(icon: Icons.monetization_on, label: deliveryFee.toString()),

          ],

        )
      ],
    );
  }}
