import 'package:flutter/material.dart';

class BeritaPage extends StatefulWidget {
  const BeritaPage({super.key});

  @override
  State<BeritaPage> createState() => _BeritaPageState();
}

class _BeritaPageState extends State<BeritaPage>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  final List<Map<String, String>> beritaList = [
    {
      "judul": "Flutter 4.0 Resmi Dirilis!",
      "gambar": "assets/news1.jpg",
      "deskripsi": "Google merilis Flutter 4.0 dengan fitur-fitur baru yang menakjubkan untuk pengembangan aplikasi mobile.",
      "deskripsi_lengkap": "Flutter 4.0 membawa revolusi baru dalam pengembangan aplikasi mobile dengan performa yang lebih cepat, fitur hot reload yang ditingkatkan, dan dukungan platform yang lebih luas. Update ini mencakup peningkatan signifikan pada rendering engine, optimasi memori, dan tools debugging yang lebih canggih. Para developer kini dapat membangun aplikasi dengan lebih efisien dan menghasilkan performa yang mendekati native application.",
      "waktu": "2 jam yang lalu",
      "kategori": "Teknologi"
    },
    {
      "judul": "Peningkatan Performa di Android Studio",
      "gambar": "assets/androidstudio.jpg",
      "deskripsi": "Android Studio terbaru menghadirkan peningkatan performa yang signifikan untuk developer.",
      "deskripsi_lengkap": "Android Studio versi terbaru hadir dengan peningkatan performa hingga 40% lebih cepat dalam proses kompilasi dan build. Fitur baru termasuk intelligent code completion, debugging tools yang lebih powerful, dan integrasi yang lebih seamless dengan Firebase. Memory usage juga dioptimalkan untuk memberikan pengalaman coding yang lebih smooth bahkan untuk project besar.",
      "waktu": "5 jam yang lalu",
      "kategori": "Tools"
    },
    {
      "judul": "AI dan Machine Learning Tren Tahun Ini",
      "gambar": "assets/machinelearning.jpg",
      "deskripsi": "Teknologi AI dan ML semakin berkembang pesat dan menjadi tren utama di industri tech.",
      "deskripsi_lengkap": "Industri teknologi mengalami transformasi besar dengan adopsi AI dan Machine Learning yang semakin masif. Dari chatbot cerdas hingga autonomous vehicle, AI telah mengubah cara kita berinteraksi dengan teknologi. Perusahaan besar seperti Google, Microsoft, dan OpenAI berlomba mengembangkan model AI yang lebih canggih dengan kemampuan reasoning dan creativity yang menakjubkan.",
      "waktu": "1 hari yang lalu",
      "kategori": "AI/ML"
    },
    {
      "judul": "Update Keamanan Flutter Terbaru",
      "gambar": "assets/flutterlock.jpg",
      "deskripsi": "Tim Flutter merilis update keamanan penting untuk melindungi aplikasi dari vulnerability.",
      "deskripsi_lengkap": "Update keamanan Flutter terbaru mengatasi beberapa vulnerability kritis yang dapat dieksploitasi oleh pihak yang tidak bertanggung jawab. Patch ini mencakup perbaikan pada sistem enkripsi, validasi input yang lebih ketat, dan proteksi terhadap injection attack. Semua developer Flutter sangat disarankan untuk segera melakukan update ke versi terbaru.",
      "waktu": "2 hari yang lalu",
      "kategori": "Security"
    },
    {
      "judul": "Dart 3.0 Fitur Baru yang Revolusioner",
      "gambar": "assets/dart.jpg",
      "deskripsi": "Dart 3.0 menghadirkan fitur-fitur baru yang akan mengubah cara developer menulis kode.",
      "deskripsi_lengkap": "Dart 3.0 memperkenalkan pattern matching, records, dan null safety yang lebih robust. Fitur pattern matching memungkinkan developer menulis kode yang lebih ekspresif dan mudah dibaca. Records memberikan cara baru untuk mengelola data dengan type safety yang lebih baik. Performance improvement juga menjadi fokus utama dengan optimasi compiler yang menghasilkan kode yang lebih efisien.",
      "waktu": "3 hari yang lalu",
      "kategori": "Language"
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

  Color getCategoryColor(String kategori) {
    switch (kategori) {
      case "Teknologi":
        return Colors.blue;
      case "Tools":
        return Colors.green;
      case "AI/ML":
        return Colors.purple;
      case "Security":
        return Colors.red;
      case "Language":
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  void _showBeritaDetail(Map<String, String> berita) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.9,
        maxChildSize: 0.95,
        minChildSize: 0.5,
        builder: (context, scrollController) => Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              // Handle bar
              Container(
                width: 40,
                height: 4,
                margin: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          child: Image.asset(
                            berita["gambar"]!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [Color(0xFF1976D2), Color(0xFF2196F3)],
                                  ),
                                ),
                                child: Icon(
                                  Icons.article,
                                  size: 60,
                                  color: Colors.white.withValues(alpha: 0.7),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      // Category badge
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: getCategoryColor(berita["kategori"]!),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          berita["kategori"]!,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      // Title
                      Text(
                        berita["judul"]!,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1976D2),
                          height: 1.3,
                        ),
                      ),
                      SizedBox(height: 12),
                      // Time
                      Row(
                        children: [
                          Icon(Icons.access_time, size: 16, color: Colors.grey.shade500),
                          SizedBox(width: 4),
                          Text(
                            berita["waktu"]!,
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      // Full description
                      Text(
                        berita["deskripsi_lengkap"]!,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade700,
                          height: 1.6,
                        ),
                      ),
                      SizedBox(height: 30),
                      // Close button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF1976D2),
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            "Tutup",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
              Color(0xFF2196F3).withValues(alpha: 0.1),
              Colors.white,
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
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Color(0xFF1976D2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.article,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(
                          "Berita Terkini",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1976D2),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Subtitle
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Update terbaru dari dunia teknologi",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  // News List
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      itemCount: beritaList.length,
                      itemBuilder: (context, index) {
                        final berita = beritaList[index];
                        return TweenAnimationBuilder(
                          duration: Duration(milliseconds: 600),
                          tween: Tween<double>(begin: 0, end: 1),
                          builder: (context, double value, _) {
                            return Transform.translate(
                              offset: Offset(50 * (1 - value), 0),
                              child: Opacity(
                                opacity: value,
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 16),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.blue.withValues(alpha: 0.1),
                                        blurRadius: 15,
                                        spreadRadius: 2,
                                        offset: Offset(0, 5),
                                      ),
                                    ],
                                  ),
                                  child: Card(
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Colors.white,
                                            Color(0xFF2196F3).withValues(alpha: 0.05),
                                          ],
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          // Image with category badge
                                          Stack(
                                            children: [
                                              ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  topRight: Radius.circular(20),
                                                ),
                                                child: Container(
                                                  height: 180,
                                                  width: double.infinity,
                                                  child: Image.asset(
                                                    berita["gambar"]!,
                                                    fit: BoxFit.cover,
                                                    errorBuilder: (context, error, stackTrace) {
                                                      return Container(
                                                        decoration: BoxDecoration(
                                                          gradient: LinearGradient(
                                                            colors: [
                                                              Color(0xFF1976D2),
                                                              Color(0xFF2196F3),
                                                            ],
                                                          ),
                                                        ),
                                                        child: Icon(
                                                          Icons.article,
                                                          size: 60,
                                                          color: Colors.white.withValues(alpha: 0.7),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                top: 12,
                                                right: 12,
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 12,
                                                    vertical: 6,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: getCategoryColor(berita["kategori"]!),
                                                    borderRadius: BorderRadius.circular(20),
                                                  ),
                                                  child: Text(
                                                    berita["kategori"]!,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),

                                          // Content
                                          Padding(
                                            padding: EdgeInsets.all(20),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                // Time
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.access_time,
                                                      size: 16,
                                                      color: Colors.grey.shade500,
                                                    ),
                                                    SizedBox(width: 4),
                                                    Text(
                                                      berita["waktu"]!,
                                                      style: TextStyle(
                                                        color: Colors.grey.shade500,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                                SizedBox(height: 12),

                                                // Title
                                                Text(
                                                  berita["judul"]!,
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xFF1976D2),
                                                    height: 1.3,
                                                  ),
                                                ),

                                                SizedBox(height: 8),

                                                // Description
                                                Text(
                                                  berita["deskripsi"]!,
                                                  style: TextStyle(
                                                    color: Colors.grey.shade600,
                                                    fontSize: 14,
                                                    height: 1.4,
                                                  ),
                                                ),

                                                SizedBox(height: 16),

                                                // Read more button
                                                Align(
                                                  alignment: Alignment.centerRight,
                                                  child: GestureDetector(
                                                    onTap: () => _showBeritaDetail(berita),
                                                    child: Container(
                                                      padding: EdgeInsets.symmetric(
                                                        horizontal: 16,
                                                        vertical: 8,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        gradient: LinearGradient(
                                                          colors: [
                                                            Color(0xFF1976D2),
                                                            Color(0xFF2196F3),
                                                          ],
                                                        ),
                                                        borderRadius: BorderRadius.circular(20),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: [
                                                          Text(
                                                            "Baca Selengkapnya",
                                                            style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 12,
                                                              fontWeight: FontWeight.bold,
                                                            ),
                                                          ),
                                                          SizedBox(width: 4),
                                                          Icon(
                                                            Icons.arrow_forward,
                                                            color: Colors.white,
                                                            size: 16,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
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
}
