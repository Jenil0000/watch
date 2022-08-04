import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(home: watch(),));
}
class watch extends StatefulWidget {
  const watch({Key? key}) : super(key: key);

  @override
  State<watch> createState() => _watchState();
}

class _watchState extends State<watch> {
  loadtime() async*
  {
    while(true)
      {
        await  Future.delayed(Duration(seconds: 1));
        DateTime d =DateTime.now();
        String time = "${d.hour} : ${d.minute} : ${d.second}";
        print(time);
        yield time;
      }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Time")),
    body: Center(child: Container(
      height: 150,
      width: 200,
      color: Colors.lightBlue,
      decoration: BoxDecoration(
      ),
      child: StreamBuilder(stream: loadtime(),builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting)
        {
          return Center(child: CircularProgressIndicator(),);
        }
        if(snapshot.hasData)
        {
          String time = snapshot.data as String;
          return Center(child: Text("${time}",style: TextStyle(fontSize: 40,backgroundColor: Colors.amber,fontWeight:FontWeight.bold),),);
        }
        else
        {
          return Text("00 : 00");
        }
      },)
      ,
    ),)
    );
  }
}
