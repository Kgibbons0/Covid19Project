import 'package:covid_dashboard/Widgets/info_card.dart';
import 'package:covid_dashboard/Widgets/line_chart.dart';
import 'package:covid_dashboard/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fl_chart/fl_chart.dart';

class HomeScreen extends StatelessWidget
{@override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: buildAppBar(),
     body: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children:<Widget> [
         Container(
           padding:EdgeInsets.only(left:20,top:20,right:20,bottom:20),
           width: double.infinity,
           decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(.05),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50))),
           child:Wrap(
             runSpacing: 20,
             spacing: 20,
             children: <Widget>[
               InfoCard(
                   title:"Confrimed Cases",
                   iconColor:Colors.red,
                    effectedNum: 50345,
                    ),
               InfoCard(
                 title:"Total Deaths",
                 iconColor:Colors.blueGrey,
                 effectedNum: 1230,
               ),
               InfoCard(
                 title:"Total Recovered",
                 iconColor:Colors.lightGreen,
                 effectedNum: 3001,
               ),
               InfoCard(
                 title:"New Cases",
                 iconColor:Color(0xD8E167),
                 effectedNum: 1120,
               ),
             ],
           ),
         ),
         SizedBox(height: 20,),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 20),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text(
                 "Prevention",
                 style: Theme.of(context)
                     .textTheme
                     .title
                     .copyWith(fontWeight: FontWeight.bold),
               ),
               SizedBox(height: 20,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: <Widget>[
                   PreventionCard(
                       svgSrc: "assets/010-washing hands.svg",
                       title:"Wash Hands"
                   ),
                   PreventionCard(
                       svgSrc: "assets/038-medical mask.svg",
                       title:"Mask Up"
                   ),
                   PreventionCard(
                       svgSrc: "assets/027-spray.svg",
                       title:"Disinfect"
                   )
                 ],
               ),
             ],
           ),
         )
       ]
     ),
   );
  }


AppBar buildAppBar() {
  return AppBar(
      backgroundColor: kPrimaryColor.withOpacity(.03),
      elevation: 0,
      leading: IconButton(
          icon: SvgPicture.asset("assets/menu.svg"),
          onPressed: (){}
          ),
      actions: <Widget>[
        IconButton(icon: SvgPicture.asset("assets/search.svg"),
            onPressed: (){}
            )
      ],
  );
}
}
class PreventionCard extends StatelessWidget {
  final String svgSrc;
  final String title;
  const PreventionCard({
    Key key, this.svgSrc, this.title,
  }) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SvgPicture.asset(
          svgSrc,
          height: 50,
          width: 50,
        ),
        Text(
          title,
          style: Theme
              .of(context)
              .textTheme
              .body2
              .copyWith(color: Colors.lightGreen),
        )
      ],
    );
  }
}