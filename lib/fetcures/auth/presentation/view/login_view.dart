
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'widgets/body_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  static  List<Map<String,dynamic>>flutter=[
    {
      'question':'What is Flutter?',
      'choice':[
        'A programming language',
        'A mobile app development framework',
        ' A database management system',
        ' An operating system',
      ],
      'answer':'A mobile app development framework'
    },
    {
      'question':'What is the purpose of the Flutter Engine?',
      'choice':[
        'To compile Dart code to machine code',
        ' To provide a library of pre-built widgets',
        'To manage the state of the application',
        ' To handle HTTP requests',
      ],
      'answer':'To compile Dart code to machine code'
    },
    {
      'question':' Which programming language is used for Flutter development?',
      'choice':[
        'Java ',
        'Swift',
        'Dart',
        'Python',
      ],
      'answer':'Dart'
    },
    {
      'question':' What is a widget in Flutter?',
      'choice':[
        'A visual element in the user interface',
        'A block of code that performs a specific task',
        'A method for handling user input',
        'A type of data structure',
      ],
      'answer':'A visual element in the user interface'
    },
    {
      'question':' What is the purpose of the runApp() function in Flutter?',
      'choice':[
        'To start the Flutter application',
        'To define the layout of the user interface',
        'To handle user input',
        'To manage the state of the application',
      ],
      'answer':'To start the Flutter application'
    },
    {
      'question':'Which widget is used to create a button in Flutter?',
      'choice':[
        'Text',
        'Image',
        'IconButton',
        'MaterialButton',
      ],
      'answer':'MaterialButton'
    },
    {
      'question':'Which widget is used to create a drawer in Flutter?',
      'choice':[
        'DrawerWidget',
        'DrawerLayout',
        'Drawer',
        'NavigationDrawer',
      ],
      'answer':'Drawer'
    },
    {
      'question':'Which widget is used to create a tab bar in Flutter?',
      'choice':[
        'TabBarWidget',
        'TabLayout',
        'TabBar',
        'NavigationTabBar',
      ],
      'answer':'TabBar'
    },
    {
      'question':'Which widget is used to create a list in Flutter?',
      'choice':[
        'ListView',
        'ListWidget',
        'ListLayout',
        'ListContainer',
      ],
      'answer':'ListView'
    },
    {
      'question':'SnackBar widget is used if you want to let your app pop up a message............... at the bottom of your app interface',
      'choice':[
        'For a few seconds',
        'Forever',
        'Until the app user taps the close button of this message',
        'Until the app user taps the OK button for of message',
      ],
      'answer':'For a few seconds'
    },
    {
      'question':'How many child widgets can be added to the Container widget?',
      'choice':[
        'Unlimited children widgets',
        'Only one child widget',
        'Two children widgets',
        'Three children widgets',
      ],
      'answer':'Only one child widget'
    },
    {
      'question':'Which of the following property should you use to add a label, icon, and an inline hint text to the TextField widget ?',
      'choice':[
        'ListView',
        'InputDecoration',
        'SizeBox',
        ' shrinkWrap: true',
      ],
      'answer':'InputDecoration'
    },
    {
      'question':'This widget helps you to have a specific width and/or height between widgets.Which of the following term is this definition for?',
      'choice':[
        'AppBar',
        'SizedBox',
        'SafeArea',
        'onChanged',
      ],
      'answer':'SizedBox'
    },
    {
      'question':'What is the purpose of the InkWell widget in Flutter?',
      'choice':[
        'To create a new widget',
        'To provide a set of material design widgets',
        'To provide a visual feedback when the user taps on a widget',
        'To manage the state of the application',
      ],
      'answer':'To provide a visual feedback when the user taps on a widget'
    },
    {
      'question':'Which widget is used to create a dropdown button in Flutter?',
      'choice':[
        'DropdownButton',
        'DropdownWidget',
        'DropButton',
        'All of the above',
      ],
      'answer':'DropdownButton'
    },
    {
      'question':'What is the purpose of the Scaffold widget in Flutter?',
      'choice':[
        'To create a new widget',
        'To provide a set of material design widgets',
        'To provide a layout for the application’s pages',
        'To manage the state of the application',
      ],
      'answer':'To provide a layout for the application’s pages'
    },
    {
      'question':'What is the purpose of the ListView widget in Flutter?',
      'choice':[
        'To display a collection of widgets in a scrollable list',
        'To create a new widget',
        'To provide a set of material design widgets',
        'To provide a flexible container for layout and styling',
      ],
      'answer':'To display a collection of widgets in a scrollable list'
    },
    {
      'question':'Which widget is used to create a grid in Flutter?',
      'choice':[
        'GridView',
        'GridWidget',
        'GridLayout',
        'GridContainer',
      ],
      'answer':'GridView'
    },
    {
      'question':'Which widget is used to create a progress indicator in Flutter?',
      'choice':[
        'ProgressIndicator',
        'CircularProgress',
        'LinearProgressIndicator',
        'All of the above',
      ],
      'answer':'All of the above'
    },
    {
      'question':'What is the purpose of the Container widget in Flutter?',
      'choice':[
        'To provide a set of material design widgets',
        'To manage the state of the application',
        'To create a new widget',
        'To provide a flexible container for layout and styling',
      ],
      'answer':'To provide a flexible container for layout and styling'
    },
    {
      'question':'Which widget is used to create a switch in Flutter?',
      'choice':[
        'ToggleSwitch',
        'Switch',
        'OnOffSwitch',
        'All of the above',
      ],
      'answer':'Switch'
    },
    {
      'question':'What is the purpose of the StatefulWidget in Flutter?',
      'choice':[
        'To create a new widget',
        'To manage the state of the application',
        'To build a widget tree based on the state of a future',
        'To build a widget tree that does not depend on any mutable state',
      ],
      'answer':'To manage the state of the application'
    },
    {
      'question':'What is the purpose of the StatelessWidget in Flutter?',
      'choice':[
        'To build a widget tree based on the state of a future',
        'To manage the state of the application',
        'To create a new widget',
        'To build a widget tree that does not depend on any mutable state',
      ],
      'answer':'To build a widget tree that does not depend on any mutable state'
    },
    {
      'question':'What is the purpose of the FutureBuilder widget in Flutter?',
      'choice':[
        'To build a widget tree based on the state of a future',
        'To handle user input',
        'To create a new widget',
        'To manage the state of the application',
      ],
      'answer':'To build a widget tree based on the state of a future'
    },
    {
      'question':'What is the purpose of the Navigator widget in Flutter?',
      'choice':[
        'To create a new widget',
        ' To manage the state of the application',
        'To handle user input',
        'To navigate between different screens in the app',
      ],
      'answer':'To navigate between different screens in the app'
    },
    {
      'question':'What is the purpose of the MaterialApp widget in Flutter?',
      'choice':[
        'To define the layout of the user interface',
        'To handle user input',
        'To manage the state of the application',
        'To provide a set of material design widgets',
      ],
      'answer':'To provide a set of material design widgets'
    },
    {
      'question':'Which widget is used to create a text input field in Flutter?',
      'choice':[
        'TextField',
        'Text',
        'TextInput',
        'InputField',
      ],
      'answer':'TextField'
    },
    {
      'question':'Which widget is used to display an image in Flutter?',
      'choice':[
        'ImageField',
        'ImageWidget',
        'Image',
        'ImageView',
      ],
      'answer':'Image'
    },
    {
      'question':'What is hot reload in Flutter?',
      'choice':[
        'A feature that allows developers to see the changes they make to the code in real-time',
        ' A feature that automatically saves code changes as they are made',
        'A feature that optimizes the performance of the app',
        'A feature that provides real-time analytics for the app',
      ],
      'answer':'A feature that allows developers to see the changes they make to the code in real-time'
    },
    {
      'question':'What is the purpose of the setState() method in Flutter?',
      'choice':[
        'To create a new widget',
        'To manage the state of the application',
        'To handle user input',
        'To define the layout of the user interface',
      ],
      'answer':'To manage the state of the application'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:BodyLoginWidget() ,
    );
  }
}






