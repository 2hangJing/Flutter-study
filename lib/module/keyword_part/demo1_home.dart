/*
 * @Author: monai
 * @Date: 2021-11-08 18:30:21
 * @LastEditors: monai
 * @LastEditTime: 2021-11-16 17:56:19
 */

part of 'demo1_main.dart';

class HomeWidget extends StatelessWidget {

    Widget build(content){
        return Scaffold(
            appBar: AppBar(
                title: _buildAppBarTitle()
            ),
            body: ListView(
                children: [
                    ZjAnimateWidget(),
                    BannerWidget(),
                    // 子组件自己管理状态
                    TitleWidgetState(),
                    _buildIconInfo(),
                    _buildTextInfo()
                ],
            )
        );
    }
}