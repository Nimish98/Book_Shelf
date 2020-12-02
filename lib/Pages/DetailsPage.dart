// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:flutter_uis/UI.dart';
// import 'package:flutter_uis/configs/App.dart';
// import 'package:flutter_uis/Utils.dart';
//
// import 'package:flutter_uis/widgets/Screen/Screen.dart';
// import 'package:flutter_uis/Mixins/HoverWidget.dart';
// import 'Dimensions.dart';
//
// enum AnimProp {
//   base,
//   circle,
//   bars,
// }
//
// class HFDDetailScreen extends StatefulWidget {
//   HFDDetailScreen({Key key}) : super(key: key);
//
//   @override
//   _HFDDetailScreenState createState() => _HFDDetailScreenState();
// }
//
// class _HFDDetailScreenState extends State<HFDDetailScreen>
//     with SingleTickerProviderStateMixin {
//   ScrollController scrollController = ScrollController();
//   double offset = 0.0;
//
//   @override
//   initState() {
//     Utils.lightStatusBar();
//
//     this.scrollController.addListener(() {
//       setState(() {
//         this.offset = this.scrollController.offset;
//       });
//     });
//
//     super.initState();
//   }
//
//   @override
//   dispose() {
//     Utils.darkStatusBar();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Dimensions.init(context);
//
//     final HFDFoodItem item = ModalRoute.of(context).settings.arguments;
//     final textStyle =
//     Theme.of(context).textTheme.bodyText1.copyWith(fontFamily: 'Nunito');
//
//     final baseDuration = Duration(milliseconds: 400);
//     final baseTween = Tween(begin: 0.0, end: 1.0);
//
//     MultiTween<AnimProp> tween = MultiTween<AnimProp>()
//       ..add(
//         AnimProp.base,
//         baseTween,
//         baseDuration,
//       )
//       ..add(
//         AnimProp.circle,
//         ConstantTween(0.0),
//         Duration(milliseconds: 300),
//       )
//       ..add(
//         AnimProp.circle,
//         baseTween,
//         baseDuration,
//       )
//       ..add(
//         AnimProp.bars,
//         ConstantTween(0.0),
//         Duration(milliseconds: 300),
//       )
//       ..add(
//         AnimProp.bars,
//         baseTween,
//         baseDuration,
//       );
//
//     return Container(
//       child: Screen(
//         theme: Theme.of(context).copyWith(
//           accentColor: theme.primary,
//           primaryColor: theme.primary,
//         ),
//         textStyle: textStyle,
//         builder: (_) {
//           double safeOffset = this.offset;
//
//           if (safeOffset > Dimensions.coverImageHeight) {
//             safeOffset = Dimensions.coverImageHeight;
//           }
//
//           return SingleChildScrollView(
//             controller: this.scrollController,
//             child: Stack(
//               children: <Widget>[
//                 HFDDetailScreenBackground(
//                   item: item,
//                   offset: this.offset,
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(
//                     top: Dimensions.coverImageHeight - Dimensions.contentHeight,
//                   ),
//                   child: Column(
//                     children: <Widget>[
//                       HFDDetailScreenBackgroundImageBody(item: item),
//                       CustomAnimation<MultiTweenValues<AnimProp>>(
//                         tween: tween,
//                         duration: tween.duration,
//                         delay: Duration(milliseconds: 400),
//                         builder: (context, child, multiTrackAnimations) =>
//                             Opacity(
//                               opacity: multiTrackAnimations.get(AnimProp.base),
//                               child: Container(
//                                 transform: Matrix4.identity()
//                                   ..translate(
//                                     0.0,
//                                     Utils.rangeMap(
//                                       multiTrackAnimations.get(AnimProp.base),
//                                       0.0,
//                                       1.0,
//                                       80,
//                                       (-AppDimensions.padding * 8),
//                                     ),
//                                   ),
//                                 child: Column(
//                                   children: <Widget>[
//                                     HFDDetailScreenBody(
//                                       item: item,
//                                       circle: multiTrackAnimations.get(
//                                         AnimProp.circle,
//                                       ),
//                                       bars: multiTrackAnimations.get(
//                                         AnimProp.bars,
//                                       ),
//                                     ),
//                                     Container(
//                                       height: AppDimensions.padding * 4,
//                                     ),
//                                     Container(
//                                       width:
//                                       (AppDimensions.miniContainerWidth * 0.7)
//                                           .clamp(180.0, 300.0),
//                                       child: RaisedButton(
//                                         onPressed: () {},
//                                         color: theme.primary,
//                                         padding: EdgeInsets.symmetric(
//                                           vertical: AppDimensions.padding * 1.8,
//                                         ),
//                                         shape: new RoundedRectangleBorder(
//                                           borderRadius: BorderRadius.circular(80),
//                                         ),
//                                         child: Text(
//                                           App.translate(
//                                             HFDDetailScreenMessages.orderNow,
//                                             context,
//                                           ),
//                                           style: textStyle.copyWith(
//                                             fontSize: 17,
//                                             color: Colors.white,
//                                             fontWeight: FontWeight.w600,
//                                             fontFamily: "Nunito",
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(
//                     top: safeOffset < 0 ? 0 : safeOffset,
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(
//                     top: safeOffset < 0 ? 0 : safeOffset,
//                   ),
//                 ),
//                 HFDDetailScreenHeader(),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
// class HFDDetailScreenBackground extends StatelessWidget {
//   HFDDetailScreenBackground({@required this.offset, @required this.item});
//
//   final double offset;
//   final HFDFoodItem item;
//
//   @override
//   Widget build(BuildContext context) {
//     double height = Dimensions.coverImageHeight + (this.offset * -1);
//
//     if (height < 0) {
//       height = 0;
//     }
//
//     return Container(
//       height: height,
//       alignment: Alignment.bottomCenter,
//       transform: Matrix4.identity()..translate(0.0, this.offset),
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           image: ExactAssetImage(this.item.image),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: BackdropFilter(
//         filter: ImageFilter.blur(
//           sigmaX: 10,
//           sigmaY: 10,
//         ),
//         child: Container(
//           color: Colors.transparent,
//           child: Container(
//             width: AppDimensions.miniContainerWidth * 1.1,
//             height: double.infinity,
//             child: Image.asset(
//               this.item.image,
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class HFDDetailScreenBackgroundImageBody extends StatelessWidget {
//   HFDDetailScreenBackgroundImageBody({
//     @required this.item,
//   });
//
//   final HFDFoodItem item;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.topCenter,
//       width: double.infinity,
//       height: Dimensions.contentHeight,
//       decoration: BoxDecoration(
//         color: Colors.black.withOpacity(0.4),
//       ),
//       child: Container(
//         height: double.infinity,
//         width: AppDimensions.miniContainerWidth,
//         padding: EdgeInsets.all(AppDimensions.padding * 2),
//         margin: EdgeInsets.only(bottom: AppDimensions.padding * 8),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Row(
//               children: <Widget>[
//                 Row(
//                   children: List.generate(
//                     5,
//                         (index) {
//                       bool active =
//                           this.item.stars.floor().clamp(1, 5) < (index + 1);
//                       return Container(
//                         child: Icon(
//                           active
//                               ? MaterialCommunityIcons.star_outline
//                               : MaterialCommunityIcons.star,
//                           color: theme.primary,
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 Flexible(child: Container()),
//                 Container(
//                   decoration: BoxDecoration(
//                     color: theme.primary,
//                     borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(16.0),
//                     ),
//                   ),
//                   padding: EdgeInsets.symmetric(
//                     horizontal: AppDimensions.padding * 4,
//                     vertical: AppDimensions.padding * 1.5,
//                   ),
//                   child: Text(
//                     "\$ ${this.item.price.toStringAsFixed(2)}",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ],
//             ),
//             Container(height: AppDimensions.padding * 3),
//             Text(
//               this.item.name,
//               style: TextStyle(
//                 fontWeight: FontWeight.w600,
//                 color: Colors.white.withOpacity(0.88),
//                 fontSize: 12 + AppDimensions.ratio * 8,
//               ),
//             ),
//             Container(height: AppDimensions.padding),
//             Expanded(
//               child: Text(
//                 this.item.description,
//                 overflow: TextOverflow.clip,
//                 style: TextStyle(
//                   fontSize: 15,
//                   color: Colors.white.withOpacity(0.6),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class HFDDetailScreenBody extends StatelessWidget {
//   HFDDetailScreenBody({
//     @required this.item,
//     @required this.bars,
//     @required this.circle,
//   });
//
//   final HFDFoodItem item;
//   final double bars;
//   final double circle;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(AppDimensions.padding * 2),
//       width: (AppDimensions.miniContainerWidth - AppDimensions.padding * 8),
//       decoration: BoxDecoration(
//         color: AppTheme.background,
//         borderRadius: BorderRadius.circular(8.0),
//         boxShadow: [
//           BoxShadow(
//             blurRadius: 10.0,
//             offset: Offset(0.0, 4.0),
//             color: AppTheme.text02,
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           Padding(
//             padding: EdgeInsets.all(AppDimensions.padding * 2),
//             child: Text(
//               App.translate(
//                 HFDDetailScreenMessages.nutritionFact,
//                 context,
//               ),
//               style: TextStyle(
//                 fontSize: 10 + AppDimensions.ratio * 5,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//           Row(
//             children: <Widget>[
//               Container(
//                 width: 60,
//                 height: 60,
//                 margin: EdgeInsets.only(
//                   left: AppDimensions.padding * 2,
//                   right: AppDimensions.padding * 2,
//                 ),
//                 child: CircularPercentIndicator(
//                   radius: 52.0,
//                   lineWidth: 4.5,
//                   center: new Text(
//                     "${item.kcal.toStringAsFixed(0)}",
//                   ),
//                   progressColor: theme.primary,
//                   percent: this.circle,
//                 ),
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     "${item.kcal.toStringAsFixed(0)} kcal",
//                     style: TextStyle(
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   Text(
//                     "${item.dailyCal}% ${App.translate(
//                       HFDDetailScreenMessages.dailyCalories,
//                       context,
//                     )}",
//                     style: TextStyle(
//                       fontWeight: FontWeight.w600,
//                       color: AppTheme.subText3,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           this.buildLinearBar(
//             item.carbo,
//             App.translate(
//               HFDDetailScreenMessages.carbo,
//               context,
//             ),
//             this.bars,
//           ),
//           this.buildLinearBar(
//             item.protien,
//             App.translate(
//               HFDDetailScreenMessages.protein,
//               context,
//             ),
//             this.bars,
//           ),
//           this.buildLinearBar(
//             item.fat,
//             App.translate(
//               HFDDetailScreenMessages.fat,
//               context,
//             ),
//             this.bars,
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget buildLinearBar(int no, String label, double animate) {
//     return Container(
//       margin: EdgeInsets.symmetric(
//         horizontal: AppDimensions.padding * 2,
//         vertical: AppDimensions.padding * 1,
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           Flexible(
//             flex: 6,
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(8.0),
//               child: Container(
//                 height: 4 + AppDimensions.ratio * 1,
//                 child: LinearProgressIndicator(
//                   value: Utils.rangeMap(animate, 0.0, 1.0, 0.0, no / 100),
//                   backgroundColor: AppTheme.text03,
//                 ),
//               ),
//             ),
//           ),
//           Flexible(
//             flex: 1,
//             child: Container(
//               width: double.infinity,
//               child: Text(
//                 "$no%",
//                 textAlign: TextAlign.right,
//                 style: TextStyle(
//                   fontWeight: FontWeight.w700,
//                   fontSize: 5 + AppDimensions.ratio * 3,
//                 ),
//               ),
//             ),
//           ),
//           Flexible(
//             flex: 2,
//             child: Container(
//               padding: EdgeInsets.only(left: AppDimensions.padding * 2),
//               width: double.infinity,
//               child: Text(
//                 label,
//                 textAlign: TextAlign.left,
//                 style: TextStyle(
//                   color: AppTheme.subText3,
//                   fontSize: 5 + AppDimensions.ratio * 4,
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
//
// class HFDDetailScreenHeader extends StatelessWidget {
//   HFDDetailScreenHeader();
//
//   @override
//   Widget build(BuildContext context) {
//     final padding = AppDimensions.padding * 3;
//     return Positioned(
//       top: padding,
//       left: padding,
//       right: padding,
//       child: Padding(
//         padding: Utils.safePaddingUnit(context, "top"),
//         child: Row(
//           children: <Widget>[
//             Container(
//               width: 50,
//               height: 50,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Colors.white.withOpacity(0.3),
//               ),
//               child: BackButton(),
//             ),
//             Flexible(child: Container()),
//             Container(
//               width: 50,
//               height: 50,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Colors.white.withOpacity(0.3),
//               ),
//               child: IconButton(
//                 onPressed: () {},
//                 icon: Icon(MaterialCommunityIcons.heart_outline),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class Dimensions {
//   static double coverImageHeight;
//   static double contentHeight;
//
//   static init(BuildContext context) {
//     App.init(context);
//
//     final height = AppDimensions.size.height;
//     coverImageHeight = height * 0.60;
//     contentHeight = coverImageHeight * 0.50;
//
//     if (height < 980) {
//       coverImageHeight = height * 0.75;
//       contentHeight = coverImageHeight * 0.55;
//     }
//     if (height < 800) {
//       coverImageHeight = height * 0.80;
//       contentHeight = coverImageHeight * 0.60;
//     }
//
//     if (height < 650) {
//       coverImageHeight = height * 0.85;
//       contentHeight = coverImageHeight * 0.65;
//     }
//     if (height < 500) {
//       coverImageHeight = (500);
//       contentHeight = coverImageHeight * 0.70;
//     }
//   }
// }
//
//
// class AppDimensions {
//   static double maxContainerWidth;
//   static double miniContainerWidth;
//
//   static bool isLandscape;
//   static double padding;
//   static double ratio;
//
//   static Size size;
//
//   static init(BuildContext context) {
//     UI.init(context);
//     initPortrait();
//
//     size = MediaQuery.of(context).size;
//
//     maxContainerWidth = 540.0;
//     miniContainerWidth = maxContainerWidth * 0.9;
//
//     if (UI.lg) {
//       maxContainerWidth = 700.0;
//       miniContainerWidth = maxContainerWidth * 0.8;
//     }
//     if (UI.xl) {
//       maxContainerWidth = 820.0;
//       miniContainerWidth = maxContainerWidth * 0.7;
//     }
//     if (UI.xlg) {
//       maxContainerWidth = 1000.0;
//       miniContainerWidth = maxContainerWidth * 0.7;
//     }
//
//     if (maxContainerWidth > UI.getSize().width) {
//       maxContainerWidth = UI.getSize().width;
//       miniContainerWidth = UI.getSize().width - (AppDimensions.padding * 4);
//     }
//   }
//
//   static initPortrait() {
//     ratio = UI.width / UI.height;
//     double pixelDensity = UI.mediaQuery().devicePixelRatio;
//     ratio = (ratio) + ((pixelDensity + ratio) / 2);
//
//     if (UI.width <= 380 && pixelDensity >= 3) {
//       ratio *= 0.85;
//     }
//
//     initLargeScreens();
//     initSmallScreensHighDesnsity();
//
//     padding = ratio * 3;
//   }
//
//   static initLargeScreens() {
//     final safe = 2.4;
//
//     ratio *= 1.5;
//
//     if (ratio > safe) {
//       ratio = safe;
//     }
//   }
//
//   static initSmallScreensHighDesnsity() {
//     if (!UI.sm && ratio > 2.0) {
//       ratio = 2.0;
//     }
//     if (!UI.xs && ratio > 1.7) {
//       ratio = 1.7;
//     }
//     if (!UI.xxs && ratio > 1.5) {
//       ratio = 1.5;
//     }
//   }
//
//   static String inString() {
//     final ratio = UI.width / UI.height;
//     return """
//       Width: ${UI.width}
//       Height: ${UI.height}
//       ratio: $ratio
//       pixels: ${UI.mediaQuery().devicePixelRatio}
//     """;
//   }
// }
//
// import 'DeviceType.dart';
//
// class UI {
//   static MediaQueryData _mediaQueryData;
//   static double width;
//   static double height;
//   static double horizontal;
//   static double vertical;
//
//   static double _safeAreaHorizontal;
//   static double _safeAreaVertical;
//   static double safeWidth;
//   static double safeHeight;
//
//   static bool isTablet;
//   static double diagonal;
//
//   static bool xxs;
//   static bool xs;
//   static bool sm;
//   static bool md;
//   static bool xmd;
//   static bool lg;
//   static bool xl;
//   static bool xlg;
//   static bool xxlg;
//
//   static void init(BuildContext context) {
//     _mediaQueryData = MediaQuery.of(context);
//     initChecks(_mediaQueryData);
//
//     width = _mediaQueryData.size.width;
//     height = _mediaQueryData.size.height;
//     horizontal = width / 100;
//     vertical = height / 100;
//
//     _safeAreaHorizontal =
//         _mediaQueryData.padding.left + _mediaQueryData.padding.right;
//     _safeAreaVertical =
//         _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
//     safeWidth = (width - _safeAreaHorizontal);
//     safeHeight = (height - _safeAreaVertical);
//   }
//
//   static initChecks(MediaQueryData query) {
//     var size = query.size;
//     diagonal = sqrt((size.width * size.width) + (size.height * size.height));
//     // print('size: ${size.width}x${size.height}\n'
//     //     'pixelRatio: ${query.devicePixelRatio}\n'
//     //     'pixels: ${size.width * query.devicePixelRatio}x${size.height * query.devicePixelRatio}\n'
//     //     'diagonal: $diagonal\n'
//     //     'Device.get().isTablet ${Device.get().isTablet}\n'
//     //     'Device.get().isIphoneX ${Device.get().isIphoneX}');
//     isTablet = diagonal > 900.0 && Device.get().isTablet;
//     xxs = size.width > 300;
//     xs = size.width > 360;
//     sm = size.width > 480;
//     md = size.width > 600;
//     xmd = size.width > 720;
//     lg = size.width > 980;
//     xl = size.width > 1160;
//     xlg = size.width > 1400;
//     xxlg = size.width > 1700;
//   }
//
//   static MediaQueryData mediaQuery() => _mediaQueryData;
//
//   static Size getSize() => _mediaQueryData.size;
// }