import 'package:url_launcher/url_launcher_string.dart';

class IntentUtils {
  static initCall(String number) async {
    String url = "tel:$number";
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch url';
    }
  }

  static initSMS(String number) async {
    String url = "sms:$number";
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch url';
    }
  }

  static initMail(String address, String subject, String body) async {
    String url = "mailto:$address?subject=$subject&body=$body";
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch url';
    }
  }

  static openMaps(String title, String latitude, String longitude) async {
    // String googleUrl =
    //     'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude&z=17';

    String googleUrl = "comgooglemaps://?daddr=$latitude,$longitude&directionsmode=driving";

    // String googleUrl =
    // 'comgooglemaps://?center=$latitude,$longitude&zoom=14';
    String appleUrl = 'https://maps.apple.com/?sll=$latitude,$longitude';
    if (await canLaunchUrlString(googleUrl)) {
      await launchUrlString(googleUrl);
    } else if (await canLaunchUrlString(appleUrl)) {
      await launchUrlString(appleUrl);
    } else {
      throw 'Could not launch url';
    }
  }

  static openGoogleMaps(String address) async {
    String query = Uri.encodeComponent(address);
    String googleUrl = "https://www.google.com/maps/search/?api=1&query=$query";
    if (await canLaunchUrlString(googleUrl)) {
      await launchUrlString(googleUrl);
    } else {
      throw 'Could not launch url';
    }
  }

  static openBrowser(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch url';
    }
  }
}
