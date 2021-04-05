import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker_flutter_course/common_widgets/platform_alert_dialog.dart';
import 'package:time_tracker_flutter_course/home/models/job.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';
import 'package:time_tracker_flutter_course/services/database.dart';

class JobsPage extends StatelessWidget {
  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _conformSignout(BuildContext context) async {
    final didRequestSignout = await PlatformAlertDialog(
      title: 'Logout',
      content: 'Are you sure you want to logout?',
      cancelActionText: 'Cancel',
      defaultActionText: 'Logout',
    ).show(context);
    if (didRequestSignout == true) {
      _signOut(context);
    }
  }

  Future<void> _createJob(BuildContext context) async {
    final database = Provider.of<Database>(context, listen: false);
    await database.createJob(
      Job(name: 'Blogging', ratePerHour: 10),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jobs Page'),
        actions: [
          FlatButton(
            child: Text(
              'Log out',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            onPressed: () => _conformSignout(context),
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('FAB Pressed');
          _createJob(context);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
    );
  }
}
