/*
 * @Author: monai
 * @Date: 2021-11-19 10:33:23
 * @LastEditors: monai
 * @LastEditTime: 2021-11-19 11:26:34
 */
part of './main.dart';

class ImageWidget extends StatelessWidget {
    const ImageWidget({Key? key}): super(key: key);

    @override
    Widget build(BuildContext context){
        return Center(
            child: Column(
                mainAxisAlignment : MainAxisAlignment.center,
                children: const [
                    Image(
                        image: AssetImage("static/images/A2.png"),
                        width: 200.0,
                        height: 100.0,
                        fit: BoxFit.fill
                    ),
                    Image(
                        image: NetworkImage('https://mico-cdn.s3.amazonaws.com/web/activity/202111_SquidGame/luckyGlass/luckGlass_12468.png'),
                        width: 100.0,
                        height: 100.0,
                        fit: BoxFit.cover
                    ),

                    Text.rich(
                        TextSpan(
                            children: [
                                TextSpan(text: '可以在文字中混合字体图标'),
                                WidgetSpan(child: Icon(
                                    Icons.opacity,
                                    color: Colors.amber
                                ))
                            ]
                        )
                    )
                    
                    
                ],
            )
        );
    }
}