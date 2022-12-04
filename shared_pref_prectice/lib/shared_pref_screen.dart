import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefScreen extends StatefulWidget {
  const SharedPrefScreen({Key? key}) : super(key: key);

  @override
  State<SharedPrefScreen> createState() => _SharedPrefScreenState();
}

class _SharedPrefScreenState extends State<SharedPrefScreen> {

  String? name = '';
  bool? isLogin;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  //  isLogin();
  }



  // void isLogin() async {
  //   SharedPreferences sp = await SharedPreferences.getInstance();
  //   name = sp.getString('name') ?? '';
  //   age = sp.getInt('age') ?? 0;
  //   luckyNumber = sp.getDouble('lucky_number') ?? 5.0;
  //   userLogin = sp.getBool('isLogin') ?? false;
  //   setState(() {
  //
  //   });
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      /// appbar
      appBar: AppBar(
        title: const Text('Shared Preference Example'),
        centerTitle: true,
      ),

      /// body
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [

            FutureBuilder(
                future: SharedPreferences.getInstance(),
                builder: (context, AsyncSnapshot<SharedPreferences> snapshot) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(snapshot.data!.getString('name').toString(), style: TextStyle(
                    fontSize: 17.0,
                  ),),
                  Text(snapshot.data!.getBool('isLogin').toString(), style: TextStyle(
                    fontSize: 17.0,
                  ),),
                ],
              );
            }),

          ],
        ),
      ),

      /// floating btn
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          SharedPreferences sp = await SharedPreferences.getInstance();

          // sp.remove('name');
          // sp.remove('age');
          // sp.remove('lucky_number');

          // sp.setBool('isLogin', false);
          // sp.setInt('age', 24);
          // sp.setDouble('lucky_number', 2);
          // sp.setString('name', 'Afzaal Shehbaz');
          //
          // setState(() {
          //
          // });
          sp.setString('name', 'Afzaal Shehbaz');
          sp.setBool('isLogin', false);


          setState(() {

          });

        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
