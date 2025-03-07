// import 'dart:io';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class NotificationManager {
//   static final FlutterLocalNotificationsPlugin _notificationsPlugin = FlutterLocalNotificationsPlugin();

//   static Future<void> init() async {
//     const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
//     final InitializationSettings initializationSettings = InitializationSettings(
//       android: initializationSettingsAndroid,
//     );

//     await _notificationsPlugin.initialize(initializationSettings);
//     if (Platform.isAndroid) {
//       const AndroidNotificationChannel channel = AndroidNotificationChannel(
//         'high_importance_channel_1', // id
//         'High Importance Notifications-1', // title
//         description: 'This channel is used for important notifications.', // description
//         importance: Importance.high,
//       );

//       await _notificationsPlugin
//           .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
//           ?.createNotificationChannel(channel);
//     }
//   }

//   static Future<void> showNotification({
//     int id = 0,
//     String? title,
//     String? body,
//     String? payload,
//   }) async {
//     const NotificationDetails notificationDetails = NotificationDetails(
//       android: AndroidNotificationDetails(
//         'high_importance_channel_1',
//         'High Importance Notifications-1',
//         channelDescription: 'This channel is used for important notifications.',
//         importance: Importance.max,
//         priority: Priority.high,
//       ),
//     );
//     await _notificationsPlugin.show(id, title, body, notificationDetails, payload: payload);
//   }
// }
