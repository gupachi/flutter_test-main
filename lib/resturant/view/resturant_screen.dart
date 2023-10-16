import 'package:flutter/material.dart';
import 'package:untitled1/resturant/component/resturant_card.dart';
class RestaurantScreen extends StatelessWidget{
  const RestaurantScreen({Key? key}) : super(key:key);
  Widget build(BuildContext context){
    return Container(
    // defaultLayout을 가져오기 때문에 필요없음
    child:Center(
      child:Padding(
       padding: const EdgeInsets.all(8.0),
      child: RestaurantCard(
        image: Image.asset(
          'asset/img/food/ddeok_bok_gi.jpg',
          fit: BoxFit.cover,

      ),
       name:'불타는 떡볶이',
       tags : ['떡볶이','치즈','매운맛'],
       ratingCount : 100,
       deliveryTime : 15,
       deliveryFee : 2000,

      required this.
      , ratings: null,),

      child: Text('홈'),
    ),
    ),
    );
  }
}