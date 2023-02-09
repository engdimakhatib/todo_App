import '../cubit/cubit.dart';
import '../cubit/newsState.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
 
  BlocConsumer<NewsCubit , NewsState>,
  listener : ( context , state){},
  builder : (context , state)
  {
    var cubit=NewsCubit.get(context);
    return Scaffold(
      appBar:AppBar(
        title : Text(),
        actions : [
          IconButton(icon : Icons.brightness_4_outlined ,
           onPressed:(){
            AppCubit.get(context).changeAppMode();
          }),
            IconButton(icon : Icons.search , onPressed:()
            {
             navigateTo(context , SearchScreen(),);
            }),
        ]
      ),
      body : cubit.screens[cubit.currentIbdex],
      bottomNavigationBar : BottomNavigationBar(),

      );
  },
    
  }
  }

