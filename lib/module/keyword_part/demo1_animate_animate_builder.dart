/*
 * @Author: monai
 * @Date: 2021-11-11 15:48:48
 * @LastEditors: monai
 * @LastEditTime: 2021-11-12 16:19:36
 */
part of './demo1_main.dart';

class OptionsAnimate extends StatelessWidget {

    Widget child;
    Animation<double> animation;
    OptionsAnimate({required this.child, required this.animation});

    @override
    Widget build(BuildContext context){
        return AnimatedBuilder(
            animation: animation,
            child: child,
            builder: (BuildContext ctx, child){
                return Center(
                    child: Opacity(child: Container(
                            width: animation.value * 200,
                            height: 200,
                            child: DecoratedBox(
                                decoration: BoxDecoration(
                                    color: Colors.blueAccent
                                ),
                                child: child
                            )
                        ),
                        opacity: animation.value,
                    )
                );
            }
        );
    }
}