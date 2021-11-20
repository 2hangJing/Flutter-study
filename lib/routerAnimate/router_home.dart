/*
 * @Author: monai
 * @Date: 2021-11-12 17:49:01
 * @LastEditors: monai
 * @LastEditTime: 2021-11-15 18:38:36
 */
part of './main.dart';

class HomeWidget extends StatelessWidget {
    const HomeWidget({Key? key}): super(key: key);

    Widget build(BuildContext ctx){
        return Scaffold(
            appBar: AppBar(
                title: Text('这是 title')
            ),
            body: ListView(
                children: [
                    Container(
                        child: Center(
                            child: TextButton(
                                child: Text('跳转 RULE'),
                                onPressed: ()=> Navigator.pushNamed(ctx, 'reward') 
                            ),
                        )
                    ),
                    
                ],
            )
        );
        
        
        
    }
}