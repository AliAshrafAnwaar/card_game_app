import 'package:flutter/material.dart';
import 'package:flutter_rpg/model/character.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class StatsTable extends StatefulWidget {
  const StatsTable(this.character, {super.key});

  final Character character;

  @override
  State<StatsTable> createState() => _StatsTableState();
}

class _StatsTableState extends State<StatsTable> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // avialable points
          Container(
            color: AppColors.secondaryColor,
            padding: const EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.star,
                  //color
                  color: widget.character.points > 0
                      ? AppColors.highlightColor
                      : Colors.grey,
                ),
                const SizedBox(width: 20),
                const StyledText('Stat points available: '),
                const Expanded(child: SizedBox()),
                StyledHeadline(widget.character.points.toString())
              ],
            ),
          ),

          //actual stats table
          Table(
            children: widget.character.statsAsFormattedList.map(
              (stat) {
                return TableRow(
                  decoration: BoxDecoration(
                      color: AppColors.secondaryColor.withOpacity(0.5)),
                  children: [
                    // stat title
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: StyledHeadline(stat['title']!),
                      ),
                    ),

                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: StyledHeadline(stat['value']!),
                      ),
                    ),

                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            widget.character.increaseStat(stat['title']!);
                          });
                        },
                        icon: Icon(
                          Icons.arrow_upward,
                          color: AppColors.textColor,
                        ),
                      ),
                    ),

                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            widget.character.decreaseStat(stat['title']!);
                          });
                        },
                        icon: Icon(
                          Icons.arrow_downward,
                          color: AppColors.textColor,
                        ),
                      ),
                    )
                  ],
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}
