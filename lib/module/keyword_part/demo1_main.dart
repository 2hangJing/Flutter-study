/*
 * @Author: monai
 * @Date: 2021-11-03 18:15:16
 * @LastEditors: monai
 * @LastEditTime: 2021-11-15 17:47:13
 */
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'dart:async';
import 'dart:convert'; 

part './demo1_app_bar_title.dart';
part './demo1_banner.dart';
part './demo1_title.dart';
part './demo1_icon_info.dart';
part './demo1_text_info.dart';
part './demo1_router_one.dart';
part './demo1_home.dart';
part './demo1_animate.dart';
part 'demo1_animate_animate_builder.dart';

// 通过父组件管理子组件状态
class Demo1WidgetState extends StatefulWidget {
    const Demo1WidgetState({Key? key}) : super(key: key);

    @override
    _Demo1WidgetState createState() => _Demo1WidgetState();
}

class _Demo1WidgetState extends State<Demo1WidgetState> {

    bool isFavorited = false;
    int favoriteCount = 41;

    void _toggleFavorite(){
        setState(() {
            if (isFavorited) {
                favoriteCount -= 1;
                isFavorited = false;
            } else {
                favoriteCount += 1;
                isFavorited = true;
            }
        });
    }
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Flutter layout demo',
			theme: ThemeData(
				primarySwatch: Colors.blue,
			),
			home: Scaffold(
				appBar: AppBar(
					title: _buildAppBarTitle()
				),
				body: ListView(
					children: [
						BannerWidget(),
                        // 父组件管理 widget
						TitleWidgetStateless(
                            isFavorited: isFavorited,
                            favoriteCount: favoriteCount,
                            toggleFavorite: _toggleFavorite
                        ),
						_buildIconInfo(),
						_buildTextInfo()
					],
				)
			)
		);
	}
}


// 子组件管理自己的状态
class Demo1WidgetStateless extends StatelessWidget {
    const Demo1WidgetStateless({Key? key}) : super(key: key);

    Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Flutter layout demo',
			theme: ThemeData(
				primarySwatch: Colors.blue,
			),
            initialRoute: '/',
            routes: {
                '/': (context)=> HomeWidget(),
                // 构造函数参数被指定为路由跳转时传的参数，只有路由表中不存在的路由才会走 onGenerateRoute 回调
                // 'RouterOne': (context)=> RouteOne(constrouctParams: ModalRoute.of(context)!.settings.arguments as Map<String, String>)
            },
            onGenerateRoute: (RouteSettings settings){
                return MaterialPageRoute(builder: (BuildContext context){
                    String routeName = settings.name!;
                    var constrouctParams = settings.arguments! as Map<String, String>;

                    return RouteOne(constrouctParams: constrouctParams);
                });
            }
		);
	}
}
