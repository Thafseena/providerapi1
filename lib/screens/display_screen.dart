import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerapi1/shimmer/shimmer_layout.dart';

import '../provider/getdata_provider.dart';

class HomeScreen extends StatefulWidget {

 HomeScreen({super.key, 
 //required GetDataProvider dataProvider,
 //required this.dataProvider
 });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    @override
  void initState() {
    super.initState();
    final dataProvider = Provider.of<GetDataProvider>(context, listen: false);
    dataProvider.getMyData();
  }
  //var dataProvider;

  @override
  Widget build(BuildContext context) {
     final dataProvider = Provider.of<GetDataProvider>(context);
    return Scaffold(
      appBar: AppBar(

      ),
      body: dataProvider.isLoading?
      Padding(padding: EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (ctx,i){
          return Column(
            children: [
              loadingShimmer(),
               const SizedBox(height: 10,)
            ],
          );

      }),):ListView.builder(
        itemCount: 10,
        itemBuilder: (ctx,i){
          return Padding(padding: EdgeInsets.all(8.0),
          child: Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                  Image.network(dataProvider.responseData.data![i].avatar!,height: 100,width: 100,fit: BoxFit.cover,),
                  Padding(padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(dataProvider.responseData.data![i].firstName!),
                      const SizedBox(height: 10,),
                      Text(dataProvider.responseData.data![i].email!)
                    ],
                  ),
                  )
              ],
            ),
          ),

          );

        })

    );
  }
}