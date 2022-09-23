import 'package:contact_app/contacts.dart';
import 'package:contact_app/landing.dart';
import 'package:contact_app/utils/custom_theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(Icons.home,color: CustomTheme.blue,),
        title: Text(
         'Contact Manager',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){},
           icon: const Icon(Icons.menu,color: CustomTheme.blue,)
           )
        ],
      ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35), topRight: Radius.circular(35)),
              boxShadow: CustomTheme.buttonShadow),
          child: const TabBar(
              padding: EdgeInsets.symmetric(vertical: 10),
              indicatorColor: Colors.transparent,
              tabs: [
                Tab(icon: Icon(Icons.home,color: CustomTheme.blue)),
                Tab(icon: Icon(Icons.phone,color: CustomTheme.blue)),
              ]),
        ),
        body: const TabBarView(children: [
          LandingScreen(),
          ContactScreen(),
        ]),
      ),
    );
  }
}
