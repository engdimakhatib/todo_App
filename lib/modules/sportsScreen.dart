import 'package:flutter/material.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit , NewsState>(
      listener : (context , state){},
      builder : (context , state)
      {
   var list=NewsCubit.get(context).science;
         return articleBuilder(list ,context);
      } 
    );
  }
}