import 'dart:io';

import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';

Future<void> main() async {
  final botToken = Platform.environment[_botTokenKey]!;

  final username = (await Telegram(botToken).getMe()).username;
  var teledart = TeleDart(botToken, Event(username!));

  teledart.start();

  teledart.onCommand('answer').listen((event) {
    final chatId = event.chat.id;
    teledart.sendMessage(chatId, 'Hello, ${event.chat.username}!');
  });
}

const String _botTokenKey = 'bot_token';
