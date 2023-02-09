import 'package:flutter/material.dart';

Widget buildArticleItem(article ,context)=> InWell(
  onTap : ()
  {
    navigateTo(context, WebView(article['url']));
  },
  child :Padding(
  padding : const EdgeInsets.all(20.0),
  child : Row(
    children:[
      Container(
        width : 20.0,
        height : 120.0,
        decoration : BoxDecoration(
          borderRadius : BorderRadius.circular(10.0),
          image : DecorationImage(
            image : NetworkImage('${article['urlToImage']}'),
            fit : BoxFit.cover,
          ),
        ),
          ),
        SizedBox(width:20.0),
        Expanded(
          child : Container(
           height : 120.0,
           child : Column(
            children:[
              crossAxisAlignment : CrossAxisAlignment.start,
            mainAxisAlignment : MainAxisAlignment.start,
            Expanded(
              child : Text('${article['title']}'),
              style : Theme.of(context).textTheme.bodyText1,
              maxLines : 3,
              overflow : TextOverFlow.ellipsis,
            ),
           Text('${article['PublishedAt']}',style:TextStyle(color : Colors.grey),), 
            ],
           ),
          ),
        ),
    
    ],
  ),
),
);


Widget myDivider() => Padding(
     padding : const EdgeInsetsDirectional.only(start:20.0),
     child : Container(
       width : double.infinity,
       height : 1.0,
       color : Colors.grey[300],
     ),
   );

   Widget articleBuilder (list ,context , {isSearch = false}) =>  ConditionalBuilder(
    condition : list.length > 0,
    builder : (context) => ListView.separated(
      physics : BouncingScrollPhysics,
      itemCount: 10,
      separatorBuilder: (BuildContext context, int index)=>myDivider(),
      itemBuilder: (BuildContext context, int index)=>  buildArticleItem(list[index] ,context),
    ),
    fallback :(context)=> isSearch ? Container() : Center(child : CircularProgressIndicator()),
   
   );
   Widget  defaultTextField({
  required TextEditingController controller ,
  required TextInputType type,
 //required FormFieldValidator validate,
   required final FormFieldValidator<String> validate,
  required String label ,
  required IconData prefix ,
  ValueChanged<String>?  onSubmit,
   ValueChanged<String>?   onChanged,
  IconData? suffix ,
  Function? suffixPressed ,
  InputBorder? border,
  bool? obsecureText ,
})=> TextFormField (    
              controller : controller,
              keyboardType : type,
              onFieldSubmitted : onSubmit,
              onChanged :  onChanged,               
              decoration : InputDecoration(
                labelText :label,
                //hinText : 'EmailAddress',
                prefixIcon :Icon(prefix) ,
                border : border, 
                suffixIcon : suffix !=null ?
                            IconButton(
                              icon :Icon(suffix) ,
                                 onPressed :(() => suffixPressed) ,
                            )
                            : null,
              ),
            validator :validate,         
            obscureText : obsecureText ?? false ,
            );  
void navigateTo(context , widget)=>Navigator.push(
  context,
MaterialPageRoute(builder : (context) => widget),
);