import 'package:flutter/material.dart';

class ChipBar extends StatefulWidget {
  final List<String> chipTitles;

  ChipBar({@required this.chipTitles});

  @override
  _ChipBarState createState() => _ChipBarState();
}

class _ChipBarState extends State<ChipBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(10.0),
      child: Container(
        color: Colors.grey.shade100,
        height: 40.0,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: widget.chipTitles.length,
          separatorBuilder: (context, index) => SizedBox(
            width: 10.0,
          ),
          itemBuilder: (context, index) {
            return ChoiceChip(
              selected: _selectedIndex == index,
              selectedColor: Colors.grey.shade600,
              label: Text('${widget.chipTitles[index]}'),
              onSelected: (selected) {
                if (selected) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }
              },
            );
          },
        ),
      ),
    );
  }
}
