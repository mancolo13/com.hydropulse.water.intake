import 'dart:developer' as developer;
import 'package:url_launcher/url_launcher.dart';

class RoutingService {
  static const String endpointUrl = 'https://opticlous.site/771WGnv4';

  static Future<bool> openPartnerLink() async {
    try {
      final uri = Uri.parse(endpointUrl);
      if (await canLaunchUrl(uri)) {
        return await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
      return false;
    } catch (e) {
      developer.log('Error opening partner URL: $e', name: 'RoutingService');
      return false;
    }
  }
}
