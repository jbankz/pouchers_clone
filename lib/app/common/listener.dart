import 'package:flutter/material.dart';
import 'package:Pouchers/app/helpers/network_helpers.dart';
import 'package:Pouchers/modules/login/screens/login.dart';

class ListenerPage extends StatefulWidget {
  final Widget child;
  const ListenerPage({Key? key, required this.child}) : super(key: key);

  @override
  State<ListenerPage> createState() => _ListenerPageState();
}

class _ListenerPageState extends State<ListenerPage> {
  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (e) {
        DateTime whenTouchedDatetime = DateTime.now();
        if (nowDate.isBefore(whenTouchedDatetime)) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (_) {
            return LogInAccount(sessionTimeOut: true);
          }), (route) => false);

          setState(() {
            nowDate = DateTime.now().add(Duration(minutes: 5));
          });
        } else {
          nowDate = DateTime.now().add(Duration(minutes: 5));
        }
      },
      child: widget.child,
    );
  }
}
