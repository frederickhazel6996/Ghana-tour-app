import 'package:flutter/material.dart';

Color ghanaPrimary = Color(0xFFAEEA00);
Color ghanaTransparent = Color(0x0000000);
Color ghanaMain = Colors.green[600];
Color ghanaSecondary = Colors.green[400];
Color ghanaExtra = Colors.green[200];
Color ghanaExtra2 = Colors.green[100];

class HelpResource {
  static List ghanahelp = [
    {"title": "Police Emergency Numbers", "body": "112 or 191 or 1855"},
    {"title": "Ghana Fire Service Emergency Numbers", "body": "112 or 192"},
    {"title": "Ambulance Numbers", "body": "112 or 193"},
    {"title": "Coronavirus Hotline", "body": "112"}
  ];

  static List dos = [
    "- Don't keep large amounts of money on you",
    "- Buy stuff from shops",
    "- Ask your hotel manager for advice on 'safe' versus 'unsafe' local areas.",
    "- Keep a photocopy of your passport and all other important documents in a safe place.",
    "- Avoid incidents such as fights, riots or civil disturbances at all times."
  ];
  static List funFacts = [
    {
      "name": 'Greater Accra',
      "info": ["- Accra1", "- Accra2"],
    },
    {
      "name": 'Central',
      "info": ["- Central1", "- Central2"],
    },
  ];

  static List terms = [
    {
      "phrase": "charley",
      "meaning": "friend",
    },
    {
      "phrase": "Wossop",
      "meaning": "how are you ?",
    }
  ];
}
