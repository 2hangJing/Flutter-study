/*
 * @Author: monai
 * @Date: 2021-11-15 15:54:02
 * @LastEditors: monai
 * @LastEditTime: 2021-11-15 18:48:01
 */
part of './main.dart';

class HomeWidget extends StatelessWidget{
    const HomeWidget({Key? key}) : super(key: key);
    Widget build(BuildContext ctx){
        return Scaffold(
            appBar: AppBar(
                title: Text('Router Home')
            ),
            body: ListView(
                children: [
                    Container(
                        child: InkWell(
                            child: Hero(
                                child: Column(children: [
                                    Image.asset(
                                        'static/images/A1.png',
                                        width: 100,
                                        height: 100,
                                    ),
                                    Center(child: Text(
                                        '缩略图展示',
                                        style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.blueAccent
                                        ),
                                    ))
                                ]),
                                tag: 'home_detail',
                            ),
                            onTap: (){

                                Navigator.pushNamed(ctx, '/detail');
                            },
                        ),
                        width: 100,
                    ),
                    
                ],
            )
        );
    }
}