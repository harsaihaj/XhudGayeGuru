import 'package:flutter/material.dart';
import 'package:xhudgayeguru/controller/fetchMeme.dart';
import 'package:xhudgayeguru/controller/saveMyData.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String imgUrl = "";
  int? memeNo;
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // GetInitMemeNo();
    UpdateImg();
  }
  // GetInitMemeNo() async{
  //   memeNo = await SaveMyData.fetchData() ?? 0;
  //   setState(() {
  //
  //   });
  // }
  void UpdateImg() async{
    String getImageUrl = await FetchMeme.fetchNewMeme();
    setState(() {
      imgUrl = getImageUrl;
      isLoading = false;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 250),
            Text("Xhud Gaye Guru Hoe Gaya?", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
            SizedBox(height: 10,),
            Text("Reddit Ke Memes Dekhlo Aao",style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800)),
            SizedBox(height: 20,),
            isLoading ?
                Container(height: 400,width: MediaQuery.of(context).size.width,
                child: Center(
                  child: SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator()),
                ) ,)
                :
            Image.network(height: 300,width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitHeight
                ,imgUrl),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: () async{
              // await SaveMyData.saveData(memeNo!+1);
              // GetInitMemeNo();
              UpdateImg();
            }, child: Container(
                height: 50,
                width: 150,
                child: Center(child: Text("Daba Bhi Doe", style: TextStyle(fontSize: 20),)))),
            Spacer(),
            Text("Made By", style: TextStyle(fontSize: 20),),
            Text("Harsaihaj Singh Gill", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)

          ],
        ),
      ),
    );
  }
}