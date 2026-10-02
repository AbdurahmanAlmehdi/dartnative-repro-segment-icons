import 'package:dartnative/dartnative.dart';

import 'dartnative_plugin_registrant.dart';

void main() {
  DartNativePluginRegistrant.registerAll();
  runApp(const SegmentIconsRepro());
}

class SegmentIconsRepro extends StatefulWidget {
  const SegmentIconsRepro({super.key});

  @override
  State<SegmentIconsRepro> createState() => _SegmentIconsReproState();
}

class _SegmentIconsReproState extends State<SegmentIconsRepro> {
  int _index = 0;

  static const _labels = ['Expenses', 'Maintenance', 'Debts'];
  static const _icons = [Icons.receipt_long, Icons.build, Icons.handshake];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      brightness: Brightness.light,
      appBar: AppBar(title: const Text('Segment icons')),
      backgroundColor: const Color(0xFFFFFFFF),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('SegmentedControl segments are text only',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: 6),
            const Text(
              'Expected (Flutter): SegmentedButton(segments: [ButtonSegment(icon: ..., label: ...)]) '
              'draws an icon next to each label.',
              style: TextStyle(fontSize: 13),
            ),
            const SizedBox(height: 4),
            const Text(
              'Actual: SegmentedControl(segments: List<String>) takes only titles, '
              'so the icons are dropped:',
              style: TextStyle(fontSize: 13, color: Color(0xFFC62828)),
            ),
            const SizedBox(height: 16),
            SegmentedControl(
              segments: _labels,
              selectedIndex: _index,
              onValueChanged: (i) => setState(() => _index = i),
            ),
            const SizedBox(height: 24),
            const Text('Intended segments (icon + label), drawn here with Row/Icon/Text:',
                style: TextStyle(fontSize: 13, color: Color(0xFF616161))),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (var i = 0; i < _labels.length; i++)
                  Row(
                    children: [
                      Icon(_icons[i], size: 18, color: const Color(0xFF424242)),
                      const SizedBox(width: 4),
                      Text(_labels[i], style: const TextStyle(fontSize: 13)),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
