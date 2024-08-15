import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_social_media_app/features/users_signup/data/repositories/users_signup_repo.dart';
import 'package:gdsc_social_media_app/features/users_signup/view_models/users_signup_view_model.dart';
import 'package:gdsc_social_media_app/firebase_options.dart';
import 'package:gdsc_social_media_app/providers/message_provider.dart';
import 'package:gdsc_social_media_app/screens/add%20post%20screen/add_post_screen.dart';
import 'package:gdsc_social_media_app/screens/chat%20screen/chat_page.dart';
import 'package:gdsc_social_media_app/screens/login%20screen/login_page.dart';
import 'package:gdsc_social_media_app/screens/messages%20screen/messages_people_list_page.dart';
import 'package:gdsc_social_media_app/screens/post%20screen/opened_posted_screen.dart';
import 'package:provider/provider.dart';

import 'core/constants/colors.dart';
import 'core/utils/save_login.dart';
import 'features/users_signup/views/signup_page.dart';
import 'screens/home screen/home_page.dart';
import 'screens/profile screen/profile_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => MessageProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => UsersSignupViewModel(UsersSignupRepo()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: ColorApp.secondMainApp,
        ),
        routes: {
          '/Login': (context) => const LoginPage(),
          '/Homepage': (context) => const HomePage(),
          '/Signup': (context) => const SignupPage(),
          '/Messages': (context) => const MessagesPage(),
          '/Chat': (context) => const ChatPage(),
          '/Post': (context) => const OpenedPost(),
          '/Profile': (context) => const ProfilePage(),
          '/Addpost': (context) => const AddPost(),
        },
        home: const SaveLogin(),
      ),
    );
  }
}
