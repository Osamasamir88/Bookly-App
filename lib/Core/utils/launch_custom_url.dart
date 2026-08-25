import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

launchCustomUrl(BuildContext context, String? url) async {
  if (url != null) {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  } else {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Cannot launch url')));
  }
}
