/*
 * @Author: monai
 * @Date: 2021-11-15 15:53:55
 * @LastEditors: monai
 * @LastEditTime: 2021-11-15 18:20:38
 */
import 'dart:ui';
import 'package:flutter/material.dart';

part 'router_home.dart';
part 'router_detail.dart';


// 子组件管理自己的状态
class HeroAnimateWidget extends StatelessWidget {
    const HeroAnimateWidget({Key? key}) : super(key: key);
     
    Widget build(BuildContext ctx){
        
        return MaterialApp(
			title: 'HERO 动画 demo',
			theme: ThemeData(
				primarySwatch: Colors.blue,
			),
            initialRoute: '/',
            routes: {
                '/': (context)=> HomeWidget(),
                // 构造函数参数被指定为路由跳转时传的参数
                // '/detail': (context)=> Detail()
            },
            onGenerateRoute: (RouteSettings settings){

                switch (settings.name) {
                    case '/detail':
                        return PageRouteBuilder(
                            transitionDuration: Duration(milliseconds: 1000),
                            pageBuilder:(context, animation, secondaryAnimation) {
                                return Detail(an: animation);
                            }
                        );
                }
            }
		);
    }
}
