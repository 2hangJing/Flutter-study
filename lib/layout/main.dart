/*
 * @Author: monai
 * @Date: 2021-11-24 13:54:54
 * @LastEditors: monai
 * @LastEditTime: 2021-12-02 15:06:29
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part './flexible.dart';
part './wrap.dart';
part './position.dart';
part './align.dart';
part './layout_builder.dart';

class LayoutWidget extends StatefulWidget {
    const LayoutWidget({Key? key}): super(key: key);

    @override
    _LayoutWidget createState() => _LayoutWidget();
}

class _LayoutWidget extends State<LayoutWidget> {

    late Widget showComponent = Text('尚未展示基本组件');
   
    @override
    Widget build(BuildContext content){
        return ScreenUtilInit(
            designSize: Size(360, 690),
            builder: ()=> MaterialApp(
                title: '布局',
                theme: ThemeData(
                    primarySwatch: Colors.blue,
                ),
                home: Scaffold(
                    appBar: AppBar(title: Text('布局 demo')),
                    body: ConstrainedBox(
                        // 宽度最小限制为全屏宽度，child Column 宽度则被限制在全屏
                        constraints: BoxConstraints(minWidth: double.infinity),
                        child: Column(
                            children: [
                                Wrap(
                                    alignment: WrapAlignment.spaceAround,
                                    spacing: 15.w,
                                    children: [
                                        ElevatedButton(
                                            child: Text('flex 弹性布局 相关'),
                                            onPressed: (){
                                                setState(() {
                                                    showComponent = FlexibleLayoutWidget();
                                                });
                                            },
                                        ),

                                        ElevatedButton(
                                            child: Text('wrao 流式布局 相关'),
                                            onPressed: (){
                                                setState(() {
                                                    showComponent = WrapLayoutWidget();
                                                });
                                            },
                                        ),
                                        ElevatedButton(
                                            child: Text('position 层叠布局 相关'),
                                            onPressed: (){
                                                setState(() {
                                                    showComponent = PositionLayoutWidget();
                                                });
                                            },
                                        ),
                                        ElevatedButton(
                                            child: Text('align 相对定位/对齐 布局 相关'),
                                            onPressed: (){
                                                setState(() {
                                                    showComponent = AlignLayoutWidget();
                                                });
                                            },
                                        ),
                                        ElevatedButton(
                                            child: Text('获取父级约束信息动态布局 相关'),
                                            onPressed: (){
                                                setState(() {
                                                    showComponent = LayoutBuilderWidget();
                                                });
                                            },
                                        ),
                                    ]
                                ),
                                showComponent
                            ],
                        )
                    )
                )
            )
        );
    }
}



