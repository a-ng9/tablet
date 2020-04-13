import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class Contact {
  Contact({@required this.title, @required this.subtitle});

  final String title;
  final String subtitle;
}

final List<Contact> contacts = <Contact>[
  Contact(
    title: 'Bob',
    subtitle: 'This is the first Contact.',
  ),
  Contact(
    title: 'James',
    subtitle: 'This is the second Contact.',
  ),
  Contact(
    title: 'John',
    subtitle: 'This is the third Contact.',
  ),
];
