import 'dart:io';

// untuk handle SSL Handshake
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext securityContext) {
    return super.createHttpClient(securityContext)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
