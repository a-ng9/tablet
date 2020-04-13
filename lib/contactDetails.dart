import 'package:flutter/material.dart';
import 'package:tablet/contact.dart';

class ContactDetails extends StatelessWidget {
  final Contact contact;

  ContactDetails({@required this.contact});
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    final Widget content = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          contact?.title ?? 'No contact selected!',
          style: textTheme.headline1,
        ),
        Text(
          contact?.subtitle ?? 'Please select on on the left',
          style: textTheme.subtitle1,
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Contact info'),
      ),
      body: Center(child: content),
    );
  }
}
