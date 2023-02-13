// import 'dart:async';
// import 'dart:developer';
// import 'package:Naqaa/constants/border_radius_const.dart';
// import 'package:Naqaa/constants/colors_const.dart';
// import 'package:Naqaa/constants/spacing_const.dart';
// import 'package:Naqaa/features/home/presentation/constants.dart';
// import 'package:Naqaa/features/home/presentation/controllers/home_controller.dart';
// import 'package:Naqaa/features/home/presentation/providers/alarms_provider.dart';
// import 'package:Naqaa/features/home/presentation/providers/devices_info_provider.dart';
// import 'package:Naqaa/features/home/presentation/widgets/bounce.dart';
// import 'package:Naqaa/features/home/presentation/widgets/custom_app_bar.dart';
// import 'package:Naqaa/features/home/presentation/widgets/options_section.dart';
// import 'package:Naqaa/providers/google_map_direction_provider.dart';
// import 'package:Naqaa/services/polyline_result.dart';
// import 'package:Naqaa/utils/theme/extensions.dart';
// import 'package:Naqaa/widgets/loading_container.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:collection/collection.dart';
// import 'package:percent_indicator/percent_indicator.dart';

// class HomeScreen extends ConsumerStatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   ConsumerState<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends ConsumerState<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorsConst.lightGreyBackground,
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(160.h), // here the desired height
//         child: const CustomAppBar(),
//       ),
//       body: Row(children: [
//         const OptionsSection(),
//         MiddleSection(),
//         RightSection(),
//       ]),
//     );
//   }
// }

// class RightSection extends ConsumerStatefulWidget {
//   const RightSection({
//     super.key,
//   });

//   @override
//   ConsumerState<RightSection> createState() => _RightSectionState();
// }

// class _RightSectionState extends ConsumerState<RightSection> {
//   @override
//   Widget build(BuildContext context) {
//     final devicesInfo = ref.watch(devicesInfoStreamProvider);
//     final alarmsData = ref.watch(alarmsStreamProvider);
//     return alarmsData.when(
//         data: (alarms) => Container(
//               padding: EdgeInsets.all(25.w),
//               width: 326.w,
//               color: ColorsConst.white,
//               child: Column(
//                 children: [
//                   Text(
//                     "Cans Status Summary",
//                     style: context.textThemes.headlineSmall?.copyWith(
//                       color: ColorsConst.greenTitle,
//                       fontWeight: FontWeight.w700,
//                       fontSize: 22.sp,
//                     ),
//                   ),
//                   SpacingConst.vSpacing20,
//                   Container(
//                     child: devicesInfo.when(
//                         data: (devicesInfo) => ListView(
//                             shrinkWrap: true,
//                             children: List.generate(
//                               devicesInfo?.length ?? 0,
//                               (index) {
//                                 return devicesInfo == null ||
//                                         devicesInfo.isEmpty
//                                     ? Text("There are no devices")
//                                     : Column(
//                                         children: [
//                                           Row(
//                                             children: [
//                                               SizedBox(
//                                                 width: 37.h,
//                                                 child: const Image(
//                                                   fit: BoxFit.contain,
//                                                   image: AssetImage(
//                                                       'assets/images/trash.png'),
//                                                 ),
//                                               ),
//                                               SpacingConst.hSpacing16,
//                                               Column(
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                 children: [
//                                                   Text(
//                                                     "Trash Can #${devicesInfo[index].id}",
//                                                     style: context
//                                                         .textThemes.bodyMedium
//                                                         ?.copyWith(
//                                                       color: ColorsConst
//                                                           .primaryBlue,
//                                                       fontWeight:
//                                                           FontWeight.w700,
//                                                     ),
//                                                   ),
//                                                   SpacingConst.vSpacing8,
//                                                   Row(
//                                                     children: [
//                                                       Container(
//                                                         width: 8.w,
//                                                         height: 8.w,
//                                                         decoration:
//                                                             BoxDecoration(
//                                                                 color: HomeController
//                                                                     .getColorBasedOnSeverity(
//                                                                   alarms
//                                                                           ?.firstWhereOrNull((alarm) =>
//                                                                               alarm.source.id ==
//                                                                               devicesInfo[index].id)
//                                                                           ?.severity ??
//                                                                       "WARNING",
//                                                                 ),
//                                                                 borderRadius:
//                                                                     BorderRadiusConst
//                                                                         .largeBorderRadius),
//                                                       ),
//                                                       SpacingConst.hSpacing6,
//                                                       Text(
//                                                         alarms
//                                                                 ?.firstWhereOrNull((alarm) =>
//                                                                     alarm.source
//                                                                         .id ==
//                                                                     devicesInfo[
//                                                                             index]
//                                                                         .id)
//                                                                 ?.text ??
//                                                             "Empty",
//                                                         style: context
//                                                             .textThemes
//                                                             .bodySmall
//                                                             ?.copyWith(
//                                                           color: ColorsConst
//                                                               .primaryBlue,
//                                                           fontWeight:
//                                                               FontWeight.w500,
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                   SpacingConst.vSpacing6,
//                                                   Text(
//                                                     "${devicesInfo[index].c8y_Position.lat}, ${devicesInfo[index].c8y_Position.lng}",
//                                                     style: context
//                                                         .textThemes.bodySmall
//                                                         ?.copyWith(
//                                                       color: ColorsConst
//                                                           .primaryBlue,
//                                                       fontWeight:
//                                                           FontWeight.w500,
//                                                     ),
//                                                   ),
//                                                   // SpacingConst.vSpacing8,
//                                                   // RichText(
//                                                   //   text: TextSpan(
//                                                   //     style: context
//                                                   //         .textThemes.bodySmall
//                                                   //         ?.copyWith(
//                                                   //       color: ColorsConst
//                                                   //           .primaryBlue,
//                                                   //       fontWeight:
//                                                   //           FontWeight.w500,
//                                                   //     ),
//                                                   //     children: [
//                                                   //       TextSpan(
//                                                   //         text: "Time: ",
//                                                   //       ),
//                                                   //       TextSpan(
//                                                   //         text:
//                                                   //             "${ref.watch(googleMapDirectionResultProvider(LatLng(devicesInfo[index].c8y_Position.lat, devicesInfo[index].c8y_Position.lng))).maybeWhen(orElse: () => "", data: (data) => data?.duration ?? "Unknown")}",
//                                                   //         style: const TextStyle(
//                                                   //             color: ColorsConst
//                                                   //                 .primaryBlue),
//                                                   //       ),
//                                                   //     ],
//                                                   //   ),
//                                                   // ),
//                                                 ],
//                                               ),
//                                             ],
//                                           ),
//                                           SpacingConst.vSpacing6,
//                                           SizedBox(
//                                             width: 250.w,
//                                             child: Divider(
//                                               color: ColorsConst.lightGrey,
//                                             ),
//                                           ),
//                                           SpacingConst.vSpacing16,
//                                         ],
//                                       );
//                               },
//                             )),
//                         error: (error, stackTrace) => Text("An Error ocurred"),
//                         loading: () => LoadingContainer(
//                               width: 326.w,
//                               height: double.maxFinite,
//                             )),
//                   ),
//                 ],
//               ),
//             ),
//         error: (error, stackTrace) => Text("An Error ocurred"),
//         loading: () => LoadingContainer(
//               width: 326.w,
//               height: double.maxFinite,
//             ));
//   }
// }

// class MiddleSection extends ConsumerStatefulWidget {
//   MiddleSection({
//     super.key,
//   });

//   @override
//   ConsumerState<MiddleSection> createState() => _MiddleSectionState();
// }

// class _MiddleSectionState extends ConsumerState<MiddleSection> {
//   final Completer<GoogleMapController> _googleMapController = Completer();

//   GoogleMapController? newMapController;
//   BitmapDescriptor blueMarker = BitmapDescriptor.defaultMarker;
//   BitmapDescriptor orangeMarker = BitmapDescriptor.defaultMarker;
//   BitmapDescriptor yellowMarker = BitmapDescriptor.defaultMarker;
//   BitmapDescriptor redMarker = BitmapDescriptor.defaultMarker;

//   @override
//   void initState() {
//     loadMarkersImages();
//     super.initState();
//   }

//   loadMarkersImages() async {
//     BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(10, 10)),
//             'assets/images/blue_marker.png')
//         .then((imageMarker) {
//       setState(() {
//         blueMarker = imageMarker;
//       });
//     });
//     BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(10, 10)),
//             'assets/images/yellow_marker.png')
//         .then((imageMarker) {
//       setState(() {
//         yellowMarker = imageMarker;
//       });
//     });
//     BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(10, 10)),
//             'assets/images/orange_marker.png')
//         .then((imageMarker) {
//       setState(() {
//         orangeMarker = imageMarker;
//       });
//     });
//     BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(10, 10)),
//             'assets/images/red_marker.png')
//         .then((imageMarker) {
//       setState(() {
//         redMarker = imageMarker;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final devicesInfo = ref.watch(devicesInfoStreamProvider);
//     final alarmsData = ref.watch(alarmsStreamProvider);
//     final googleMapDestination = ref.watch(googleMapDestinationProvider);
//     final alarmId = ref.watch(alarmIdProvider);

//     return alarmsData.when(
//       data: (alarms) => devicesInfo.when(
//         data: (devicesList) => Expanded(
//           child: Container(
//             margin: EdgeInsets.all(18.w),
//             color: ColorsConst.lightGreyBackground,
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     Bounce(
//                       onTap: () {},
//                       child: Container(
//                         padding: EdgeInsets.all(14.w),
//                         width: 389.w,
//                         height: 152.h,
//                         decoration: BoxDecoration(
//                           color: ColorsConst.gradientBlue,
//                           borderRadius: BorderRadiusConst.mediumBorderRadius,
//                         ),
//                         child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "Today",
//                                 style: context.textThemes.bodyMedium?.copyWith(
//                                     color: ColorsConst.white,
//                                     fontWeight: FontWeight.w600),
//                               ),
//                               SpacingConst.hSpacing20,
//                               Center(
//                                 child: Text(
//                                   "Fullness \nRatio",
//                                   style: context.textThemes.headlineMedium
//                                       ?.copyWith(
//                                     color: ColorsConst.white,
//                                     fontWeight: FontWeight.w700,
//                                     fontSize: 26.sp,
//                                   ),
//                                 ),
//                               ),
//                               SpacingConst.hSpacing40,
//                               Center(
//                                   child: CircularPercentIndicator(
//                                 circularStrokeCap: CircularStrokeCap.round,
//                                 animation: true,
//                                 animationDuration: 1200,
//                                 radius: 45.w,
//                                 lineWidth: 13.w,
//                                 percent: HomeController.getTotalFullnessRatio(
//                                     devicesList, alarms),
//                                 center: new Text(
//                                   "${HomeController.getTotalFullnessRatio(devicesList, alarms) * 100}%",
//                                   style: TextStyle(
//                                     color: ColorsConst.gradientPinkOne,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 16.sp,
//                                   ),
//                                 ),
//                                 backgroundColor: ColorsConst.white,
//                                 linearGradient: LinearGradient(
//                                   begin: Alignment.topLeft,
//                                   end: Alignment.bottomRight,
//                                   colors: [
//                                     ColorsConst.gradientPinkOne,
//                                     ColorsConst.gradientPinkTwo,
//                                   ],
//                                 ),
//                               )),
//                             ]),
//                       ),
//                     ),
//                     const Spacer(),
//                     Bounce(
//                       onTap: () {},
//                       child: Container(
//                         width: 389.w,
//                         height: 152.h,
//                         padding: EdgeInsets.all(14.w),
//                         decoration: BoxDecoration(
//                           gradient: const LinearGradient(
//                             begin: Alignment.topLeft,
//                             end: Alignment.bottomRight,
//                             colors: [
//                               ColorsConst.gradientYellowOne,
//                               ColorsConst.gradientYellowTwo,
//                             ],
//                           ),
//                           borderRadius: BorderRadiusConst.mediumBorderRadius,
//                         ),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Today",
//                               style: context.textThemes.bodyMedium?.copyWith(
//                                   color: ColorsConst.white,
//                                   fontWeight: FontWeight.w600),
//                             ),
//                             SpacingConst.hSpacing20,
//                             Center(
//                               child: Text(
//                                 "Total Collected \nTrash Cans",
//                                 style:
//                                     context.textThemes.headlineSmall?.copyWith(
//                                   color: ColorsConst.white,
//                                   fontWeight: FontWeight.w700,
//                                   fontSize: 26.sp,
//                                 ),
//                               ),
//                             ),
//                             SpacingConst.hSpacing20,
//                             Center(
//                               child: Text(
//                                 // check how many cans has been acknowledged in the same day
//                                 "${ref.watch(totalCollectedTrashesProvider)}",
//                                 style:
//                                     context.textThemes.headlineLarge?.copyWith(
//                                   color: ColorsConst.white,
//                                   fontWeight: FontWeight.w700,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//                 SpacingConst.vSpacing16,
//                 SizedBox(
//                   height: 388.h,
//                   child: Center(
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(30),
//                         topRight: Radius.circular(30),
//                         bottomRight: Radius.circular(30),
//                         bottomLeft: Radius.circular(30),
//                       ),
//                       child: Align(
//                         alignment: Alignment.bottomRight,
//                         widthFactor: 2.5,
//                         child: Stack(
//                           children: [
//                             GoogleMap(
//                                 trafficEnabled: true,
//                                 compassEnabled: true,
//                                 myLocationEnabled: true,
//                                 zoomGesturesEnabled: true,
//                                 tiltGesturesEnabled: false,
//                                 initialCameraPosition: CameraPosition(
//                                   target: devicesInfo.maybeWhen(
//                                       data: (devicesList) {
//                                         return LatLng(
//                                             devicesList!.first.c8y_Position.lat,
//                                             devicesList.first.c8y_Position.lng);
//                                       },
//                                       orElse: () =>
//                                           LatLng(26.293032, 50.214039)),
//                                   zoom: 14,
//                                 ),
//                                 onMapCreated: (GoogleMapController controller) {
//                                   _googleMapController.complete(controller);
//                                   newMapController = controller;
//                                   newMapController!
//                                       .setMapStyle(googleDarkTheme);
//                                 },
//                                 markers: devicesList != null &&
//                                         devicesList.isNotEmpty
//                                     ? devicesList
//                                         .map(
//                                           (device) => Marker(
//                                               markerId:
//                                                   MarkerId('${device.id}'),
//                                               position: LatLng(
//                                                 device.c8y_Position.lat,
//                                                 device.c8y_Position.lng,
//                                               ),
//                                               infoWindow: InfoWindow(
//                                                   title: '${device.name}'),
//                                               // search in the alarm for a signal of the device
//                                               // if there is no previous alarm in the system, the status will be the first state (Blue - Warning)
//                                               icon: getMarkerBasedOnSeverity(
//                                                 alarms
//                                                         ?.firstWhereOrNull(
//                                                             (alarm) =>
//                                                                 alarm.source
//                                                                     .id ==
//                                                                 device.id)
//                                                         ?.severity ??
//                                                     "WARNING",
//                                               ),
//                                               onTap: () async {
//                                                 LatLng markerLocation = LatLng(
//                                                     device.c8y_Position.lat,
//                                                     device.c8y_Position.lng);

//                                                 ref
//                                                         .read(
//                                                             googleMapDirectionResultStateProvider
//                                                                 .notifier)
//                                                         .state =
//                                                     await ref
//                                                         .read(
//                                                             googleMapDirectionResultProvider(
//                                                                 markerLocation))
//                                                         .value;

//                                                 ref
//                                                     .read(
//                                                         googleMapDetailsVisibility
//                                                             .notifier)
//                                                     .state = true;

//                                                 ref
//                                                     .read(
//                                                         googleMapDestinationProvider
//                                                             .notifier)
//                                                     .state = markerLocation;

//                                                 ref
//                                                     .read(alarmIdProvider
//                                                         .notifier)
//                                                     .state = device.id;
//                                               }),
//                                         )
//                                         .toSet()
//                                     : {},
//                                 polylines: ref
//                                         .watch(
//                                             googleMapDirectionResultStateProvider)
//                                         ?.directionPolylines ??
//                                     {},
//                                 onTap: (argument) {
//                                   ref
//                                       .read(googleMapDetailsVisibility.notifier)
//                                       .state = false;
//                                   ref
//                                       .read(
//                                           googleMapDestinationProvider.notifier)
//                                       .state = null;
//                                 }),
//                             Visibility(
//                               visible: ref.watch(googleMapDetailsVisibility),
//                               child: Align(
//                                 alignment: Alignment.bottomCenter,
//                                 child: Container(
//                                   height: 100.h,
//                                   width: 400.w,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.only(
//                                       topLeft: Radius.circular(10.w),
//                                       topRight: Radius.circular(10.w),
//                                     ),
//                                     color: ColorsConst.black,
//                                   ),
//                                   child: Padding(
//                                     padding:
//                                         EdgeInsets.symmetric(horizontal: 15.w),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Bounce(
//                                           onTap: () async {
//                                             if (alarmId != null) {
//                                               await acknowledgeAlarm(alarmId);
//                                               ref
//                                                   .read(
//                                                       totalCollectedTrashesProvider
//                                                           .notifier)
//                                                   .state += 1;
//                                             }
//                                           },
//                                           child: SizedBox(
//                                             width: 55.w,
//                                             child: Image.asset(
//                                                 "assets/images/garbage_track.png"),
//                                           ),
//                                         ),
//                                         Column(
//                                           children: [
//                                             SizedBox(
//                                                 height: 20.h,
//                                                 width: 30.w,
//                                                 child: Divider(
//                                                   thickness: 3.5.h,
//                                                   color: ColorsConst.lightGrey,
//                                                 )),
//                                             Text(
//                                               "${ref.watch(googleMapDirectionResultStateProvider)?.duration ?? ""}",
//                                               style: TextStyle(
//                                                 fontSize: 30.sp,
//                                                 color: ColorsConst.white,
//                                               ),
//                                             ),
//                                             SpacingConst.vSpacing6,
//                                             Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.center,
//                                               children: [
//                                                 Text(
//                                                   "${ref.watch(googleMapDirectionResultStateProvider)?.distance ?? ""} ⋅ ${ref.watch(googleMapDirectionResultStateProvider)?.durationNum != null ? DateTime.now().add(Duration(seconds: ref.watch(googleMapDirectionResultStateProvider)!.durationNum)).toString().substring(10, 16) : ""}",
//                                                   style: TextStyle(
//                                                     fontSize: 21.sp,
//                                                     color:
//                                                         ColorsConst.lightGrey,
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             // Text("4 min"),
//                                           ],
//                                         ),
//                                         Bounce(
//                                           onTap: () {
//                                             log(googleMapDestination
//                                                 .toString());
//                                             if (googleMapDestination != null) {
//                                               launchGoogleMap(LatLng(
//                                                   googleMapDestination.latitude,
//                                                   googleMapDestination
//                                                       .longitude));
//                                             }
//                                           },
//                                           child: SizedBox(
//                                             width: 50.w,
//                                             height: 50.w,
//                                             child: Image.asset(
//                                                 "assets/images/google_map_arrow.png"),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SpacingConst.vSpacing16,
//                 Container(
//                   padding:
//                       EdgeInsets.symmetric(horizontal: 17.w, vertical: 10.h),
//                   height: 230.h,
//                   decoration: BoxDecoration(
//                     color: ColorsConst.white,
//                     borderRadius: BorderRadiusConst.mediumBorderRadius,
//                   ),
//                   child: ListView(
//                     shrinkWrap: true,
//                     children: [
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Alarms",
//                             style: context.textThemes.headlineSmall?.copyWith(
//                               color: ColorsConst.redOne,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                       alarms != null && alarms.isNotEmpty
//                           ? Column(
//                               children: [
//                                 SpacingConst.vSpacing20,
//                                 Row(
//                                   children: [
//                                     SizedBox(
//                                       width: 140.w,
//                                       child: Text(
//                                         "Trash Can ID",
//                                         style: context.textThemes.bodyMedium
//                                             ?.copyWith(
//                                           color: ColorsConst.primaryBlue,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 175.w,
//                                       child: Text(
//                                         "Active alarms status",
//                                         style: context.textThemes.bodyMedium
//                                             ?.copyWith(
//                                           color: ColorsConst.primaryBlue,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 200.w,
//                                       child: Text(
//                                         "Last alarm message",
//                                         style: context.textThemes.bodyMedium
//                                             ?.copyWith(
//                                           color: ColorsConst.primaryBlue,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 175.w,
//                                       child: Text(
//                                         "Location",
//                                         style: context.textThemes.bodyMedium
//                                             ?.copyWith(
//                                           color: ColorsConst.primaryBlue,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 60.w,
//                                       child: Text(
//                                         "Setting",
//                                         style: context.textThemes.bodyMedium
//                                             ?.copyWith(
//                                           color: ColorsConst.primaryBlue,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             )
//                           : SizedBox.shrink(),
//                       SpacingConst.vSpacing16,
//                       Column(
//                         children: List.generate(
//                           alarms?.length ?? 0,
//                           (index) {
//                             return alarms == null || alarms.isEmpty
//                                 ? Text("No Alarms Found")
//                                 : Column(
//                                     children: [
//                                       Row(
//                                         children: [
//                                           SizedBox(
//                                             width: 140.w,
//                                             child: Row(
//                                               children: [
//                                                 SizedBox(
//                                                   width: 31.h,
//                                                   height: 31.h,
//                                                   child: const Image(
//                                                     fit: BoxFit.contain,
//                                                     image: AssetImage(
//                                                         'assets/images/trash.png'),
//                                                   ),
//                                                 ),
//                                                 Text(
//                                                   "#${alarms[index].source.id}",
//                                                   style: context
//                                                       .textThemes.bodySmall
//                                                       ?.copyWith(
//                                                     color:
//                                                         ColorsConst.primaryBlue,
//                                                     fontWeight: FontWeight.w500,
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             width: 175.w,
//                                             child: Row(
//                                               children: [
//                                                 Container(
//                                                   width: 8.w,
//                                                   height: 8.w,
//                                                   decoration: BoxDecoration(
//                                                       color: HomeController
//                                                           .getColorBasedOnSeverity(
//                                                               alarms[index]
//                                                                   .severity),
//                                                       borderRadius:
//                                                           BorderRadiusConst
//                                                               .largeBorderRadius),
//                                                 ),
//                                                 SpacingConst.hSpacing6,
//                                                 Text(
//                                                   "${alarms[index].text}",
//                                                   style: context
//                                                       .textThemes.bodySmall
//                                                       ?.copyWith(
//                                                     color:
//                                                         ColorsConst.primaryBlue,
//                                                     fontWeight: FontWeight.w500,
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             width: 200.w,
//                                             child: Text(
//                                               "${HomeController.getDateFormatFromString(alarms[index].lastUpdated, "yMd")}, ${HomeController.getDateFormatFromString(alarms[index].lastUpdated, "jm")}",
//                                               style: context
//                                                   .textThemes.bodySmall
//                                                   ?.copyWith(
//                                                 color: ColorsConst.primaryBlue,
//                                                 fontWeight: FontWeight.w500,
//                                               ),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             width: 175.w,
//                                             child: Text(
//                                               "${devicesList?.firstWhereOrNull((device) => device.id == alarms[index].source.id)?.c8y_Position.lat.toStringAsFixed(4)}, ${devicesList?.firstWhereOrNull((device) => device.id == alarms[index].source.id)?.c8y_Position.lng.toStringAsFixed(4)}",
//                                               style: context
//                                                   .textThemes.bodySmall
//                                                   ?.copyWith(
//                                                 color: ColorsConst.primaryBlue,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                               width: 60.w,
//                                               child: const Image(
//                                                 image: AssetImage(
//                                                     "assets/images/options.png"),
//                                               )),
//                                         ],
//                                       ),
//                                     ],
//                                   );
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         loading: () => LoadingContainer(
//           width: 300.w,
//           height: double.maxFinite,
//         ),
//         error: (error, stackTrace) => Text("An error"),
//       ),
//       loading: () => Container(
//         width: 795.w,
//         margin: EdgeInsets.all(18.w),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 LoadingContainer(
//                   width: 389.w,
//                   height: 152.h,
//                 ),
//                 Spacer(),
//                 LoadingContainer(
//                   width: 389.w,
//                   height: 152.h,
//                 ),
//               ],
//             ),
//             SpacingConst.vSpacing16,
//             LoadingContainer(
//               height: 388.h,
//               width: double.maxFinite,
//             ),
//             SpacingConst.vSpacing16,
//             LoadingContainer(
//               height: 230.h,
//               width: double.maxFinite,
//             ),
//           ],
//         ),
//       ),
//       error: (error, stackTrace) => Center(child: Text("An error ocurred")),
//     );
//   }

//   BitmapDescriptor getMarkerBasedOnSeverity(String severity) {
//     switch (severity) {
//       case "WARNING":
//         return blueMarker;
//       case "MINOR":
//         return yellowMarker;
//       case "MAJOR":
//         return orangeMarker;
//       case "CRITICAL":
//         return redMarker;
//       default:
//         return blueMarker;
//     }
//   }
// }

// // class RecitationChart extends StatelessWidget {
// //   RecitationChart({
// //     this.numberOfActualPages = 0,
// //     this.numberOfRequiredPages = 0,
// //     this.numberOfRemainingPages = 0,
// //     required this.recitationType,
// //     required this.progressPercentage,
// //   });

// //   final double progressPercentage;
// //   final double numberOfActualPages;
// //   final double numberOfRequiredPages;
// //   final double numberOfRemainingPages;
// //   final String recitationType;
// //   final Color barColor = Colors.red;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Center(
// //       child: Container(
// //         child: SfCircularChart(
// //           annotations: <CircularChartAnnotation>[
// //             CircularChartAnnotation(
// //               widget: Column(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: [
// //                   Text(
// //                     recitationType,
// //                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
// //                   ),
// //                   SizedBox(
// //                     height: 5,
// //                   ),
// //                   Text(
// //                     (progressPercentage * 100).toStringAsFixed(2) + "%",
// //                     style: TextStyle(
// //                         fontWeight: FontWeight.bold,
// //                         fontSize: 18,
// //                         color: barColor),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ],
// //           legend: Legend(
// //             isVisible: true,
// //             iconHeight: 15,
// //             iconWidth: 15,
// //             textStyle: TextStyle(
// //               fontFamily: "Almarai",
// //             ),
// //             alignment: ChartAlignment.center,
// //             overflowMode: LegendItemOverflowMode.wrap,
// //           ),
// //           series: <CircularSeries>[
// //             DoughnutSeries<RadialChart, String>(
// //               pointColorMapper: (RadialChart data, _) => data.color,
// //               dataSource: <RadialChart>[
// //                 RadialChart('نسبة إنجازك', numberOfActualPages, barColor,
// //                     "(وجه)", numberOfActualPages.toString()),
// //                 RadialChart('المطلوب', numberOfRequiredPages, Colors.amber,
// //                     "(وجه)", numberOfRequiredPages.toString()),
// //                 RadialChart(
// //                     'المتبقى على الخطة',
// //                     numberOfRemainingPages,
// //                     Colors.grey.shade200,
// //                     "(وجه)",
// //                     numberOfRemainingPages.toString()),
// //               ],
// //               radius: '90%',
// //               animationDuration: 1500,
// //               cornerStyle: CornerStyle.bothFlat,
// //               innerRadius: '60%',
// //               xValueMapper: (RadialChart data, _) =>
// //                   data.percentage + "  " + data.xData,
// //               yValueMapper: (RadialChart data, _) => data.yData,
// //               dataLabelMapper: (RadialChart data, _) => "${data.pages}",
// //               dataLabelSettings: const DataLabelSettings(
// //                 isVisible: true,
// //                 labelPosition: ChartDataLabelPosition.inside,
// //                 useSeriesColor: true,
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // @override
// // class RadialChart {
// //   RadialChart(this.xData, this.yData, this.color, this.percentage, this.pages);
// //   final String xData;
// //   final num yData;
// //   final String percentage;
// //   final Color color;
// //   final String pages;
// // }
