import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit , NewsState>(
listener : (context , state){},
builder : (context ,state){
  var list =NewsCubit.get(context).search;
 return Scaffold(

    appBar : AppBar(),
      body : Column(
        children:[
          Padding (
            padding : const EdgeInsts.all(20.0),
            child :    defaultTextField(
    controller : searchController,
    type : TextInputType,
    onChange :(value)
    {
NewsCubit,get(context).getSearch(value);
    },
    validate : (String value) 
    {
      if(value.isEmpty)
      {
return 'search musnt be empty';
      }
      
      return null;
    }
    ,
    label :'search' ,
    prefix : Icons.search,
   ),
          ),
Expanded( child : articleBuilder (list ,context , isSearch : true,) ,),


        ],
      ),
    );
},
    );
   
  }
}