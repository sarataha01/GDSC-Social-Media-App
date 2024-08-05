import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_social_media_app/screens/shared%20components/back_button.dart';
import 'package:gdsc_social_media_app/screens/shared%20widgets/circular_button.dart';
import 'package:gdsc_social_media_app/screens/shared%20widgets/custom_input_field.dart';
import 'package:gdsc_social_media_app/services/message_services.dart';
import 'package:gdsc_social_media_app/util/get_chat_id.dart';

import '../../models/message_model.dart';
import '../../models/user_model.dart';
import '../../util/validators.dart';
import '../shared widgets/custom_app_bar.dart';
import 'components/chat_messages.dart';
import 'components/user_chat_info.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController textCTRL = TextEditingController();
  final User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final UserModel receiver =
        ModalRoute.of(context)!.settings.arguments as UserModel;
    final String chatId = ChatId.getChatId(currentUser!.uid, receiver.uid!);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          MyAppBar(
            leading: const CustomBackButton(),
            widget: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 27.0),
              child: UserChatInfo(user: receiver),
            ),
          ),
          ChatMessages(
              messageServices: MessageServices(),
              chatId: chatId,
              currentUser: currentUser),
          const SizedBox(height: 10),
          InputField(
            controller: textCTRL,
            hintText: 'Message @${receiver.username}',
            validator: (String? input) =>
                Validators.checkLengthValidator(input, 1),
            suffix: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularButton(
                icon: const Icon(Icons.send_rounded),
                onPressed: () {
                  saveMessageAndSend(receiver, chatId);
                },
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  void saveMessageAndSend(UserModel receiver, String chatId) {
    if (textCTRL.text.trim().isNotEmpty) {
      final message = MessageModel(
        senderId: currentUser!.uid,
        receiverId: receiver.uid!,
        message: textCTRL.text,
        timestamp: DateTime.now(),
      );
      MessageServices.sendMessage(chatId, message);
      textCTRL.clear();
    }
  }
}
