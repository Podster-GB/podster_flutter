import 'package:flutter/material.dart';
import 'package:podster_flutter/playlist.dart';

class ChipBar extends StatefulWidget {
  final List<Playlist> chips;
  final Function onChipSelect;

  ChipBar({@required this.chips, @required this.onChipSelect});

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
        color: Colors.white,
        height: 40.0,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: widget.chips.length,
          separatorBuilder: (context, index) => SizedBox(
            width: 10.0,
          ),
          itemBuilder: (context, index) {
            return ChipTheme(
              data: ChipTheme.of(context).copyWith(
                backgroundColor: Colors.grey.shade200,
              ),
              child: ChoiceChip(
                selected: _selectedIndex == index,
                selectedColor: Colors.grey.shade800,
                label: Text(
                  '${widget.chips[index].name}',
                ),
                onSelected: (selected) {
                  if (selected) {
                    setState(() {
                      _selectedIndex = index;
                      widget.onChipSelect(widget.chips[index]);
                    });
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
