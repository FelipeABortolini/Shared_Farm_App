import 'package:flutter/material.dart';

class CardHome extends StatelessWidget {
  final IconData myIcon;
  final Color color;
  final String heading;
  final Color color1;

  const CardHome({
    super.key,
    required this.myIcon,
    required this.color,
    required this.heading,
    required this.color1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
    // Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
      height: 120,
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(16.0),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Color.fromARGB(190, 114, 116, 119),
                    Color(0xFF4F5D75)
                  ],
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(119, 100, 104, 86),
                    offset: Offset(1, 1),
                    blurRadius: 1,
                  ),
                ],
              ),
              width: 230,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.0),
                          // color: kcp1,
                        ),
                        child: Icon(
                          myIcon,
                          size: 50,
                          color: color1,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      heading,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: 'SF Pro Rounded',
                        fontSize: 20,
                        color: color1,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
