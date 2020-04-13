import 'package:flutter/material.dart';
import 'package:tablet/contact.dart';

class ContactDetails extends StatefulWidget {
  final Contact contact;

  ContactDetails({@required this.contact});

  @override
  _ContactDetailsState createState() => _ContactDetailsState();
}

class _ContactDetailsState extends State<ContactDetails> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    final Widget content = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.contact?.title ?? 'No contact selected!',
          style: textTheme.headline1,
          textAlign: TextAlign.center,
        ),
        Text(
          widget.contact?.subtitle ?? '',
          style: textTheme.subtitle1,
        ),
      ],
    );

    return Center(child: content);
  }
}
