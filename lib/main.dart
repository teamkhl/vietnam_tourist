import 'package:flutter/material.dart';
import 'package:vietnam_tourist/pages/editingProfile.dart';
import 'package:vietnam_tourist/pages/newPlacename.dart';
import 'package:vietnam_tourist/pages/placenameDetails.dart';
import 'package:vietnam_tourist/pages/search.dart';
import 'package:vietnam_tourist/widget/button_builder.dart';
import 'package:vietnam_tourist/widget/text_form_field_builder.dart';

void main() {
  runApp(const MyApp());
}

// Hãy luôn nhớ ghi chú cho từng dòng lệnh nhé !
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vietnam tourist',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),

      home: 
    
      // NewPlacename()
      
      Search()

      // EdittingProfile()
      
      // PlacenameDetail(image:"assets/images/rome.jpg",
      // title: "Rome City",
      // longitude:"33",
      // latitude: "12",
      // description: " Rome (Italian: Roma), the Eternal City, is the capital and largest city of Italy and of the Lazio region. It is famous for being the home of the ancient Roman Empire, the Seven Hills, La Dolce Vita (the sweet life), the Vatican City and Three Coins in the Fountain.",
      // specialties: "cio e Pepe, Carbonara, Gelato, Maritozzi, Pizza al Taglio, Porchetta,cio e Pepe, Carbonara, Gelato, Maritozzi, Pizza al Taglio, Porchetta,Cacio e Pepe, Carbonara, Gelato, Maritozzi, Pizza al Taglio, Porchetta. cio e Pepe, Carbonara, Gelato, Maritozzi, Pizza al Taglio, Porchetta",)
    
   
    );
  }
}
