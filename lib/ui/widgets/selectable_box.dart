part of 'widgets.dart';

class SelectableBox extends StatelessWidget {
  // Variable
  final bool isSelected;
  final bool isEnabled;
  final double width;
  final double height;
  final String text;
  final Function onTap;
  final TextStyle textStyle;

  // Constructor, text constructor is not an optional parameter
  SelectableBox(this.text,
      {this.isSelected = false,
      this.isEnabled = true,
      this.width = 144,
      this.height = 60,
      this.onTap,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (isEnabled == true) {
            onTap();
          }
        },
        child: Container());
  }
}
