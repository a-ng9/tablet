import 'package:flutter/material.dart';
import 'package:tablet/contact.dart';
import 'package:tablet/contactDetails.dart';
import 'package:tablet/contact_listing.dart';

class MasterDetailContainer extends StatefulWidget {
  @override
  _MasterDetailContainerState createState() => _MasterDetailContainerState();
}

class _MasterDetailContainerState extends State<MasterDetailContainer> {
  Contact _selectedItem;

////Here we build 2 different widget layout: mobile and tablet
  Widget _buildMobileLayout() {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Mobile Mode"),
      ),
      body: Center(
        child: ContactList(
          itemSelectedCallback: (contact) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ContactDetails(
                          contact: contact,
                        )));
          },
        ),
      ),
    );
  }

  Widget _buildTabletLayout() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Tablet Mode'),
      ),
      body: Row(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: ContactList(
              itemSelectedCallback: (contact) {
                setState(() {
                  _selectedItem = contact;
                });
              },
            ),
          ),
          Container(
            color: Colors.cyan,
            width: 2,
          ),
          Flexible(
            flex: 3,
            child: ContactDetails(
              contact: _selectedItem,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ////regardless of the orientation, below code will always look for the shortest side of the device
    //var shortestSide = MediaQuery.of(context).size.shortestSide;
    // var useMobileLayout = shortestSide < 600;

    //////will look for the shortest width in relation to the orientation of the device
    var shortestSide = MediaQuery.of(context).size.width;

    //change 600 to 820 to test on Ipad and change orientation to see the different modes trigger
    if (shortestSide < 820) {
      return _buildMobileLayout();
    }

    return _buildTabletLayout();
  }
}
