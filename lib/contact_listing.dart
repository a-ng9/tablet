import 'package:flutter/material.dart';
import 'package:tablet/contact.dart';
import 'package:tablet/contactDetails.dart';

class ContactScreen extends StatelessWidget {
  final ValueChanged<Contact> itemSelectedCallback;

  ContactScreen({@required this.itemSelectedCallback});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adaptive List"),
      ),
      body: ListView(
        children: contacts.map(
          (contact) {
            return ListTile(
              title: Text(
                contact.title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(contact.subtitle),
              onTap: () => itemSelectedCallback(contact),
              // onTap: () {
              //   print("ListTile ${contact.title} tapped");
              //   Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //           builder: (_) => ContactDetails(contact: contact)));
              // },
            );
          },
        ).toList(),
      ),
    );
  }
}
