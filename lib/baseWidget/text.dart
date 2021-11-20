/*
 * @Author: monai
 * @Date: 2021-11-17 15:43:37
 * @LastEditors: monai
 * @LastEditTime: 2021-11-17 16:57:39
 */
part of './main.dart';

class BaseTextWidget extends StatelessWidget {
        Widget build(BuildContext ctx){
            return Center(
                child: Column(
                    mainAxisAlignment : MainAxisAlignment.center,
                    children: [
                        const Text.rich(
                            TextSpan(
                                children: [
                                    TextSpan(text: '【TextSpan 一行显示】URL 为：'),
                                    TextSpan(
                                        text: "https://book.flutterchina.club/chapter3/text.html",
                                        style: TextStyle(
                                            color: Colors.blue
                                        ),  
                                    ),
                                ]
                            )
                        ),
                        // text 默认样式设置
                        DefaultTextStyle(
                            style: const TextStyle(
                                color:Colors.red,
                                fontSize: 20.0,
                            ),
                            child: Column(
                                mainAxisAlignment : MainAxisAlignment.center,
                                children: const [
                                    Text('默认字体样式设置111'),
                                    Text('默认字体样式设置222'),
                                    Text(
                                        '不继承默认样式，使用斗鱼字体',
                                        style: TextStyle(
                                            //2.不继承默认样式
                                            inherit: false, 
                                            color: Colors.green,
                                            // 配置在 pubspec.yaml
                                            fontFamily: 'DouYu',
                                            fontSize: 20
                                        ),
                                    )
                                ],
                            ),
                        )
                    ],
                )
            );
        }
}