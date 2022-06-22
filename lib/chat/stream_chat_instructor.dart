import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:svu_beta/instructor/UpdInstructor_menu.dart';
import 'package:svu_beta/upd_student_menu.dart';

class chatApp extends StatelessWidget {
  chatApp({
    Key? key,
    required this.client,
    required this.channel,
    required this.currentUser,
  }) : super(key: key);

  final StreamChatClient client;
  final Channel channel;
  final apiKey = "4hw3tn7rpac3";
  final userToken =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiTWFoeXRhYiJ9.tyujpcV9v9FjLpaPd-Ajs32IUaM2JWpHgPNoUvgbcE0";
  var currentUser;

  /// To initialize this example, an instance of [client] and [channel] is required.

  void chat_main() async {
    final client = StreamChatClient(
      apiKey,
      logLevel: Level.ALL,
    );

    await client.connectUser(
      User(
          id: 'Mahytab',
          extraData: {
            'image': 'https://robertbrunhage.com/logo.png',
          },
          name: 'Mahytab'),
      userToken,
    );

    final channel = client.channel(
      'messaging',
      id: 'mehoz',
      extraData: {
        "name": "Meho'Z",
        "image": "https://robertbrunhage.com/logo.png",
      },
    );

    await channel.watch();

    runApp(
      chatApp(
        client: client,
        channel: channel,
        currentUser: currentUser,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    chat_main();
    final theme = ThemeData.dark().copyWith(
        primaryColor: Color(0xffc34c4c), scaffoldBackgroundColor: Colors.green);
    return MaterialApp(
      builder: (context, widget) {
        return StreamChat(
          client: client,
          child: widget,
        );
      },
      home: StreamChannel(
        channel: channel,
        child: ChannelListPage(),
      ),
    );
  }
}

/// Displays the list of messages inside the channel
class ChannelPage extends StatelessWidget {
  const ChannelPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StreamChannelHeader(
          //onBackPressed:
          ),
      body: Column(
        children: const <Widget>[
          Expanded(
            child: StreamMessageListView(),
          ),
          StreamMessageInput(),
        ],
      ),
    );
  }
}

class ChannelListPage extends StatefulWidget {
  var currentUser;

  ChannelListPage({Key? key, this.currentUser}) : super(key: key);

  @override
  State<ChannelListPage> createState() =>
      _ChannelListPageState(this.currentUser);
}

class _ChannelListPageState extends State<ChannelListPage> {
  var currentUser;

  _ChannelListPageState(this.currentUser);
  late final _listController = StreamChannelListController(
    client: StreamChat.of(context).client,
    filter: Filter.in_(
      'members',
      [StreamChat.of(context).currentUser!.id],
    ),
    sort: const [SortOption('last_message_at')],
    limit: 20,
  );

  @override
  void dispose() {
    _listController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => UpdInstructor_menu(currentUser)));
          },
        ),
        backgroundColor: Colors.white70,
        title: Text('Virtual University Chat',
            style: TextStyle(
                color: Colors.black87,
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w600)),
      ),
      backgroundColor: Colors.white,
      body: StreamChannelListView(
        controller: _listController,
        itemBuilder: _channelTileBuilder,
        onChannelTap: (channel) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return StreamChannel(
                  channel: channel,
                  child: const ChannelPage(),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _channelTileBuilder(BuildContext context, List<Channel> channels,
      int index, StreamChannelListTile defaultChannelTile) {
    final channel = channels[index];
    final lastMessage = channel.state?.messages.reversed.firstWhere(
      (message) => !message.isDeleted,
    );

    final subtitle = lastMessage == null ? 'nothing yet' : lastMessage.text!;
    final opacity = (channel.state?.unreadCount ?? 0) > 0 ? 1.0 : 0.5;

    final theme = StreamChatTheme.of(context);

    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => StreamChannel(
              channel: channel,
              child: const ChannelPage(),
            ),
          ),
        );
      },
      leading: StreamChannelAvatar(
        channel: channel,
      ),
      title: StreamChannelName(
        channel: channel,
        textStyle: theme.channelPreviewTheme.titleStyle!.copyWith(
          color: theme.colorTheme.textHighEmphasis.withOpacity(opacity),
        ),
      ),
      subtitle: Text(subtitle),
      trailing: channel.state!.unreadCount > 0
          ? CircleAvatar(
              radius: 10,
              child: Text(channel.state!.unreadCount.toString()),
            )
          : const SizedBox(),
    );
  }
}
