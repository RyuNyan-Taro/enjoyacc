import 'package:flutter/material.dart';

class ThreeDimensionView extends StatelessWidget {

  const ThreeDimensionView({
    Key? key,
    required this.valueKey,
    required this.valueX,
    required this.valueY,
    required this.valueZ
  }) : super(key: key);

  final String valueKey;
  final double valueX;
  final double valueY;
  final double valueZ;

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Text(
          valueKey,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: 12,
        ),
        SizedBox(
          height: 80,
          child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _AccelerationCard(
                  axis: "X",
                  value: valueX,
                ),
                _AccelerationCard(
                  axis: "Y",
                  value: valueY,
                ),
                _AccelerationCard(
                  axis: "Z",
                  value: valueZ,
                ),
              ]
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

class _AccelerationCard extends StatelessWidget {

  const _AccelerationCard({
    Key? key,
    required this.axis,
    required this.value,
  }) : super(key: key);

  final String axis;
  final double value;

  static const double width = 100;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Card(
        child: Row(
          children: [
            Text(
              axis,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const Text(
              ": ",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                value.toStringAsFixed(3),
                style: const TextStyle(
                  fontSize: 40
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}