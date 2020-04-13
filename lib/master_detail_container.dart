import 'package:flutter/material.dart';
import 'package:tablet/contact.dart';
import 'package:tablet/contactDetails.dart';
import 'package:tablet/contact_listing.dart';

class MasterDetailContainer extends StatefulWidget {
  
  @override
  _MasterDetailContainerState createState() =>
      _MasterDetailContainerState();
}

class _MasterDetailContainerState extends State<MasterDetailContainer> {
  // Track the currently selected item here. Only used for
  // tablet layouts.
  Contact _selectedItem;

  Widget _buildMobileLayout() {
    return ContactScreen(
      // Since we're on mobile, just push a new route for the
      // item details.
      itemSelectedCallback: (item) {
        Navigator.push(...);
      },
    );
  }

  Widget _buildTabletLayout() {
    // For tablets, return a layout that has item listing on the left
    // and item details on the right.
    return Row(
      children: <Widget>[
        Flexible(
          flex: 1, 
          child: ContactScreen(
            // Instead of pushing a new route here, we update
            // the currently selected item, which is a part of
            // our state now.
            itemSelectedCallback: (item) {
              setState(() {
                _selectedItem = item;
              });
            },
          ),
        ),
        Flexible(
          flex: 3,
          child: ContactDetails(
            // The item details just blindly accepts whichever
            // item we throw in its way, just like before.
           contact: _selectedItem,
          ),
        ),
      ],
    );
  }

  @override

  
  Widget build(BuildContext context) {    
  var shortestSide = MediaQuery.of(context).size.shortestSide;
  var useMobileLayout = shortestSide < 600;

    if (useMobileLayout) {
      return _buildMobileLayout();
    }

    return _buildTabletLayout();
  }
}