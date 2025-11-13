import 'package:flutter/material.dart';

class BiodataPage extends StatefulWidget {
  const BiodataPage({super.key});

  @override
  State<BiodataPage> createState() => _BiodataPageState();
}

class _BiodataPageState extends State<BiodataPage>
    with TickerProviderStateMixin {
  String? gender;
  DateTime? birthDate;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

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

  void _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1970),
      lastDate: DateTime(2025),
    );
    if (picked != null && mounted) {
      setState(() => birthDate = picked);
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
              Color(0xFF2196F3).withValues(alpha: 0.1),
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SlideTransition(
              position: _slideAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: ListView(
                  children: [
                    Text(
                      "Biodata",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1976D2),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30),
                    Hero(
                      tag: "profile",
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.withValues(alpha: 0.3),
                                blurRadius: 20,
                                spreadRadius: 5,
                              ),
                            ],
                          ),
                          child: CircleAvatar(
                            radius: 80,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 75,
                              backgroundImage: AssetImage('assets/profile.jpg'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    _buildAnimatedCard(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "Nama Lengkap",
                          prefixIcon: Icon(Icons.person, color: Color(0xFF1976D2)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Color(0xFF1976D2), width: 2),
                          ),
                        ),
                      ),
                      delay: 200,
                    ),
                    SizedBox(height: 20),
                    _buildAnimatedCard(
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: "Jenis Kelamin",
                          prefixIcon: Icon(Icons.wc, color: Color(0xFF1976D2)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Color(0xFF1976D2), width: 2),
                          ),
                        ),
                        items: ['Laki-laki', 'Perempuan']
                            .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                            .toList(),
                        onChanged: (val) => setState(() => gender = val),
                        value: gender,
                      ),
                      delay: 400,
                    ),
                    SizedBox(height: 20),
                    _buildAnimatedCard(
                      child: Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(color: Colors.grey.shade300),
                        ),
                        child: ListTile(
                          leading: Icon(Icons.calendar_month, color: Color(0xFF1976D2)),
                          title: Text(
                            birthDate == null
                                ? "Pilih Tanggal Lahir"
                                : "Tanggal Lahir: ${birthDate!.day}-${birthDate!.month}-${birthDate!.year}",
                            style: TextStyle(
                              color: birthDate == null ? Colors.grey.shade600 : Colors.black,
                            ),
                          ),
                          trailing: Icon(Icons.arrow_drop_down, color: Color(0xFF1976D2)),
                          onTap: _selectDate,
                        ),
                      ),
                      delay: 600,
                    ),
                    SizedBox(height: 30),
                    _buildAnimatedCard(
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Biodata berhasil disimpan!"),
                              backgroundColor: Color(0xFF1976D2),
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          "Simpan Biodata",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      delay: 800,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedCard({required Widget child, required int delay}) {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 600),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, double value, _) {
        return Transform.translate(
          offset: Offset(0, 20 * (1 - value)),
          child: Opacity(
            opacity: value,
            child: child,
          ),
        );
      },
    );
  }
}
