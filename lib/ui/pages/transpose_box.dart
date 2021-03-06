import 'package:chordu/ui/progressbars/spinning_progress_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransposeWidget extends StatefulWidget{

  bool showFirst;

  TransposeWidget({@required this.showFirst});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TransposeState();
  }

}
class TransposeState extends State<TransposeWidget>{

  bool transposeSwitch = true;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return transposeSettingBox(context);
  }

  Widget transposeSettingBox(BuildContext buildContext){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(

        width: MediaQuery.of(buildContext).size.width,
        height: 230,
        child: AnimatedCrossFade(
          crossFadeState: widget.showFirst?CrossFadeState.showFirst:CrossFadeState.showSecond,
          duration: Duration(milliseconds: 200),
          firstChild: Column(
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Transpose',style: TextStyle(fontSize: 22,color: Colors.grey[400]),),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Text('Off',style: TextStyle(fontSize: 22,color: Colors.white),),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 10, 0),
                      child: InkWell(
                        onTap: (){

                        },
                        child: Container(
                          width: 30,
                          child: Center(
                            child: Icon(Icons.add,color: Colors.black,),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(8.0)
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){

                      },
                      child: Container(
                        width: 30,
                        child: Center(
                          child: Icon(Icons.remove,color: Colors.black,),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8.0)
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 10, 0,0),
                child: Text('Am C F A Bb Fm Dm',style: TextStyle(fontSize: 18,color: Colors.greenAccent),),),
              Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),child:
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CupertinoSwitch(value: transposeSwitch, onChanged: (bool value){
                    setState(() {
                      transposeSwitch = value;
                    });
                  },activeColor: Color(0xff0E8291),trackColor: Colors.grey[400],),
                  Text('Save Tuning',style: TextStyle(fontSize: 18,color: Color(0xffCBE5E8)),)
                ],
              )
                ,),
              Padding(padding: EdgeInsets.fromLTRB(0, 10, 0,0),
                child: Text('Use Flats, Sharpes or Both ?',style: TextStyle(fontSize: 18,color: Colors.grey[400]),),),
              Padding(padding: EdgeInsets.fromLTRB(0, 10, 0,10),child:
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  transposeCordsContainer('b', 40, 40,true),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10,0, 10, 0),
                    child: transposeCordsContainer('#', 40, 40,false),
                  ),
                  transposeCordsContainer('#b', 40, 40,false),
                ],
              ),),

            ],
          ),
          secondChild: SpinningProgressView(color: Colors.transparent,size: 160,),
        ),

        decoration: BoxDecoration(
          color: Colors.black87,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  Widget transposeCordsContainer(String text,double _width,double _height,bool isActive) {

    return  InkWell(
      onTap: (){

      },
      child: Container(
        width: _width,
        height: _height,
        child:
        Center(child: Text(text,style: TextStyle(fontSize: 24,color: isActive?Colors.white:Color(0xff777777)),),),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: isActive?Color(0xff0E5950):Color(0xffDADADA),
            border: Border.all(width: 1,color: Colors.white),
            borderRadius: BorderRadius.circular(10.0)
        ),
      ),
    );
  }
}