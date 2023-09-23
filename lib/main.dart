// import 'dart:html';
import 'package:flutter/material.dart';


void main() {
  runApp( culclatur());

}
 
 class culclatur extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: calclatur(),

    );
  }
}

class calclatur extends StatefulWidget {

  @override
  State<calclatur> createState() => _calclaturState();
}

class _calclaturState extends State<calclatur> {

  String re='0';
  String fin='0';
  double n1=0.0;
  double n2=0.0;
  String op='';

  press(String btv){
    if(btv=='AC'){
      fin='0';
      n1=0.0;
      n2=0.0;
      op='';
    }else if(btv=='+'||btv=='-'||btv=='*'||btv=='/'){
      n1=double.parse(re);
      op=btv;
      fin='0';
      re=re+btv;


    }else if(btv=='.'){
      if(fin.contains('.')){

      }else{
        fin=fin+btv;
      }

    }else if(btv=='+/-'){
      if(re.toString().contains('-')){
        re.toString().substring(1);
        fin=re;
      }else{
        re='-'+re;
        fin=re;

      }

    }else if(btv=='%'){
      n2=double.parse(re);
      fin=(n2/100).toString();

    }else if(btv=='='){
      n2=double.parse(re);
      if(op=='+'){
        fin=(n1+n2).toString();
      }
      if(op=='-'){
        fin=(n1-n2).toString();
      } 
      if(op=='*'){
        fin=(n1*n2).toString();
      }
      if(op=='/'){
        fin=(n1/n2).toString();
      }

    }else{
      fin=fin+btv;
    }

    setState(() {
      re=double.parse(fin).toString();
    });
  }


Widget buttonform(String tex, Color texc, Color backgroundbutton){

    if(tex!='0'){
      return Container(
    child: RawMaterialButton(
      onPressed:(){
          press(tex);
      },
      
      shape: CircleBorder(),
      fillColor: backgroundbutton,
      padding: EdgeInsets.all(15),
      child: Text(tex, style: TextStyle(
        fontSize: 35,
        color: texc,
      ),
      ),
       ),

  );
    }else{
      return Container(
    child: RawMaterialButton(
      onPressed:(){
           press(tex);

      },
      
      shape: StadiumBorder(),
      fillColor: backgroundbutton,
      padding: EdgeInsets.fromLTRB(34,20,128,20),
      child: Text(tex, style: TextStyle(
        fontSize: 35,
        color: texc,
      ),
      ),
       ),

  );
    }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color.fromARGB(255, 11, 10, 10),
      appBar: AppBar(
        title: Text('calculator',
       style: TextStyle(
        color: Colors.white,
       ),
        ),
        backgroundColor: Color.fromARGB(255, 3, 78, 209),

      ),

        body:  Padding(
          padding:EdgeInsets.all(5.0),
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Row(

                children: [
                  Text('$fin',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 70,

                  ),
                  )
                ],
              ),
              SizedBox(height: 10),
            
          
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget> [
                   buttonform('AC', Colors.white, Colors.blue),
                   buttonform('+/-', Colors.white, Colors.blue),
                   buttonform('%', Colors.white, Colors.blue),
                   buttonform('/', Colors.blue,Colors.white),
              ],
            ),
              SizedBox(height: 10.0),

                Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget> [
                   buttonform('7', Colors.white, Colors.blue),
                   buttonform('8', Colors.white, Colors.blue),
                   buttonform('9', Colors.white, Colors.blue),
                   buttonform('*', Colors.blue,Colors.white),
              ],
            ),
                          SizedBox(height: 10,),

                Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget> [
                   buttonform('4', Colors.white, Colors.blue),
                   buttonform('5', Colors.white, Colors.blue),
                   buttonform('6', Colors.white, Colors.blue),
                   buttonform('-', Colors.blue,Colors.white),
              ],
            ),
                          SizedBox(height: 10,),

                Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget> [
                   buttonform('1', Colors.white, Colors.blue),
                   buttonform('2', Colors.white, Colors.blue),
                   buttonform('3', Colors.white, Colors.blue),
                   buttonform('+', Colors.blue,Colors.white),
              ],
            ),
                          SizedBox(height: 10,),
                   Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget> [
                   buttonform('0', Colors.white, Colors.blue),
                   buttonform('.', Colors.white, Colors.blue),
                   buttonform('=', Colors.blue,Colors.white),
              ],
            ),         



        
            ],
            ),

           ),
    );
  }
}


