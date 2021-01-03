part of 'widgets.dart';

class PromoCard extends StatelessWidget {
  final Promo promo;

  PromoCard(this.promo);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          height: 80,
          decoration: BoxDecoration(
            color: mainColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    promo.title,
                    style: whiteTextStyle,
                  ),
                  Text(
                    promo.subtitle,
                    style: whiteTextStyle.copyWith(
                        fontSize: 11, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'OFF ',
                    style: yellowNumberStyle.copyWith(
                        fontSize: 10, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    '${promo.discount}%',
                    style: whiteNumberStyle.copyWith(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ],
              )
            ],
          ),
        ),
        ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [Colors.black.withOpacity(0.1), Colors.transparent])
                .createShader(
              Rect.fromLTRB(0, 0, 77.5, 80),
            );
          },
          blendMode: BlendMode.dstIn,
          child: SizedBox(
            width: 77.5,
            height: 81,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
              child: Image.asset('assets/reflection2.png'),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(
                  end: Alignment.centerRight,
                  begin: Alignment.centerLeft,
                  colors: [
                    Colors.black.withOpacity(0.1),
                    Colors.transparent
                  ]).createShader(
                Rect.fromLTRB(0, 0, 96, 45),
              );
            },
            blendMode: BlendMode.dstIn,
            child: SizedBox(
              width: 96,
              height: 37,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                ),
                child: Image.asset('assets/reflection1.png'),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(
                  end: Alignment.centerRight,
                  begin: Alignment.centerLeft,
                  colors: [
                    Colors.black.withOpacity(0.1),
                    Colors.transparent
                  ]).createShader(
                Rect.fromLTRB(0, 0, 59, 23),
              );
            },
            blendMode: BlendMode.dstIn,
            child: SizedBox(
              width: 59,
              height: 23,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                ),
                child: Image.asset('assets/reflection1.png'),
              ),
            ),
          ),
        )
      ],
    );
  }
}
