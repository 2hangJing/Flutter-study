/*
 * @Author: monai
 * @Date: 2021-11-03 18:33:36
 * @LastEditors: monai
 * @LastEditTime: 2021-11-08 11:49:49
 */
part of 'demo1_main.dart';

class TitleWidgetStateless extends StatelessWidget {
    bool isFavorited;
    int favoriteCount;
    void Function() toggleFavorite;

    TitleWidgetStateless({ 
        Key? key, 
        this.isFavorited = false, 
        this.favoriteCount = 0,
        required this.toggleFavorite,
    }) : super(key: key);

    Widget build(BuildContext context){
        return Padding(
            padding: const EdgeInsets.all(30),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const <Widget> [
                            Text(
                                'consoleconsole console cons',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.black87
                                ),
                            ),
                            Text(
                                'IsCasting false because111',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 12,
                                    
                                ),
                            ),
                        ],
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                            Row(
                                children: [
                                    Container(
                                        margin: EdgeInsets.only(right: 5),
                                        child: IconButton(
                                            icon: (isFavorited ? const Icon(Icons.star): const Icon(Icons.star_border)),
                                            color: Colors.red[600],
                                            onPressed: toggleFavorite
                                        )
                                    ),
                                    Text(
                                        favoriteCount.toString(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.brown
                                        ),
                                    )
                                ],
                            )
                        ]
                    ),
                ]
            ),
        );
    }
}


// 子组件自己管理自己的状态
class TitleWidgetState extends StatefulWidget {
    const TitleWidgetState({Key? key}) : super(key: key);
    @override
    _TitleWidgetStateless createState() => _TitleWidgetStateless();
}

class _TitleWidgetStateless extends State<TitleWidgetState>{

    bool isFavorited = false;
    int favoriteCount = 20;
    void toggleFavorite(){
        setState(() {
            if (isFavorited) {
                favoriteCount -= 1;
                isFavorited = false;
            } else {
                favoriteCount += 1;
                isFavorited = true;
            }
        });
    }

    Widget build(BuildContext context){
        return Padding(
            padding: const EdgeInsets.all(30),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const <Widget> [
                            DecoratedBox(
                                decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    image: DecorationImage(
                                        // image: AssetImage('static/images/1st.png'),
                                        image: AssetImage('static/images/1st.png'),
                                        repeat: ImageRepeat.repeat
                                    )
                                ),
                                child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                        'consoleconsole console cons',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.black87
                                        ),
                                    ),
                                ),
                            ),
                            
                            Text(
                                'IsCasting false because111',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 12,
                                    
                                ),
                            ),
                        ],
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                            Row(
                                children: [
                                    Container(
                                        margin: EdgeInsets.only(right: 5),
                                        child: IconButton(
                                            icon: (isFavorited ? const Icon(Icons.star): const Icon(Icons.star_border)),
                                            color: Colors.red[600],
                                            onPressed: toggleFavorite
                                        )
                                    ),
                                    Text(
                                        favoriteCount.toString(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.brown
                                        ),
                                    )
                                ],
                            )
                        ]
                    ),
                ]
            ),
        );
    }
}