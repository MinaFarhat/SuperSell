import 'package:flutter/material.dart';

class Range extends StatefulWidget {
  const Range({ Key? key }) : super(key: key);

  @override
  _RangeState createState() => _RangeState();
}

class _RangeState extends State<Range> {
RangeValues values = const RangeValues(0,100);
final double min=0;
final double max=100;
  @override
  Widget build(BuildContext context) => SliderTheme(
      data: SliderThemeData(
        trackHeight:10 ,
        rangeThumbShape: const RoundRangeSliderThumbShape(enabledThumbRadius: 15),
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 40),
        overlayColor:Colors.black12,
        thumbColor: Colors.black,
  
        activeTrackColor: Colors.blue,
        inactiveTrackColor: Colors.blue.shade200,
  
  
        activeTickMarkColor: Colors.transparent,
        inactiveTickMarkColor: Colors.transparent,
      ),
      child: Row(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         buildSideLabel(min),
           Expanded(
             child: RangeSlider(
             values: values,
             min: 0,
             max: 100,
             divisions:10 ,
             labels: RangeLabels(
               "${values.start.round().toString()}%",
               "${values.end.round().toString()}%",
             ),
             onChanged: (values)=>setState(() => this.values=values),
                 ),
           ),
           buildSideLabel(max),
       ],
      ),
  );
  Widget buildSideLabel(double value)
  {
    return SizedBox(
      width: 50,
      child: Text(
       value.round().toString(),
       style:const TextStyle(
         fontSize: 18,
         fontWeight: FontWeight.bold,
         color: Colors.blue
       ),
        textAlign:TextAlign.center,
      ),
    );
  }
}