/*
 * @Author: monai
 * @Date: 2021-11-12 17:44:10
 * @LastEditors: monai
 * @LastEditTime: 2021-11-15 15:48:46
 */
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'dart:async';
import 'dart:convert'; 

part './router_home.dart';
part './router_rule.dart';

class RouterAnimate extends StatefulWidget {
    const RouterAnimate({Key? key}) : super(key: key);
    @override
    _RouterAnimate createState() => _RouterAnimate();
}

class _RouterAnimate extends State<RouterAnimate>{


    Widget build(BuildContext ct){
        return MaterialApp(
			title: 'Flutter layout demo',
			theme: ThemeData(
				primarySwatch: Colors.blue,
			),
            initialRoute: '/',
            routes: {
                '/': (context)=> HomeWidget(),
                // '/rule': (context)=> RuleWidget(animation: 1.0),
            },
            onGenerateRoute: (RouteSettings settings){
                return PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 500),
                    pageBuilder: (BuildContext context, Animation<double> an, Animation secondaryAnimation){
                       
                        return RuleWidget(animation: an);
                        // return Test(animation: an);
                    }
                );
            }
		);
    }
}

class WidgetText extends AnimatedWidget {
    WidgetText({
        Key? key,
        required Animation<double> this.animation,
    }) : super(key: key, listenable: animation);

    Animation<double> animation;

    build(BuildContext context){
    
        return Opacity(
            child: DecoratedBox(
                decoration: BoxDecoration(
                    color: Colors.blueAccent
                ),
                child:  Image.asset(
                    'static/images/1st.png',
                
                )
            ),
            opacity: animation.value,
        );
    }
}

class Test extends StatefulWidget {

    Test({Key? key, required this.animation}) : super(key: key);
    late Animation<double> animation;
    @override
    _Test createState() => _Test(animation: animation);
}

class _Test extends State<Test> with SingleTickerProviderStateMixin{
    _Test({
       required Animation<double> this.animation,
    });

    late Animation<double> animation;

    void initState(){
        animation.addListener(() { 
            setState(() => {}); 
        });
    }

    Widget build(BuildContext context)=>  WidgetText(animation: animation);
}


