// import 'package:signalr_netcore/signalr_client.dart';
// import 'package:watd/core/Notifications/flutter_toast.dart';
// import 'package:watd/core/Notifications/notification_manager.dart';
// import 'package:watd/core/helpers/constants.dart';
// import 'package:watd/core/helpers/shared_prefs_helper.dart';
// import 'package:watd/features/auth/repo/auth_repo.dart';

// class SignalRService {
//   late HubConnection _hubConnection;
//   final AuthRepository _authRepository;

//   SignalRService(this._authRepository) {
//     initSignalR();
//   }

//   Future<void> initSignalR() async {
//     _hubConnection = HubConnectionBuilder()
//         .withUrl("https://finprojectapi.somee.com/broadcastHub",
//             options: HttpConnectionOptions(
//               accessTokenFactory: () async => await _getToken(),
//               requestTimeout: 100000,
//             ))
//         .withAutomaticReconnect()
//         .build();

//     int maxRetries = 3;
//     int currentRetry = 0;
//     while (currentRetry < maxRetries) {
//       try {
//         await _hubConnection.start();
//         print('Connection successfully started');
//         break; // Break the loop if connection is successful
//       } catch (e) {
//         currentRetry++;
//         print('Attempt $currentRetry: Error starting connection: $e');
//         if (currentRetry >= maxRetries) {
//           print('Max retries reached. Unable to establish connection.');
//         }
//       }
//     }

//     _subscribeToEvents();
//   }

//   void _subscribeToEvents() {
//   _hubConnection.on('ReceiveBroadcastMessage', (arguments) {
//     if (arguments != null && arguments.isNotEmpty && arguments[0] is String) {
//       String message = arguments[0] as String; // Safely cast to String
      
//       // Show a toast notification
//       showShortToast(message);

//       // Optionally, show a local notification as well
//       NotificationManager.showNotification(
//         title: 'New Broadcast',
//         body: message,
//       );
//     }
//   });
// }


//   Future<String> _getToken() async {
//     String? currentToken = await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
//   print('Current token: $currentToken');

//   if (currentToken == null || currentToken.isEmpty) {
//     print('Token is empty or null, attempting to refresh');
//     bool success = await _authRepository.refreshToken();
//     if (success) {
//       currentToken = await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
//       print('Token refreshed successfully: $currentToken');
//     } else {
//       print('Token refresh failed');
//     }
//   }

//   return currentToken ?? ''; 
//   }
// }
