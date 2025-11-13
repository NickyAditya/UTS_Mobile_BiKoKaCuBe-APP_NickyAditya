import 'package:flutter/material.dart';

class CustomBottomNavbar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavbar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF1976D2),
            Color(0xFF1565C0),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withValues(alpha: 0.3),
            blurRadius: 20,
            spreadRadius: 2,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withValues(alpha: 0.6),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 11,
        ),
        items: [
          BottomNavigationBarItem(
            icon: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              padding: EdgeInsets.all(currentIndex == 0 ? 8 : 4),
              decoration: BoxDecoration(
                color: currentIndex == 0 ? Colors.white.withValues(alpha: 0.2) : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(Icons.person, size: currentIndex == 0 ? 28 : 24),
            ),
            label: "Biodata",
          ),
          BottomNavigationBarItem(
            icon: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              padding: EdgeInsets.all(currentIndex == 1 ? 8 : 4),
              decoration: BoxDecoration(
                color: currentIndex == 1 ? Colors.white.withValues(alpha: 0.2) : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(Icons.contacts, size: currentIndex == 1 ? 28 : 24),
            ),
            label: "Kontak",
          ),
          BottomNavigationBarItem(
            icon: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              padding: EdgeInsets.all(currentIndex == 2 ? 8 : 4),
              decoration: BoxDecoration(
                color: currentIndex == 2 ? Colors.white.withValues(alpha: 0.2) : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(Icons.calculate, size: currentIndex == 2 ? 28 : 24),
            ),
            label: "Kalkulator",
          ),
          BottomNavigationBarItem(
            icon: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              padding: EdgeInsets.all(currentIndex == 3 ? 8 : 4),
              decoration: BoxDecoration(
                color: currentIndex == 3 ? Colors.white.withValues(alpha: 0.2) : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(Icons.cloud, size: currentIndex == 3 ? 28 : 24),
            ),
            label: "Cuaca",
          ),
          BottomNavigationBarItem(
            icon: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              padding: EdgeInsets.all(currentIndex == 4 ? 8 : 4),
              decoration: BoxDecoration(
                color: currentIndex == 4 ? Colors.white.withValues(alpha: 0.2) : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(Icons.article, size: currentIndex == 4 ? 28 : 24),
            ),
            label: "Berita",
          ),
        ],
      ),
    );
  }
}
