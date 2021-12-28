
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vietnam_tourist/widget/button_builder.dart';
import 'package:vietnam_tourist/widget/text_form_field_builder.dart';
import 'package:vietnam_tourist/widget/comment_builder.dart';

class PlacenameDetail extends StatefulWidget {
  const PlacenameDetail({Key? key,required this.image,required this.title,required this.longitude,required this.latitude,required this.description,required this.specialties}) : super(key: key);
  final String image;
  final String title;
  final String longitude;
  final String latitude;
    final String description;
  final String specialties;


  
  @override
  _PlacenameDetailState createState() => _PlacenameDetailState();
}


class _PlacenameDetailState extends State<PlacenameDetail> {
Container bottomInfo()
{
  return Container(
    padding: EdgeInsets.only(left: 10),
    child: Column(children: [
    Text("Banh Trang Tron",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),Text(widget.description,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),textAlign: TextAlign.left,),
    Text("SPECIALTIES",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),Text(widget.specialties,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),textAlign: TextAlign.left,),
    


    ],),

  );
}

  Container topInfo()
{
 return  Container(
  //  padding: EdgeInsets.only(left: 20,right: 20,top: 12,bottom: 12),
   child:Column(
     children: [Container(
  width: MediaQuery.of(context).size.width,
  height: 250,
  decoration: BoxDecoration(
    image: DecorationImage(
      fit: BoxFit.cover,
      image: NetworkImage("assets/images/rome.jpg"),
    ),
  ),
),

   Container(padding: EdgeInsets.only(top:20,left: 20),
    child: Text(widget.title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35)),)
    ,Container( padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
    child: Row(children:[Icon(Icons.location_on,size: 16,color: Colors.grey,),
    Text(widget.latitude+"°N ",style: TextStyle(color: Colors.grey,fontSize: 13)),
    Text(widget.longitude +"°E",style: TextStyle(color: Colors.grey,fontSize: 13))],),
     
    ) 
    
    ],));}



  @override
  Widget build(BuildContext context) {
      return Scaffold(
      
      body: Container(color: Colors.white, child:  ListView(children: [
        topInfo(),
        bottomInfo(),
      // con 1 cai cmt 
      
      ],))
      ,bottomNavigationBar: BottomAppBar(child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //ButtonBuilder(context, "Like", () {}, 70),
              ButtonBuilder(text: "Like"),
              ButtonBuilder(text: "Share")
            ],
          ),
        ),),
       );
        }
}

      