import 'package:flutter/material.dart';
import 'dart:math';

class KalkulatorPage extends StatefulWidget {
  const KalkulatorPage({super.key});

  @override
  State<KalkulatorPage> createState() => _KalkulatorPageState();
}

class _KalkulatorPageState extends State<KalkulatorPage>
    with TickerProviderStateMixin {
  String output = "";
  double num1 = 0;
  double num2 = 0;
  String operand = "";

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 1000),
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

  void buttonPressed(String btn) {
    setState(() {
      if (btn == "C") {
        output = "";
        num1 = 0;
        num2 = 0;
        operand = "";
      } else if (btn == "+" || btn == "-" || btn == "×" || btn == "÷") {
        num1 = double.tryParse(output) ?? 0;
        operand = btn;
        output = "";
      } else if (btn == "=") {
        num2 = double.tryParse(output) ?? 0;
        if (operand == "+") output = (num1 + num2).toString();
        if (operand == "-") output = (num1 - num2).toString();
        if (operand == "×") output = (num1 * num2).toString();
        if (operand == "÷") output = (num1 / num2).toString();
        operand = "";
      } else if (btn == "x²") {
        double val = double.tryParse(output) ?? 0;
        output = (val * val).toString();
      } else if (btn == "√") {
        double val = double.tryParse(output) ?? 0;
        output = sqrt(val).toString();
      } else {
        output += btn;
      }
    });
  }

  Widget buildButton(String label, {bool isOperator = false, bool isSpecial = false}) {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 300),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, double value, _) {
        return Transform.scale(
          scale: value,
          child: Container(
            margin: EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: isOperator
                    ? [Color(0xFF1976D2), Color(0xFF2196F3)]
                    : isSpecial
                        ? [Color(0xFF64B5F6), Color(0xFF90CAF9)]
                        : [Colors.white, Color(0xFFF5F5F5)],
              ),
              boxShadow: [
                BoxShadow(
                  color: isOperator
                      ? Colors.blue.withValues(alpha: 0.4)
                      : Colors.grey.withValues(alpha: 0.3),
                  blurRadius: 8,
                  spreadRadius: 1,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () => buttonPressed(label),
                child: Container(
                  width: 70,
                  height: 70,
                  alignment: Alignment.center,
                  child: Text(
                    label,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: isOperator || isSpecial ? Colors.white : Color(0xFF1976D2),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
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
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Kalkulator",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1976D2),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      padding: EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF1976D2), Color(0xFF2196F3)],
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withValues(alpha: 0.3),
                            blurRadius: 15,
                            spreadRadius: 2,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          output.isEmpty ? "0" : output,
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.right,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildButton("C", isSpecial: true),
                              buildButton("x²", isSpecial: true),
                              buildButton("√", isSpecial: true),
                              buildButton("÷", isOperator: true),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildButton("7"),
                              buildButton("8"),
                              buildButton("9"),
                              buildButton("×", isOperator: true),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildButton("4"),
                              buildButton("5"),
                              buildButton("6"),
                              buildButton("-", isOperator: true),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildButton("1"),
                              buildButton("2"),
                              buildButton("3"),
                              buildButton("+", isOperator: true),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(width: 70), // spacer
                              buildButton("0"),
                              buildButton("."),
                              buildButton("=", isOperator: true),
                            ],
                          ),
                        ],
                      ),
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
