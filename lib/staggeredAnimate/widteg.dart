/*
 * @Author: monai
 * @Date: 2021-11-16 11:10:55
 * @LastEditors: monai
 * @LastEditTime: 2021-11-16 15:47:29
 */
part of './main.dart';

class AnimateWidget extends StatelessWidget {

    AnimateWidget({
        Key? key, 
        required this.controller
    }):super(key: key){

        anColor = ColorTween(begin: Colors.blueAccent, end: Colors.cyanAccent).animate(
            CurvedAnimation(
                parent: controller, 
                curve: const Interval(0.0, 1.0 , curve: Curves.easeOut)
            )
        );

        anWidth = Tween(begin: 50.0, end: 0.0).animate(
            CurvedAnimation(
                parent: controller, 
                curve: const Interval(0.5, 1.0 , curve: Curves.easeOut)
            )
        );
        
        anHeight = Tween(begin: 10.0, end: 200.0).animate(
            CurvedAnimation(
                parent: controller, 
                curve: const Interval(0.0, 1.0 , curve: Curves.easeOut)
            )
        );

        anTranslateX = Tween(begin: 0.0, end: 200.0).animate(
            CurvedAnimation(
                parent: controller, 
                curve: const Interval(0.0, 0.5 , curve: Curves.easeOut)
            )
        );

        anTranslateY = Tween(begin: 0.0, end: 100.0).animate(
            CurvedAnimation(
                parent: controller, 
                curve: const Interval(0.5, 1.0, curve: Curves.easeOut)
            )
        );
    }

    Animation<double> controller;
    late Animation<Color?> anColor;
    late Animation<double> anWidth;
    late Animation<double> anHeight;
    late Animation<double> anTranslateX;
    late Animation<double> anTranslateY;

    Widget build(BuildContext ctx){
        return AnimatedBuilder(
            animation: controller,
            builder: (BuildContext ctx, child){
                return Transform.translate(
                    offset: Offset(anTranslateX.value, anTranslateY.value),
                    child: Container(
                        width: anWidth.value,
                        height: anHeight.value,
                        color: anColor.value
                        // color: Colors.cyanAccent,
                    )
                );
            }
        );
    }
}