/*
 * @Author: monai
 * @Date: 2021-11-16 16:19:09
 * @LastEditors: monai
 * @LastEditTime: 2021-11-16 18:15:42
 */

// 动画曲线
// https://api.flutter-io.cn/flutter/animation/Curves-class.html

import 'dart:ui';
import 'package:flutter/material.dart';

part './opacity_animate.dart';

class SwitcherAnimateWidget extends StatefulWidget {
    SwitcherAnimateWidget({Key? key}): super(key: key);

    @override
    _SwitcherAnimateWidget createState()=> _SwitcherAnimateWidget();
}

class _SwitcherAnimateWidget extends State<SwitcherAnimateWidget> {
    int _num = 0;
    
    @override
    Widget build(BuildContext ctx){
        // return Text('123', textDirection: TextDirection.ltr,);
        return Directionality(
            textDirection: TextDirection.ltr,
            child: Center(
                child:  Container(
                    height: 600,
                    color: Colors.white,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            Center(
                                child: AnimatedSwitcher(
                                    // 新child显示动画时长
                                    duration: const Duration(milliseconds: 1000),
                                    // 旧child隐藏的动画时长
                                    reverseDuration: const Duration(milliseconds: 1000),
                                    // 新child显示的动画曲线
                                    switchInCurve: Curves.linear,
                                    // 旧child隐藏的动画曲线
                                    switchOutCurve: Curves.linear,
                                    // transitionBuilder: (Widget child, Animation<double> animation)=> ScaleTransition(scale: animation, child: child),
                                    // 手动封装动画
                                    transitionBuilder: (Widget child, Animation<double> animation)=> OpacityAnimate(animation: animation, animationWidget: child),
                                    // 需要动画渐变的组件，单个组件通过 key 识别
                                    child: Text(
                                        _num.toString(),
                                        //显示指定key，不同的key会被认为是不同的Text，这样才能执行动画
                                        key: ValueKey<int>(_num),
                                        style: Theme.of(context).textTheme.headline4,
                                    )
                                    // 通过切换组件
                                    // child: _num == 1 ? Text1(): Text2()
                                )
                            ),
                            Center(
                                child: TextButton(
                                    child: Text('+1'),
                                    onPressed: (){
                                        setState((){ _num+=1; });
                                    }
                                ),
                            )
                        ],
                    )
                )
            )
        );
    }
}

class Text1 extends StatelessWidget {
    Widget build(BuildContext ctx){
        return Text('1111111', style: Theme.of(ctx).textTheme.headline1);
    }
}

class Text2 extends StatelessWidget {
    Widget build(BuildContext ctx){
        return Text('2222222', style: Theme.of(ctx).textTheme.headline1);
    }
}