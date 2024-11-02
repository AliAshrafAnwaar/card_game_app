import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String truncateToWords(String text, int? num) {
  List<String> words = text.split(' ');
  if (num != null && words.length > num) {
    return words.take(num).join(' ').trim();
  }
  return text;
}

class StyledText extends StatelessWidget {
  const StyledText(this.text, {this.num, super.key});
  final String text;
  final int? num;
  @override
  Widget build(BuildContext context) {
    return Text(
      truncateToWords(text, num),
      style:
          GoogleFonts.kanit(textStyle: Theme.of(context).textTheme.bodyMedium),
    );
  }
}

class StyledHeadline extends StatelessWidget {
  const StyledHeadline(this.text, {this.num, super.key});
  final String text;
  final int? num;
  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: 1,
      overflow: TextOverflow.clip,
      truncateToWords(text, num).toUpperCase(),
      style: GoogleFonts.kanit(
          textStyle: Theme.of(context).textTheme.headlineMedium),
    );
  }
}

class StyledTitle extends StatelessWidget {
  const StyledTitle(this.text, {this.num, super.key});
  final String text;
  final int? num;
  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: TextOverflow.clip,
      truncateToWords(text, num).toUpperCase(),
      style:
          GoogleFonts.kanit(textStyle: Theme.of(context).textTheme.titleMedium),
    );
  }
}
