// import 'package:aichatapplication/consts.dart';
// import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
// import 'package:dash_chat_2/dash_chat_2.dart';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter App',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const ChatPage(),
//     );
//   }
// }
//
// class ChatPage extends StatefulWidget {
//   const ChatPage({Key? key}) : super(key: key);
//
//   @override
//   State<ChatPage> createState() => _ChatPageState();
// }
//
// class _ChatPageState extends State<ChatPage> {
//   final _openAI = OpenAI.instance.build(
//     token: OPENAI_API_KEY,
//     baseOption: HttpSetup(
//       receiveTimeout: const Duration(seconds: 5),
//     ),
//     enableLog: true,
//   );
//
//   final ChatUser _currentUser =
//   ChatUser(id: '1', firstName: 'Anup', lastName: 'Tarone');
//   final ChatUser _gptChatUser = ChatUser(id: '2', firstName: 'Chat', lastName: 'GPT');
//
//   List<ChatMessage> _messages = <ChatMessage>[];
//   List<ChatUser> _typingUsers = <ChatUser>[];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromRGBO(115,93,165,1.0),
//         title: const Text(
//           'AI Minimal',
//           style: TextStyle(
//             color: Colors.white,
//           ),
//         ),
//       ),
//       body: DashChat(
//         currentUser: _currentUser,
//         typingUsers: _typingUsers,
//         messageOptions: const MessageOptions(
//           currentUserContainerColor: Colors.black,
//           containerColor: Color.fromRGBO(115,93,165,1.0),
//           textColor: Colors.white,
//         ),
//         onSend: (ChatMessage m) {
//           getChatResponse(m);
//         },
//         messages: _messages,
//       ),
//     );
//   }
//
//   Future<void> getChatResponse(ChatMessage m) async {
//     setState(() {
//       _messages.insert(0, m);
//       _typingUsers.add(_gptChatUser);
//     });
//
//     List<Map<String, dynamic>> _messagesHistory = _messages.reversed.map((m) {
//       if (m.user == _currentUser) {
//         return {'role': 'user', 'content': m.text};
//       } else {
//         return {'role': 'assistant', 'content': m.text};
//       }
//     }).toList();
//
//     final request = ChatCompleteText(
//       model: GptTurbo0301ChatModel(),
//       messages: _messagesHistory,
//       maxToken: 150,
//     );
//
//     final response = await _openAI.onChatCompletion(request: request);
//
//     for (var element in response!.choices) {
//       if (element.message != null) {
//         setState(() {
//           _messages.insert(
//             0,
//             ChatMessage(
//               user: _gptChatUser,
//               createdAt: DateTime.now(),
//               text: element.message!.content,
//             ),
//           );
//         });
//       }
//     }
//
//     setState(() {
//       _typingUsers.remove(_gptChatUser);
//     });
//   }
// }
