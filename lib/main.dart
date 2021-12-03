import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_demo/module/keyword_part/demo1_main.dart';
import 'package:flutter_demo/module/keyword_export/p_main.dart';

import 'package:flutter_demo/routerAnimate/main.dart';
import 'package:flutter_demo/heroAnimate/main.dart';
import 'package:flutter_demo/staggeredAnimate/main.dart';
import 'package:flutter_demo/switcherAnimate/main.dart';

import 'package:flutter_demo/state/main.dart';

import 'package:flutter_demo/baseWidget/main.dart';

import 'package:flutter_demo/layout/main.dart';

void main() {
   
	// runApp(const Demo1WidgetStateless());

    // 路由动画
    // runApp(const RouterAnimate());

    // 路由动画-hero
    // runApp(HeroAnimateWidget());

    // 交织动画
    // runApp(StaggeredWidget());

    // 组件切换动画
    // runApp(SwitcherAnimateWidget());

    // state 数据交互类
    // runApp(ConterWidget());

    // 基础组件 示例
    runApp(BaseWidget());

    // 弹性布局
    // runApp(LayoutWidget());
    

}


