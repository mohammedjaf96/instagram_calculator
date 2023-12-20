import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var isSelected = '';
  String valueWriting = '';
  String subValueWriting = '';
  String functionSelected = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Text(subValueWriting,textAlign: TextAlign.left,overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 20,color: Colors.black54),),
            ),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Text(valueWriting,textAlign: TextAlign.left,overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 40,color: Colors.black54),),
            ),
          ),
          const SizedBox(height: 20,),
          SizedBox(
            height: 80,
            child: Row(
              children: [
                const SizedBox(width: 20,),
                expanded('function','AC',Colors.grey,Colors.black54,1),
                const SizedBox(width: 20,),
                expanded('function','/',Colors.grey,Colors.black54,1),
                const SizedBox(width: 20,),
                expanded('function','/',Colors.grey,Colors.black54,1),
                const SizedBox(width: 20,),
                expanded('function','/',Colors.pink,Colors.white,1),
                const SizedBox(width: 20,),
              ],
            ),
          ),
          const SizedBox(height: 20,),
          SizedBox(
            height: 80,
            child: Row(
              children: [
                const SizedBox(width: 20,),
                expanded('value',7,Colors.grey,Colors.black54,1),
                const SizedBox(width: 20,),
                expanded('value',8,Colors.grey,Colors.black54,1),
                const SizedBox(width: 20,),
                expanded('value',9,Colors.grey,Colors.black54,1),
                const SizedBox(width: 20,),
                expanded('function','x',Colors.pink,Colors.white,1),
                const SizedBox(width: 20,),
              ],
            ),
          ),
          const SizedBox(height: 20,),
          SizedBox(
            height: 80,
            child: Row(
              children: [
                const SizedBox(width: 20,),
                expanded('value',4,Colors.grey,Colors.black54,1),
                const SizedBox(width: 20,),
                expanded('value',5,Colors.grey,Colors.black54,1),
                const SizedBox(width: 20,),
                expanded('value',6,Colors.grey,Colors.black54,1),
                const SizedBox(width: 20,),
                expanded('function','-',Colors.pink,Colors.white,1),
                const SizedBox(width: 20,),
              ],
            ),
          ),
          const SizedBox(height: 20,),
          SizedBox(
            height: 80,
            child: Row(
              children: [
                const SizedBox(width: 20,),
                expanded('value',1,Colors.grey,Colors.black54,1),
                const SizedBox(width: 20,),
                expanded('value',2,Colors.grey,Colors.black54,1),
                const SizedBox(width: 20,),
                expanded('value',3,Colors.grey,Colors.black54,1),
                const SizedBox(width: 20,),
                expanded('function','+',Colors.pink,Colors.white,1),
                const SizedBox(width: 20,),
              ],
            ),
          ),
          const SizedBox(height: 20,),
          SizedBox(
            height: 80,
            child: Row(
              children: [
                const SizedBox(width: 20,),
                expanded('value',0,Colors.grey,Colors.black54,2),
                const SizedBox(width: 40,),
                expanded('value',',',Colors.grey,Colors.black54,1),
                const SizedBox(width: 20,),
                expanded('function','=',Colors.pink,Colors.white,1),
                const SizedBox(width: 20,),
              ],
            ),
          ),
          const SizedBox(height: 60,),
        ],
      ),
    );
  }
  expanded(type,value,color,valueColor,flex){
    return Expanded(
      flex: flex,
      child: InkWell(
        onTap: (){
          if(type == 'value'){
            valueWriting = valueWriting + value.toString();
            functionSelected = '';
          }else{
            if(value.toString() == 'AC'){
              valueWriting = '';
            }else{
              if(functionSelected != value.toString()){
                functionSelected = value.toString();
                subValueWriting = '$subValueWriting $valueWriting $value';
                valueWriting = '';
              }
            }
          }
          setState(() {
            isSelected = value.toString();
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: value.toString() == functionSelected ? Colors.grey[300] : color[300],
              boxShadow: type == 'value' ? (value.toString() == isSelected ? null : [
                BoxShadow(
                    color: Colors.grey[500]!,
                    offset: const Offset(4, 4),
                    blurRadius: 15,
                    spreadRadius: 1,
                    blurStyle: BlurStyle.normal
                ),
                const BoxShadow(
                    color: Colors.white,
                    offset: Offset(-4, -4),
                    blurRadius: 15,
                    spreadRadius: 1,
                    blurStyle: BlurStyle.normal
                ),
              ]) : [
                BoxShadow(
                    color: Colors.grey[500]!,
                    offset: const Offset(4, 4),
                    blurRadius: 15,
                    spreadRadius: 1,
                    blurStyle: BlurStyle.normal
                ),
                const BoxShadow(
                    color: Colors.white,
                    offset: Offset(-4, -4),
                    blurRadius: 15,
                    spreadRadius: 1,
                    blurStyle: BlurStyle.normal
                ),
              ],
          ),
          child: Center(
            child: Text(value.toString(),textAlign: TextAlign.center,
            style: TextStyle(color: value.toString() == functionSelected ? Colors.pink : valueColor,fontSize: 27),),
          ),
        ),
      ),
    );
  }
}

