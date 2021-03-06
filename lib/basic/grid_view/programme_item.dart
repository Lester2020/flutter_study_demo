import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_demo/basic/grid_view/programme_model.dart';

class ProgrammeItem extends StatelessWidget {

  final ProgrammeViewModel model;
  const ProgrammeItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double coverSize = 110;
    return Column(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Stack(
              fit: StackFit.passthrough,
              children: [
                Image.network(
                  model.coverImgUrl,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  height: coverSize / 2,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Color.fromARGB(200, 0, 0, 0),
                        ]
                      )
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 13,
                        ),
                        const Padding(padding: EdgeInsets.only(left: 5)),
                        Text(
                          Helper.numFormat(model.playsCount),
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                !model.needVip
                    ? const SizedBox()
                    : Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(5, 2, 10, 2),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4),
                        bottomRight: Radius.circular(20),
                      ),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFA17551),
                          Color(0xFFCCBEB5),
                        ]
                      )
                    ),
                    child: const Text(
                      'VIP',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        const Padding(padding: EdgeInsets.only(top: 5)),
        SizedBox(
          height: 40,
          child: Text(
            model.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Color(0xff333333),
            ),
          ),
        )
      ],
    );
  }
}

class Helper {
  static String numFormat(int num) {
    if (num / 10000 < 1) {
      return 'num';
    } else if (num / 100000000 < 1) {
      return '${num ~/ 10000}???';
    } else {
      return '${num ~/ 100000000}???';
    }
  }
}