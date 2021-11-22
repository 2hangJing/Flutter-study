/*
 * @Author: monai
 * @Date: 2021-11-22 10:28:09
 * @LastEditors: monai
 * @LastEditTime: 2021-11-22 15:03:28
 */
part of './main.dart';

class ProgressindicatorWidget extends StatefulWidget {

    const ProgressindicatorWidget({Key? key}): super(key: key);
    
    @override
    _ProgressindicatorWidget createState()=> _ProgressindicatorWidget();
}


class _ProgressindicatorWidget extends State<ProgressindicatorWidget> with SingleTickerProviderStateMixin {

    late AnimationController _animationController;
    late Animation<Color?> animation;

    @override
    void initState(){
        //动画执行时间3秒  
        _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 3));
        _animationController.forward();

        animation = ColorTween(begin: Colors.blue, end: Colors.deepOrange).animate(_animationController);

        Timer(const Duration(seconds: 3), ()=> _animationController.reverse());

        super.initState();
    }

    
    @override
    Widget build(BuildContext content)=> Center(child: Container(
        width: 300,
        child: Padding(
            padding: EdgeInsets.only(top: 30), 
            child: Column(children: [
                LinearProgressIndicator(
                    value: null,
                    backgroundColor: Colors.black38,
                    valueColor: AlwaysStoppedAnimation(Colors.blue),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: LinearProgressIndicator(
                        value: 0.5,
                        backgroundColor: Colors.black38,
                        valueColor: AlwaysStoppedAnimation(Colors.blue),
                    )
                ),
                Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: CircularProgressIndicator(
                        value: null
                    )
                ),
                Container(
                    height: 200,
                    width: 200,
                    child: Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: CircularProgressIndicator(
                            value: 0.8,
                            strokeWidth: 8,
                            backgroundColor: Colors.black12,
                            valueColor: AlwaysStoppedAnimation(Colors.deepOrange)
                        )
                    ),
                ),
                AnimatedBuilder(
                    animation: animation,
                    builder: (BuildContext ctx, child){
                        return Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: CircularProgressIndicator(
                                value: _animationController.value,
                                backgroundColor: Colors.grey[200],
                                valueColor: animation
                            )
                        );
                    }
                )
            ])
        )
        
    ));
}