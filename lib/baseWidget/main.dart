/*
 * @Author: monai
 * @Date: 2021-11-17 15:43:19
 * @LastEditors: monai
 * @LastEditTime: 2021-11-22 15:01:59
 */
import 'package:flutter/material.dart';
import 'dart:async';

part './text.dart';
part './button.dart';
part 'image_icon.dart';
part 'switch_check_box.dart';
part './textfield_form.dart';
part './progress_indicator.dart';


final String title = '基础组件【widget】示例';

class BaseWidget extends StatefulWidget {
    
    @override
    _BaseWidget createState()=> _BaseWidget();
}

class _BaseWidget extends State<BaseWidget> {

    late Widget showComponent = Text('尚未展示基本组件');
    
    Widget build(BuildContext context)=> MaterialApp(
        title: title,
        theme: ThemeData(
            primarySwatch: Colors.blue,
        ),
        home: Builder(builder: (BuildContext bctx){
            return Scaffold(
                appBar: AppBar(title: Text(title)),
                body: ListView(children: [
                    Column(children: [
                    Wrap(
                        children: [
                            ElevatedButton(
                                child: Text('Text widget 相关'),
                                onPressed: (){
                                    setState(() {
                                        showComponent = BaseTextWidget();
                                    });
                                },
                            ),

                            ElevatedButton(
                                child: Text('Button widget 相关'),
                                onPressed: (){
                                    setState(() {
                                        showComponent = BaseButtonWidget();
                                    });
                                },
                            ),

                            ElevatedButton(
                                child: Text('Image widget 相关'),
                                onPressed: (){
                                    setState(() {
                                        showComponent = ImageWidget();
                                    });
                                },
                            ),

                            ElevatedButton(
                                child: Text('单选、多选 widget 相关'),
                                onPressed: (){
                                    setState(() {
                                        showComponent = SwitchCheckboxWidget();
                                    });
                                },
                            ),

                            ElevatedButton(
                                child: Text('输入框、表单 widget 相关'),
                                onPressed: (){
                                    setState(() {
                                        showComponent = TextfieldFormWidget();
                                    });
                                },
                            ),

                            ElevatedButton(
                                child: Text('进度条 widget 相关'),
                                onPressed: (){
                                    setState(() {
                                        showComponent = ProgressindicatorWidget();
                                    });
                                },
                            ),
                        ]
                    ),
                    showComponent
                ])
                ])
                
               
            );
        })
    );
}