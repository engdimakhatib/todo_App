import 'package:flutter/material.dart';

import '../shared/component.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit , NewsState>(
       listener : (context , state){},
      builder : (context , state)
      {
   var list=NewsCubit.get(context).science;
         return articleBuilder(list,context);
      } 
    
    );
  }
}