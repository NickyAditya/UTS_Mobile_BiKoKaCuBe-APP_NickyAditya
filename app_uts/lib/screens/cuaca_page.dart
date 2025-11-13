import 'package:flutter/material.dart';

class CuacaPage extends StatefulWidget {
  const CuacaPage({super.key});

  @override
  State<CuacaPage> createState() => _CuacaPageState();
}

class _CuacaPageState extends State<CuacaPage>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  // Data cuaca hari ini
  final String kondisiHariIni = "Cerah";
  final int suhuHariIni = 30;
  final int kelembapanHariIni = 65;
  final int kecepatanAngin = 12;
  final String lokasiHariIni = "Jakarta, Indonesia";

  // Data cuaca seminggu
  final List<Map<String, dynamic>> cuacaMingguIni = [
    {
      "hari": "Senin",
      "tanggal": "4 Nov",
      "kondisi": "Cerah",
      "suhu_max": 32,
      "suhu_min": 24,
      "kelembapan": 68,
      "icon": Icons.wb_sunny,
      "color": Colors.orange
    },
    {
      "hari": "Selasa",
      "tanggal": "5 Nov",
      "kondisi": "Berawan",
      "suhu_max": 29,
      "suhu_min": 22,
      "kelembapan": 75,
      "icon": Icons.cloud,
      "color": Colors.grey
    },
    {
      "hari": "Rabu",
      "tanggal": "6 Nov",
      "kondisi": "Hujan Ringan",
      "suhu_max": 26,
      "suhu_min": 20,
      "kelembapan": 85,
      "icon": Icons.grain,
      "color": Colors.blue
    },
    {
      "hari": "Kamis",
      "tanggal": "7 Nov",
      "kondisi": "Hujan Lebat",
      "suhu_max": 24,
      "suhu_min": 19,
      "kelembapan": 90,
      "icon": Icons.thunderstorm,
      "color": Colors.blueGrey
    },
    {
      "hari": "Jumat",
      "tanggal": "8 Nov",
      "kondisi": "Berawan",
      "suhu_max": 28,
      "suhu_min": 21,
      "kelembapan": 72,
      "icon": Icons.cloud,
      "color": Colors.grey
    },
    {
      "hari": "Sabtu",
      "tanggal": "9 Nov",
      "kondisi": "Cerah",
      "suhu_max": 31,
      "suhu_min": 23,
      "kelembapan": 60,
      "icon": Icons.wb_sunny,
      "color": Colors.orange
    },
    {
      "hari": "Minggu",
      "tanggal": "10 Nov",
      "kondisi": "Cerah Berawan",
      "suhu_max": 30,
      "suhu_min": 22,
      "kelembapan": 65,
      "icon": Icons.wb_cloudy,
      "color": Colors.amber
    },
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 1200),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  IconData getCuacaIcon(String kondisi) {
    switch (kondisi) {
      case "Cerah":
        return Icons.wb_sunny;
      case "Berawan":
        return Icons.cloud;
      case "Hujan Ringan":
        return Icons.grain;
      case "Hujan Lebat":
        return Icons.thunderstorm;
      case "Cerah Berawan":
        return Icons.wb_cloudy;
      default:
        return Icons.wb_cloudy;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF2196F3),
              Color(0xFF64B5F6),
              Color(0xFF90CAF9),
            ],
          ),
        ),
        child: SafeArea(
          child: SlideTransition(
            position: _slideAnimation,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Column(
                children: [
                  // Header
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Informasi Cuaca",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  // Cuaca hari ini - Card utama
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.white, Colors.white.withValues(alpha: 0.9)],
                      ),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.2),
                          blurRadius: 20,
                          spreadRadius: 2,
                          offset: Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.location_on, color: Color(0xFF1976D2), size: 16),
                            SizedBox(width: 4),
                            Text(
                              lokasiHariIni,
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.orange.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Icon(
                                getCuacaIcon(kondisiHariIni),
                                size: 60,
                                color: Colors.orange,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "$suhuHariIni°C",
                                  style: TextStyle(
                                    fontSize: 48,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF1976D2),
                                  ),
                                ),
                                Text(
                                  kondisiHariIni,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildInfoItem(Icons.water_drop, "Kelembapan", "$kelembapanHariIni%"),
                            _buildInfoItem(Icons.air, "Angin", "$kecepatanAngin km/h"),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),

                  // Label untuk prakiraan mingguan
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Prakiraan 7 Hari",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 12),

                  // List cuaca mingguan
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      itemCount: cuacaMingguIni.length,
                      itemBuilder: (context, index) {
                        final cuaca = cuacaMingguIni[index];
                        return TweenAnimationBuilder(
                          duration: Duration(milliseconds: 600),
                          tween: Tween<double>(begin: 0, end: 1),
                          builder: (context, double value, _) {
                            return Transform.translate(
                              offset: Offset(30 * (1 - value), 0),
                              child: Opacity(
                                opacity: value,
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 8),
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.15),
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: Colors.white.withValues(alpha: 0.2),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: (cuaca["color"] as Color).withValues(alpha: 0.2),
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: Icon(
                                          cuaca["icon"],
                                          color: cuaca["color"],
                                          size: 24,
                                        ),
                                      ),
                                      SizedBox(width: 16),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              cuaca["hari"],
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              cuaca["tanggal"],
                                              style: TextStyle(
                                                color: Colors.white70,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            "${cuaca["suhu_max"]}°/${cuaca["suhu_min"]}°",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                          Text(
                                            "${cuaca["kelembapan"]}%",
                                            style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String label, String value) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Color(0xFF1976D2).withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Color(0xFF1976D2), size: 20),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 12,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF1976D2),
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
