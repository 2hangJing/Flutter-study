/*
 * @Author: monai
 * @Date: 2021-11-08 16:52:26
 * @LastEditors: monai
 * @LastEditTime: 2021-11-11 14:12:50
 */
part of 'demo1_main.dart';

class RouteOne extends StatefulWidget{
    Map<String, String> constrouctParams;

    RouteOne({
        Key? key,
        required this.constrouctParams
    }) : super(key: key);

    @override
    _RouteOne createState() => _RouteOne(constrouctParams: constrouctParams);
}

class _RouteOne extends State<RouteOne> {
    _RouteOne({
        required this.constrouctParams
    }) : super();

    Map<String, String> constrouctParams;

    @override
    Widget build(BuildContext context) {
        Map<String, String> mapRouterParams = { 'params': '--' };
        print('路由跳转中代的参数：' + ModalRoute.of(context)!.settings.arguments.toString());
        setState((){
            //  通过指定路由参数跳转，可以获取到路由参数
            if(ModalRoute.of(context)!.settings.arguments != null){
                mapRouterParams = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
            }
            //  通过 onGenerateRoute 匹配没有路由参数，只能从 constrouct 参数中获取 
            else{
                mapRouterParams = constrouctParams;
            }
        });

        return Scaffold(
            appBar: AppBar(
                title: Text('Router one page'),
            ),
            body: Center(
                child: Column(children: [
                    Text('路由表 + constrouct 传参：' + constrouctParams['params']!),
                    Text('指定路由传参：' + mapRouterParams['params']!),
                    TextButton(
                        child: Text('点击返回 main'),
                        onPressed: ()=> Navigator.pop(context, "已经打开过 Router one 页面了！")
                    ),
                ])
            ),
        );
    }
}