import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:my_app/assets/buttons.dart';
import 'package:my_app/assets/text_styles.dart';
import 'package:my_app/commons/supports/gradient_border.dart';
import 'package:my_app/local/local.dart';

enum ApBorderType { solid, dashed }

class ApButton extends StatefulWidget implements ApButtons {
  ApButton({
    super.key,
    this.title,
    this.titleStyle,
    this.iconLeft,
    this.titleWidget,
    this.width,
    this.height = 32,
    this.onPressed,
    this.borderRadius = 8,
    this.border,
    this.borderType = ApBorderType.solid,
    this.backroundColor = Colors.white,
    this.backroundColorPressed,
    this.padding,
    this.shadow,
    this.iconSize,
    this.spacing = 6,
    this.iconRight,
    this.titleAlignment = CrossAxisAlignment.center,
    this.constraints,
    this.disabled = false,
    this.maxLines = 1,
  });


  String? title;
  TextStyle? titleStyle;
  Widget? titleWidget;
  CrossAxisAlignment titleAlignment;
  int maxLines;

  double? spacing;
  double? iconSize;
  Widget? iconLeft;
  Widget? iconRight;

  double borderRadius;
  BoxBorder? border;
  ApBorderType borderType;

  double? width;
  double? height;
  Color backroundColor;
  Color? backroundColorPressed;
  EdgeInsets? padding;
  List<BoxShadow>? shadow;
  BoxConstraints? constraints;
  bool disabled;
  Function()? onPressed;

  @override
  State<StatefulWidget> createState() => _ApButton();

  @override
  Widget outline() {
    border = GradientBorder(borderGradient: LinearGradient(colors: apColors.primaryGradient));
    titleStyle = ApTextStyles.body_highlight;
    backroundColor = apColors.background;
    backroundColorPressed = apColors.primary_0;
    return this;
  }

  @override
  Widget primary() {
    titleStyle = ApTextStyles.body_highlight;
    backroundColor = apColors.primary_3;
    backroundColorPressed = apColors.primary_6;
    return this;
  }

  @override
  Widget secondary() {
    titleStyle = ApTextStyles.body_highlight;
    backroundColor = apColors.onBackground_1;
    backroundColorPressed = apColors.onBackground_3;
    return this;
  }

  @override
  Widget subtle() {
    titleStyle = ApTextStyles.body_highlight;
    backroundColor = apColors.background;
    backroundColorPressed = apColors.onBackground_1;
    return this;
  }

}

class _ApButton extends State<ApButton> {
  bool _onTap = false;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: widget.disabled,
      child: Opacity(
        opacity:widget.disabled ? 0.3:1,
        child: widget.borderType == ApBorderType.dashed ? DottedBorder(
            padding: EdgeInsets.zero,
            color: widget.border?.top.color ?? Colors.transparent,
            strokeWidth: widget.border?.top.width ?? 0,
            radius: Radius.circular(widget.borderRadius),
            borderType: BorderType.RRect,
            dashPattern: const [3.4],
            child: _buildBody(context)
        ) : _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return GestureDetector(
        onTap: widget.onPressed,
        onTapDown: widget.backroundColorPressed == null ? null : (v)=> setState(() {_onTap = true;}),
        onTapCancel: widget.backroundColorPressed == null ? null : ()=> setState(() {_onTap = false;}),
        onTapUp: widget.backroundColorPressed == null ? null : (v)=> setState(() {_onTap = false;}),
        child: Container(
            constraints: widget.constraints,
            width: widget.width,
            height: widget.height,
            decoration:BoxDecoration(
              color: _onTap ? widget.backroundColorPressed : widget.backroundColor,
              borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
              border: widget.border,
              boxShadow: widget.shadow,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: widget.titleAlignment,
              children: [
                Padding(
                  padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        WidgetSpan(
                            child: widget.iconLeft!= null?Padding(
                              padding: EdgeInsets.only(right: (widget.title?.isNotEmpty ?? false) ? widget.spacing??0:0, top: 3),
                              child: SizedBox(width: widget.iconSize, height: widget.iconSize,child: widget.iconLeft,),
                            ) : const SizedBox(),
                            alignment: PlaceholderAlignment.middle
                        ),
                        TextSpan(text: widget.title ?? '',
                          style: widget.titleStyle ?? const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        WidgetSpan(
                            child: widget.titleWidget!= null?Padding(
                              padding: EdgeInsets.only(left: widget.spacing??0),
                              child: widget.titleWidget,
                            ) : const SizedBox(),
                            alignment: PlaceholderAlignment.middle
                        ),
                        WidgetSpan(
                            child: widget.iconRight!= null?Padding(
                              padding: EdgeInsets.only(left: widget.spacing??0),
                              child: SizedBox(width: widget.iconSize, height: widget.iconSize,child: widget.iconRight,),
                            ) : const SizedBox(),
                            alignment: PlaceholderAlignment.middle
                        ),
                      ],
                    ),
                    maxLines: widget.maxLines,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            )
        )
    );
  }
}