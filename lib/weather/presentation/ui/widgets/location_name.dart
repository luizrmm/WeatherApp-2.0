import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LocationName extends StatelessWidget {
  final String location;
  const LocationName(
    this.location, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0, bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            location,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).textTheme.headline1!.color,
            ),
          ),
          const SizedBox(
            width: 12.0,
          ),
          SvgPicture.asset(
            'assets/arrow.svg',
            height: 21,
            width: 21,
            color: Theme.of(context).iconTheme.color,
          )
        ],
      ),
    );
  }
}
