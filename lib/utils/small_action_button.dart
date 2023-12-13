 



import '../allpackages.dart';

class SmallActionButton extends StatelessWidget {
  final String text;

  final TextStyle? style;
  final Color? bgcolor;
  final double? radiusvalue;
  final Color bordercolor;
  final double? elevationvalue;
  final VoidCallback press;

  const SmallActionButton({
    Key? key,
    required this.text,
    this.bgcolor,
    required this.bordercolor,
    this.radiusvalue,
    this.elevationvalue,
    this.style,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: press,
        child: Container(
          height: 4.0.hp,
          width: 18.0.wp,
          decoration: BoxDecoration(
            
              color: bgcolor,
              border: Border.all(
                color: bordercolor,
              ),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(
              text,
              style: style,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
