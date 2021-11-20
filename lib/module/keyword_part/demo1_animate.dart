/*
 * @Author: monai
 * @Date: 2021-11-10 15:09:26
 * @LastEditors: monai
 * @LastEditTime: 2021-11-16 17:56:04
 */
part of 'demo1_main.dart';

// AnimatedWidget 简化
class ImageWidget extends AnimatedWidget {
    ImageWidget({
        Key? key,
        required Animation<double> this.animation,
    }) : super(key: key, listenable: animation);
    // late 说明 https://dart.cn/null-safety/understanding-null-safety#lazy-initialization
    Animation<double> animation;
 
    Widget build(BuildContext context){
    
        return DecoratedBox(
            decoration: BoxDecoration(
                color: Colors.blueAccent
            ),
            child:  Image.asset(
                'static/images/1st.png',
                fit: BoxFit.fitWidth,
                width: animation.value,
                height: animation.value,
            )
        );
    }
}


// ImageAnimatedBuilder
// class ImageAnimatedBuilder extends AnimatedBuilder {

// }

class ZjAnimateWidget extends StatefulWidget {

    const ZjAnimateWidget({Key? key}) : super(key: key);
    
    @override
    _ZjAnimateWidget createState() => _ZjAnimateWidget();
}

class _ZjAnimateWidget extends State<ZjAnimateWidget> with SingleTickerProviderStateMixin{
    late Animation<double> animation;
    late AnimationController controller;

    void initState(){
        controller = AnimationController(
            duration: const Duration(seconds: 2),
            vsync: this
        );

        var curve = CurvedAnimation(parent: controller, curve: Curves.easeInOutCubic );

        //  widget 没有继承 AnimateWidget 时需要使用 addListener 触发 setState(() => {}); 强制刷新页面
        // animation = Tween(begin: 0.0, end: 600.0).animate(curve)..addListener(() {
        //     setState(() => {});
        // });

        // widget 继承 AnimateWidget 时 不需要使用 addListener 触发 setState(() => {}); 强制刷新页面
        animation = Tween(begin: 0.0, end: 1.0).animate(curve);

        // 状态监听
        animation.addStatusListener((status) {
            // AnimationStatus 枚举，四种状态
            // 结束
            if(status == AnimationStatus.completed ){
                controller.reverse();
            }
            // 起点
            if(status == AnimationStatus.dismissed ){
                controller.forward();
            }
        });
        // 正向执行
        controller.forward();
    }
    
    @override
    Widget build(BuildContext context){
        // 使用 AnimatedWidget
        // return ImageWidget(animation: animation);

        // 使用 AnimatedBuilder 抽离
        // return AnimatedBuilder(
        //     animation: animation,
        //     child: Image.asset( 'static/images/1st.png' ),
        //     builder: (BuildContext ctx, child){
        //         return Center(
        //             child: Container(
        //                 height: animation.value,
        //                 width: animation.value,
        //                 child: DecoratedBox(
        //                     decoration: BoxDecoration(
        //                         color: Colors.blueAccent
        //                     ),
        //                     child: child
        //                 )
        //             )
        //         );
        //     }
        // );

        // 使用抽离的 AnimatedBuilder
        return OptionsAnimate(child: Image.asset( 'static/images/1st.png', fit: BoxFit.fitWidth, ), animation: animation);
    }

    @override
    void dispose(){
        controller.dispose();
        super.dispose();
    }
}

