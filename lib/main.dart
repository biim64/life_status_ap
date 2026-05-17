import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(const LifeStatusApp());
}

class LifeStatusApp extends StatelessWidget {
  const LifeStatusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Life Status',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF070B14),
        fontFamily: 'SF Pro Display',
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF00E5FF),
          secondary: Color(0xFF7C4DFF),
        ),
      ),
      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int currentIndex = 0;

  final pages = const [
    HomeScreen(),
    InputScreen(),
    GraphScreen(),
    HistoryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: const Color(0xFF0D1320),
        selectedItemColor: const Color(0xFF00E5FF),
        unselectedItemColor: Colors.white54,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'INPUT',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            label: 'GRAPH',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'HISTORY',
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'LIFE STATUS',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                Icon(Icons.notifications_active_outlined),
              ],
            ),
            const SizedBox(height: 30),
            Center(
              child: Container(
                width: 260,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF121B2D),
                      Color(0xFF18253F),
                    ],
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x3300E5FF),
                      blurRadius: 25,
                      spreadRadius: 2,
                    )
                  ],
                  border: Border.all(
                    color: const Color(0xFF00E5FF).withOpacity(0.3),
                  ),
                ),
                child: Column(
                  children: [
                    const Text(
                      'TODAY SCORE',
                      style: TextStyle(
                        color: Colors.white70,
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      '46',
                      style: TextStyle(
                        fontSize: 72,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF00E5FF),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.auto_awesome,
                            color: Colors.amberAccent),
                        SizedBox(width: 8),
                        Text(
                          'LEVEL 12',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: LinearProgressIndicator(
                        minHeight: 12,
                        value: 0.68,
                        backgroundColor: Colors.white12,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text('EXP 680 / 1000'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: const [
                  StatusCard(
                    title: 'HEALTH',
                    value: '8',
                    color: Color(0xFF00E676),
                    icon: Icons.favorite,
                  ),
                  StatusCard(
                    title: 'MIND',
                    value: '6',
                    color: Color(0xFFAA00FF),
                    icon: Icons.psychology,
                  ),
                  StatusCard(
                    title: 'INTELLIGENCE',
                    value: '20',
                    color: Color(0xFF2979FF),
                    icon: Icons.school,
                  ),
                  StatusCard(
                    title: 'PRODUCTIVITY',
                    value: '12',
                    color: Color(0xFFFF9100),
                    icon: Icons.bolt,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFF121B2D),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                children: [
                  Icon(Icons.tips_and_updates,
                      color: Color(0xFF00E5FF)),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      '知性ステータスが上昇しています',
                      style: TextStyle(fontSize: 15),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class StatusCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  final IconData icon;

  const StatusCard({
    super.key,
    required this.title,
    required this.value,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: const Color(0xFF111827),
        border: Border.all(color: color.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.15),
            blurRadius: 16,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 32),
          const Spacer(),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  bool trained = false;
  bool challenged = false;
  bool helped = false;
  bool talked = true;

  double studyHours = 1;
  double thinkingMinutes = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DAILY INPUT'),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSectionTitle('HEALTH'),
            buildToggleTile(
              title: 'トレーニングした',
              value: trained,
              onChanged: (v) => setState(() => trained = v),
            ),
            const SizedBox(height: 24),
            buildSectionTitle('INTELLIGENCE'),
            const Text('学習時間'),
            Slider(
              value: studyHours,
              min: 0,
              max: 10,
              divisions: 10,
              label: '${studyHours.toInt()}h',
              onChanged: (v) {
                setState(() {
                  studyHours = v;
                });
              },
            ),
            Text('${studyHours.toInt()}時間'),
            const SizedBox(height: 24),
            const Text('思考時間'),
            Slider(
              value: thinkingMinutes,
              min: 0,
              max: 180,
              divisions: 6,
              label: '${thinkingMinutes.toInt()}m',
              onChanged: (v) {
                setState(() {
                  thinkingMinutes = v;
                });
              },
            ),
            Text('${thinkingMinutes.toInt()}分'),
            const SizedBox(height: 24),
            buildSectionTitle('PRODUCTIVITY'),
            buildToggleTile(
              title: '新しいことに挑戦した',
              value: challenged,
              onChanged: (v) => setState(() => challenged = v),
            ),
            buildToggleTile(
              title: '人を手伝った',
              value: helped,
              onChanged: (v) => setState(() => helped = v),
            ),
            buildToggleTile(
              title: '人と話した',
              value: talked,
              onChanged: (v) => setState(() => talked = v),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00E5FF),
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => const LevelUpDialog(),
                  );
                },
                child: const Text(
                  'COMPLETE DAILY STATUS',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Color(0xFF00E5FF),
        ),
      ),
    );
  }

  Widget buildToggleTile({
    required String title,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF111827),
        borderRadius: BorderRadius.circular(18),
      ),
      child: SwitchListTile(
        title: Text(title),
        value: value,
        activeColor: const Color(0xFF00E5FF),
        onChanged: onChanged,
      ),
    );
  }
}

class LevelUpDialog extends StatelessWidget {
  const LevelUpDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFF101827),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              Icons.auto_awesome,
              color: Colors.amberAccent,
              size: 70,
            ),
            SizedBox(height: 20),
            Text(
              'LEVEL UP',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00E5FF),
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Lv.12 → Lv.13',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20),
            Text(
              '+46 EXP',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'NEW TITLE UNLOCKED',
              style: TextStyle(
                color: Colors.amberAccent,
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(height: 12),
            Text(
              '習慣形成者',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class GraphScreen extends StatelessWidget {
  const GraphScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('STATUS GRAPH'),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 280,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF111827),
                borderRadius: BorderRadius.circular(24),
              ),
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  titlesData: const FlTitlesData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      isCurved: true,
                      spots: const [
                        FlSpot(0, 20),
                        FlSpot(1, 35),
                        FlSpot(2, 28),
                        FlSpot(3, 46),
                        FlSpot(4, 52),
                        FlSpot(5, 48),
                      ],
                      color: const Color(0xFF00E5FF),
                      barWidth: 4,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF111827),
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ANALYSIS',
                    style: TextStyle(
                      color: Color(0xFF00E5FF),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 14),
                  Text('・知性ステータスが継続上昇'),
                  SizedBox(height: 8),
                  Text('・睡眠不足に注意'),
                  SizedBox(height: 8),
                  Text('・7日連続記録達成'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final history = [
      {'date': '2026/05/17', 'score': 46},
      {'date': '2026/05/16', 'score': 38},
      {'date': '2026/05/15', 'score': 51},
      {'date': '2026/05/14', 'score': 42},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('HISTORY'),
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: history.length,
        itemBuilder: (context, index) {
          final item = history[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFF111827),
              borderRadius: BorderRadius.circular(22),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item['date'].toString(),
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  'SCORE ${item['score']}',
                  style: const TextStyle(
                    color: Color(0xFF00E5FF),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
