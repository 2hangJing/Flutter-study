/*
 * @Author: monai
 * @Date: 2021-11-15 15:54:11
 * @LastEditors: monai
 * @LastEditTime: 2021-11-15 18:48:19
 */
part of './main.dart';

class Detail extends StatelessWidget {
    Detail({Key? key, required this.an}): super(key: key);
    Animation<double> an;

    Widget build(BuildContext ctx){
        return AnimatedBuilder(
            builder: (BuildContext ctx, child){
                return Container(
                    child: Opacity(
                            child:  Scaffold(
                                appBar: AppBar(
                                    title: Text('Router Detail')
                                ),
                                body: Column(children: [
                                    Hero(
                                        child: Image.asset(
                                            'static/images/A1.png',
                                            width: 200,
                                            height: 200,
                                            fit: BoxFit.contain,
                                        ),
                                        tag: 'home_detail',
                                    ),
                                    Center(child: Text(
                                        '缩略图展示缩略图展示缩略图展示缩略图展示缩略图展示缩略图展示缩略图展示缩略图展示',
                                        style: TextStyle(
                                        fontSize: 25
                                        ),
                                    ))
                                ])
                            ),
                            opacity: an.value,
                        ),
                        
                        
                );
                
                
            },
            animation: an
        );
    }
}