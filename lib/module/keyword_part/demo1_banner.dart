/*
 * @Author: monai
 * @Date: 2021-11-03 18:27:38
 * @LastEditors: monai
 * @LastEditTime: 2021-11-09 17:55:04
 */
part of 'demo1_main.dart';

class BannerWidget extends StatefulWidget {

    const BannerWidget({Key? key}) : super(key: key);

    @override
    _BannerWidget createState() => _BannerWidget();
}

class _BannerWidget extends State<BannerWidget> {

    String jsonText = '--';
    String routerOneResult = '暂未跳转';
    
    Future<String> _decodePerson(BuildContext context) async {
        
        // rootBundle 全局资源获取
        // String jsonData = await rootBundle.loadString('static/json/test1.json');
        // 这种方法不是使用应用程序构建的默认 asset bundle，而是使父级 widget 在运行时替换的不同的 AssetBundle，这对于本地化或测试场景很有用。
        String jsonData = await DefaultAssetBundle.of(context).loadString('static/json/test1.json');
        // 解析 json 字符串，返回的是 Map<String, dynamic> 类型
        final jsonMap = json.decode(jsonData);

        setState((){ jsonText = jsonData; });
        
        return jsonData;
    }

    @override
    Widget build(BuildContext context){
        // 解析 json 文件
        _decodePerson(context);

        return Column(children: [
            Image.network(
                'https://cdn.micoworld.net/web/activity/202108_unitedMatch/header.png',
                fit: BoxFit.fitWidth,
            ),
            const Image(image: AssetImage('static/images/1st.png')),
            GestureDetector(
                onTap: () async {
                    // 直接打开新路由
                    // String result = await Navigator.push(
                    //     context, 
                    //     MaterialPageRoute(
                    //         builder: (context) {
                    //             return RouteOne();
                    //         }
                    //     )
                    // );

                    // 通过路由表打开指定路由
                    String result = await Navigator.pushNamed(context, 'RouterOne', arguments: {
                        'params': 'router one params 通过指定命名'
                    }) as String;

                    setState((){ routerOneResult = result; });
                },
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        Text(jsonText),
                        Text(
                            routerOneResult,
                            style: const TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),
                        )
                    ],
                ),
            )
        ]);
    }
}