import 'package:flutter_local_notifications/flutter_local_notifications.dart';

initialNotification() async {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  final IOSInitializationSettings initializationSettingsIOS =
      IOSInitializationSettings();

  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );

  flutterLocalNotificationsPlugin.initialize(initializationSettings);
}

Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) async {
  print('onBackgroundMessage: $message');

  if (message.containsKey('notification')) {
    // Handle notification message
    final dynamic notification = message['notification'];
    print('raka notif $notification');
    showNotification(
      notificationsPlugin: FlutterLocalNotificationsPlugin(),
      title: notification['title'] ?? message['data']['title'],
      body: notification['body'] ?? message['data']['body'],
    );
  } else {
    // Handle data message
    final dynamic data = message['data'];
    print('raka $data');
    showNotification(
      notificationsPlugin: FlutterLocalNotificationsPlugin(),
      title: data['title'],
      body: data['body'],
    );
  }

  // Or do other work.
}

showNotification({
  FlutterLocalNotificationsPlugin notificationsPlugin,
  String title,
  String body,
}) async {
  var android = AndroidNotificationDetails(
    'id',
    'channel ',
    'description',
    priority: Priority.high,
    importance: Importance.max,
    sound: RawResourceAndroidNotificationSound('shopee_sound'),
  );
  var iOS = IOSNotificationDetails();

  var platform = new NotificationDetails(
    android: android,
    iOS: iOS,
  );

  var id = DateTime.now().millisecond;

  await notificationsPlugin.show(
    id,
    title,
    body,
    platform,
  );
}
