import 'package:flutter/material.dart';
import 'package:tablet/contact.dart';
//import 'package:tablet/contactDetails.dart';

class ContactList extends StatelessWidget {
  final ValueChanged<Contact> itemSelectedCallback;

  ContactList({@required this.itemSelectedCallback});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: contacts.map(
        (contact) {
          return Container(
            child: ListTile(
              title: Text(
                contact.title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(contact.subtitle),
              ////we set a void selectedCallback to be able to called from another widget
              onTap: () => itemSelectedCallback(contact),
              ////below commented code is for a normal page navigation
              // onTap: () {
              //   print("ListTile ${contact.title} tapped");
              //   Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //           builder: (_) => ContactDetails(contact: contact)));
              // },
            ),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey)),
            ),
          );
        },
      ).toList(),
    );
  }
}
