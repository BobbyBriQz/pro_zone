import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pro_zone/models/provider.dart';
import 'package:pro_zone/utils/size_config.dart';

class ViewProvider extends StatefulWidget {
  @override
  _ViewProviderState createState() => _ViewProviderState();
}

class _ViewProviderState extends State<ViewProvider> {

  @override
  void initState() {

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

    });
  }
  @override
  Widget build(BuildContext context) {
    final  Map<String, Object> receivedData = ModalRoute.of(context).settings.arguments;
    Provider provider = receivedData["provider"];
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.edit),
        onPressed: (){
          Navigator.pushNamed(context, "/updateProvider", arguments: {"provider":provider});
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Container(
            width: SizeConfig.percentHorizontal * 100,
            height: SizeConfig.percentVertical * 30,
            color: Colors.green,

            child: Carousel(
                animationCurve: Curves.easeInCirc,
                animationDuration: Duration(milliseconds: 1000),
                dotSize: 4.0,
                dotSpacing: 12.0,
                autoplayDuration: Duration(milliseconds: 5000),
                images: provider.images.map((e) {
                  if(e != null || e.formats != null || e.formats.small != null){

                    return NetworkImage(e.formats.small.url);
                  }
                }).toList()

            ),
          ),
          SizedBox(
            height: 20,
          ),

          Row(
            children: [
              Spacer(flex: 10,),
              Text(provider.name, style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 30
              ),),
              Spacer(),
              provider.activeStatus == "Active"? Icon(Icons.verified, color: Colors.green)
                  : Icon(Icons.verified_outlined, color: Colors.grey,) ,
              Spacer(flex: 10,),
            ],
          ),

          SizedBox(
            height: 20,
          ),

          FittedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                      8.0,0,8.0,0),
                  child: Text("About", style: TextStyle(
                      fontWeight: FontWeight.w700,
                    fontSize: 18, color: Colors.teal
                  ),),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${provider.description == null? 'N/A': provider.description}", style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18
                  ),),
                ),

                SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(
                      8.0,0,8.0,0),
                  child: Text("Rating", style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18, color: Colors.teal
                  ),),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RatingBarIndicator(
                      rating: provider.rating == null?0: provider.rating.toDouble(),
                      itemCount: 5,
                      itemSize: 30,
                      itemBuilder: (context, x){
                        return Icon(Icons.star, color: Colors.amber,);
                      }),
                ),

                SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(
                      8.0,0,8.0,0),
                  child: Text("Category", style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18, color: Colors.teal
                  ),),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${provider.providerType == null? 'N/A': provider.providerType.name}", style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18
                  ),),
                ),

                SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(
                      8.0,0,8.0,0),
                  child: Text("Address", style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18, color: Colors.teal
                  ),),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${provider.address == null? 'N/A': provider.address}, ${provider.state == null? ".":
                   '${provider.state.name} State.' }", style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18
                  ),),
                ),

                //Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
