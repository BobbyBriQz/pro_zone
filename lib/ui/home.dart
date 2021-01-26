
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:pro_zone/bloc/AppBloc.dart';
import 'package:pro_zone/models/provider.dart' as Pro;
import 'package:pro_zone/utils/size_config.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AppBloc bloc;
  var isLocationSelected = false;
  var isNameSelected = true;
  var dropDownValue = "Select parameter";
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void addProvider() {
    Navigator.pushNamed(context, "/addProvider");
  }
  void viewProvider(Pro.Provider provider) {
    Navigator.pushNamed(context, "/viewProvider", arguments: {"provider":provider});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){

      bloc.getProviders(null, null);
    });
  }



  @override
  Widget build(BuildContext context) {
    bloc = Provider.of<AppBloc>(context);
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: Color(0xf5f5f5ff),
      key: _scaffoldKey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Container(
                height: 90,
                width: SizeConfig.percentHorizontal * 95,
                //color: Colors.red,
                child: FloatingSearchBar(
                  hint: 'Search Provider',
                  scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
                  transitionDuration: const Duration(milliseconds: 800),
                  transitionCurve: Curves.easeInOut,
                  physics: const BouncingScrollPhysics(),
                  axisAlignment: 0.0,
                  openAxisAlignment: 0.0,
                  maxWidth: SizeConfig.percentHorizontal * 95,
                  debounceDelay: const Duration(milliseconds: 500),
                  onSubmitted: (query) {
                    /*_scaffoldKey.currentState.showSnackBar(SnackBar(
                      content: Text(
                          "isNameSelected: $isNameSelected, isLocationSelected: $isLocationSelected"),
                    ));*/

                    bloc.getProviders(query, null);
                  },
                  // Specify a custom transition to be used for
                  // animating between opened and closed stated.
                  transition: CircularFloatingSearchBarTransition(),
                  actions: [
                    FloatingSearchBarAction(
                      showIfOpened: true,
                      child: CircularButton(
                        icon: isLocationSelected
                            ? const Icon(
                                Icons.place,
                                color: Colors.green,
                              )
                            : const Icon(Icons.place),
                        onPressed: () {
                          isLocationSelected = !isLocationSelected;
                          setState(() {});
                        },
                      ),
                    ),
                    FloatingSearchBarAction(
                      showIfOpened: true,
                      child: CircularButton(
                        icon: isNameSelected
                            ? const Icon(
                                Icons.my_library_books_outlined,
                                color: Colors.green,
                              )
                            : const Icon(
                                Icons.my_library_books_outlined,
                              ),
                        onPressed: () {
                          isNameSelected = !isNameSelected;
                          setState(() {});
                        },
                      ),
                    ),
                    FloatingSearchBarAction.searchToClear(
                      showIfClosed: false,
                    ),
                  ],
                  builder: (context, transition) {
                    return Container();
                    /*ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Material(
                        color: Colors.white,
                        elevation: 4.0,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: Colors.accents.map((color) {
                            return Container(height: 112, color: color);
                          }).toList(),
                        ),
                      ),
                    );*/
                  },
                )),
          ),
          Center(
            child: Container(
              height: 50,
              width: SizeConfig.percentHorizontal * 95,
              //color: Colors.red,
              child: Row(
                children: [
                  Spacer(
                    flex: 2,
                  ),
                  Text("Filter by: "),
                  Spacer(),
                  DropdownButton(
                      hint: Text("Select parameter"),
                      value: dropDownValue,
                      items: [
                        DropdownMenuItem(
                          child: Text("Select parameter"),
                          value: "Select parameter",
                        ),
                        DropdownMenuItem(
                          child: Text("Type"),
                          value: "Type",
                        ),
                        DropdownMenuItem(
                          child: Text("Onboarding Status"),
                          value: "Status",
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          dropDownValue = value;
                          bloc.getProviders(null, value);
                        });
                      }),
                  Spacer(flex: 2)
                ],
              ),
            ),
          ),

          Expanded(
            child: Container(
              // color: Colors.blue,
              child: StreamBuilder<List<Pro.Provider>>(
                stream: bloc.providerData,
                initialData: [],
                builder: (context, snapshot) {

                  var providers = snapshot.data;

                  if(providers.length == 0){
                    return Center(
                      child: SpinKitChasingDots(
                        color: Colors.green,
                      )
                    );
                  }

                  return StreamBuilder<bool>(
                    stream: bloc.loadingListState,
                    initialData: false,
                    builder: (context, snapshot) {
                      if(snapshot.data == true){
                        return Center(
                          child: SpinKitChasingDots(
                            color: Colors.green,
                          ),
                        );
                      }

                      if(providers.length == 0 && snapshot.data == false){
                        return Center(
                            child: Text("No Providers currently available")
                        );
                      }

                      return ListView.builder(
                        itemCount: providers.length,
                        itemBuilder: (context, x){

                          var provider = providers.elementAt(x);
                          return GestureDetector(
                            onTap: (){
                              viewProvider(provider);
                            },
                            child: Card(
                              child: Container(
                                height: 80,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                                    Row(
                                      children: [
                                        Spacer(flex: 10,),
                                        Text("${provider.name}", style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18
                                        ),),
                                        Spacer(),
                                        provider.activeStatus == "Active"? Icon(Icons.verified, color: Colors.green)
                                            : Icon(Icons.verified_outlined, color: Colors.grey,) ,
                                        Spacer(flex: 10,),
                                      ],
                                    ),
                                    //Center(child: ),

                                    Row(
                                      children: [
                                        Spacer(flex: 10,),
                                        Text("Provider Type: "),
                                        Spacer(),
                                        Text("${provider.providerType.name}"),
                                        Spacer(flex: 10,),
                                      ],
                                    ),

                                    //Center(child: Text("Provider Type: Hospital$x")),

                                    Row(
                                      children: [
                                        Spacer(),
                                        RatingBarIndicator(
                                          rating: provider.rating == null?0: provider.rating.toDouble(),
                                            itemCount: 5,
                                            itemSize: 20,
                                            itemBuilder: (context, x){
                                          return Icon(Icons.star, color: Colors.amber,);
                                        }),
                                        Spacer(flex: 5,),
                                        Text("In ${provider.state.name}"),
                                        Spacer(),
                                      ],
                                    ),
                                  ]
                                ),
                              ),
                            ),
                          );

                        },
                      );
                    }
                  );
                }
              )
            )
          )

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addProvider,
        tooltip: 'Add Provider',
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
      ),
    );
  }
}
