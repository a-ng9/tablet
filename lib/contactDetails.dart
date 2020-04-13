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
    /////below code removes the appbar for the contact detail in TABLET modes
    var shortestSide = MediaQuery.of(context).size.width;

    /////change 600 to 820 to test on Ipad and change orientation to see the different modes trigger
    /////if you do change the number, dont forget to change in 'master_detail_container.dart'
    if (shortestSide < 600) {
      return Scaffold(
          appBar: AppBar(
            title: Text('Contact Details'),
          ),
          body: Center(child: content));
    } else
      return Center(child: content);
  }
}
