import 'package:flutter/material.dart';

enum ControllerStyle { light, dart }
var openLogApp = 0;

class NavigationBarView extends StatelessWidget {
  NavigationBarView({super.key,
    this.titleText,
    this.titleWidget,
    this.backgroundColor = Colors.white,
    this.backgroundImage,
    this.controllerStyle = ControllerStyle.dart,
    this.actionRight,
    this.actionLeft,
    this.marginTop,
    this.marginBottom,
    this.marginLeft,
    this.marginRight,
    this.heightToolBar,
    this.paddingTop,
    this.paddingBottom,
    this.paddingLeft,
    this.paddingRight,
    this.bottom,
    this.isUnderline = false,
    this.onPressedBack,
    this.iconBack = Icons.arrow_back_rounded,
    this.iconBackSize = 20,
    this.canPressedBack = true,
    this.titleAlignment = Alignment.center,
    this.titleHorizontalPadding = 50,
    titleLogo = true,
  });

  final double titleHorizontalPadding;
  final Alignment titleAlignment;
  final String? titleText;
  Widget? titleWidget;
  final Color? backgroundColor;
  final DecorationImage? backgroundImage;
  final ControllerStyle controllerStyle;
  final List<Widget>? actionRight;
  final List<Widget>? actionLeft;
  final double? heightToolBar;
  final double? marginTop;
  final double? marginBottom;
  final double? marginLeft;
  final double? marginRight;
  final double? paddingTop;
  final double? paddingBottom;
  final double? paddingLeft;
  final double? paddingRight;
  final List<Widget>? bottom;
  final bool isUnderline;
  final VoidCallback? onPressedBack;
  final IconData? iconBack;
  final double iconBackSize;
  final bool canPressedBack;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          image: backgroundImage,
        ),
        child: Padding(
        padding: EdgeInsets.only(
            top: marginTop ?? MediaQuery.of(context).padding.top,
            bottom: marginBottom ?? 0,
            left: marginLeft ?? 0,
            right: marginRight ?? 0
        ),
        child: _bottomView(context),
      )
    );
  }

  Widget _bottomView(BuildContext context){
    return Container(
      color: backgroundColor,
      child: Column(
        children: [
          _buildToolBar(context),
          if(bottom?.isNotEmpty ?? false)
            ...bottom ?? [],
        ],
      ),
    );
  }

  Widget _buildToolBar(BuildContext context){
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: paddingTop ?? 0,
              bottom: paddingBottom ?? 0,
              left: paddingLeft ?? 0,
              right: paddingRight ?? 0
          ),
          child: SizedBox(
              height: heightToolBar??kToolbarHeight,
              child: Stack(
                children: [
                  Center(
                    child: Row(
                      children: actionLeft ?? [
                        IconButton(
                          padding: EdgeInsets.zero,
                          icon: Icon(iconBack,
                            color: controllerStyle == ControllerStyle.light
                                ? Colors.white
                                : Colors.black,
                            size: iconBackSize,
                          ),
                          onPressed: () {
                            if(canPressedBack){
                              Navigator.of(context).pop();
                            }
                            onPressedBack?.call();
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: titleHorizontalPadding),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.of(context).popUntil((route){
                          return route.isFirst;
                        });
                      },
                      onLongPress: (){
                        if(openLogApp == 5){
                          // Navigator.of(context).push(LogAppPage.route());
                        }
                      },
                      child: Align(
                        alignment: titleAlignment,
                          child: titleWidget ?? Text(titleText??'',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: controllerStyle == ControllerStyle.light ? Colors.white : Colors.black
                            ),
                          )
                      ),
                    ),
                  ),
                  Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: actionRight ?? [],
                      )
                  )
                ],
              )
          ),
        ),
        if (isUnderline)
          _buildLineView(),
      ],
    );
  }

  Widget _buildLineView({double height = 1, double width = double.infinity, Color color = Colors.grey, double borderRadius = 0}){
    return SizedBox(
      height: height,
      width: width,
      child: DecoratedBox(
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(borderRadius)
          )
      ),
    );
  }


}
