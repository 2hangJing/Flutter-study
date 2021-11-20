/*
 * @Author: monai
 * @Date: 2021-11-16 18:47:20
 * @LastEditors: monai
 * @LastEditTime: 2021-11-17 14:55:45
 */
// 对应 https://book.flutterchina.club/chapter2/flutter_widget_intro.html#_2-2-6-state

import 'package:flutter/material.dart';

class ConterWidget extends StatefulWidget {
    int num = 10;
    
    @override
    _ConterWidget createState()=> _ConterWidget();
}

class _ConterWidget extends State<ConterWidget> {
    
    Widget build(BuildContext ctx){
        return MaterialApp(
            theme: ThemeData(
				primarySwatch: Colors.blue,
			),
            home: Scaffold(
                appBar: AppBar(title: Text('State 数据状态相关')),
                body: Container(
                    child: Builder(
                        builder: (BuildContext bctx){
                            return ElevatedButton(
                                onPressed: () {
                                    // 通过 widget 获取关联 widget对象的示例
                                    print(widget.num);
                                    // 直接通过of静态方法来获取ScaffoldState
                                    ScaffoldState _state = Scaffold.of(bctx);
                                    // 打开抽屉菜单
                                    _state.openDrawer();
                                },
                                child: Text('打开抽屉菜单1'),
                            );
                        }
                    )
                ),
                drawer: Drawer(
                    child: Text('drawer'),
                ),
            ),
        );
    }    
}