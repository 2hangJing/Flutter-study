/*
 * @Author: monai
 * @Date: 2021-11-16 10:15:52
 * @LastEditors: monai
 * @LastEditTime: 2021-11-16 15:46:11
 */
import 'dart:ui';
import 'package:flutter/material.dart';

part './widteg.dart';

class StaggeredWidget extends StatefulWidget {
    const StaggeredWidget({ Key? key }): super(key: key);

    @override
    _StaggeredWidget createState()=> _StaggeredWidget();
}


class _StaggeredWidget extends State<StaggeredWidget> with TickerProviderStateMixin {

    late AnimationController _controller;

    @override
    void initState(){
        super.initState();

        _controller = AnimationController(
            duration: const Duration(milliseconds: 1000),
            vsync: this,
        );
    }

    void _playAnimate(){
        _controller.forward();
    }

    void _resetAnimate(){
        _controller.reverse();
    }

    Widget build(BuildContext ctx){
        return MaterialApp(
            title: 'Flutter layout demo',
			theme: ThemeData(
				primarySwatch: Colors.blue,
			),
            home: Scaffold(
                appBar: AppBar(title: const Text('交织动画测试')),
                body: Column(
                    children: [
                        Center(
                            child: TextButton(
                                child: Text(
                                    '点击开始交织动画',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.blue[300]
                                    ),
                                ),
                                onPressed: ()=> _playAnimate()
                            ),
                        ),
                        Center(
                            child: TextButton(
                                child: Text(
                                    '恢复',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.red
                                    ),
                                ),
                                onPressed: ()=> _resetAnimate()
                            ),
                        ),
                        AnimateWidget(controller: _controller)
                    ],
                ),
            ),
        );
    }
}

