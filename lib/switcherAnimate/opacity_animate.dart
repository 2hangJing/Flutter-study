/*
 * @Author: monai
 * @Date: 2021-11-16 16:39:57
 * @LastEditors: monai
 * @LastEditTime: 2021-11-16 18:27:20
 */

part of './main.dart';

class OpacityAnimate extends StatefulWidget {

    OpacityAnimate({Key? key, required this.animation, required this.animationWidget}): super(key: key);

    Animation<double> animation;
    Widget animationWidget;


    @override
    _OpacityAnimate createState()=> _OpacityAnimate(an: animation, anWidget: animationWidget);
}

class _OpacityAnimate extends State<OpacityAnimate> with SingleTickerProviderStateMixin {
    _OpacityAnimate({required this.an, required this.anWidget});

    late Animation<double> an;
    Widget anWidget;
    late Offset offset = Offset(0, 0);
    late double opacity = 0;

    void initState(){
        an.addListener(() { 
            setState((){
                opacity = an.value;
                if(an.status == AnimationStatus.reverse){
                    offset = Offset((1-an.value)*50 + 50, 0);
                }else{
                    offset = Offset(an.value*50, 0);
                }
                
            });
        });

        // an.addStatusListener((status) {
        //     print('*************' + status.toString());
        // });
    }
    

    Widget build(BuildContext ctx){
        return AnimatedBuilder(
            animation: an, 
            builder: (BuildContext ctx, child){
                return Opacity(
                    child: Transform.translate(offset: offset, child: anWidget),
                    opacity: opacity
                );
            }
        );
    }
}