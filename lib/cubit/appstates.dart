abstract class AppStates{}

class AppInitialStates extends AppStates{}

//1-run BottomNavigationBar with bloc
class AppChangeBottomNavBarState extends AppStates{}

//2-states for DB
class AppCreateDatabaseState extends AppStates{}

class AppGetDatabaseState extends AppStates{}

class AppInsertDatabaseState extends AppStates{}

class AppChangeBottomSheetState extends AppStates{}
//to move circularIndicator
class AppGetDatabaseLoadingState extends AppStates{}

class AppUpdateDatabaseState extends AppStates{}

class AppDeleteDatabaseState extends AppStates{}

class AppChangeModeState extends AppStates{}