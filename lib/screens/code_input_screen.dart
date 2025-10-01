import 'package:flutter/material.dart';

class CodeInputScreen extends StatefulWidget {
  const CodeInputScreen({super.key});

  @override
  State<CodeInputScreen> createState() => _CodeInputScreenState();
}

class _CodeInputScreenState extends State<CodeInputScreen> {
  final TextEditingController _codeController = TextEditingController();
  final int _pointsPerCoffee = 10;
  
  // ตัวอย่างโค้ดที่ใช้ได้ (ในการใช้งานจริงควรเชื่อมต่อกับ Backend)
  final List<String> _validCodes = ['COFFEE123', 'CAFE456', 'BREW789'];
  final List<String> _usedCodes = [];

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  void _validateAndRedeemCode() {
    String code = _codeController.text.trim().toUpperCase();
    
    if (code.isEmpty) {
      _showSnackBar('กรุณากรอกโค้ด', Colors.red);
      return;
    }

    if (_usedCodes.contains(code)) {
      _showSnackBar('โค้ดนี้ถูกใช้ไปแล้ว', Colors.orange);
      return;
    }

    if (_validCodes.contains(code)) {
      setState(() {
        _usedCodes.add(code);
      });
      
      _showSnackBar('ใช้โค้ดสำเร็จ! +$_pointsPerCoffee แต้ม', Colors.green);
      
      // ส่งค่าแต้มกลับไปหน้า Home
      Future.delayed(const Duration(milliseconds: 1500), () {
        Navigator.pop(context, _pointsPerCoffee);
      });
    } else {
      _showSnackBar('โค้ดไม่ถูกต้อง กรุณาลองใหม่อีกครั้ง', Colors.red);
    }
  }

  void _showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('กรอกโค้ดรับแต้ม'),
        backgroundColor: Colors.brown.shade700,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.brown.shade700,
              Colors.brown.shade300,
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                
                // Icon
                Container(
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.qr_code_scanner,
                    size: 80,
                    color: Colors.brown.shade700,
                  ),
                ),
                
                const SizedBox(height: 30),
                
                // Title
                const Text(
                  'กรอกโค้ดจากใบเสร็จ',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                
                const SizedBox(height: 10),
                
                Text(
                  'ใช้โค้ดที่ได้จากการซื้อกาแฟที่ร้าน\nเพื่อสะสมแต้มและรับสิทธิพิเศษ',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.9),
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                
                const SizedBox(height: 40),
                
                // Input Card
                Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        TextField(
                          controller: _codeController,
                          textAlign: TextAlign.center,
                          textCapitalization: TextCapitalization.characters,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3,
                          ),
                          decoration: InputDecoration(
                            hintText: 'COFFEE123',
                            hintStyle: TextStyle(
                              color: Colors.grey.shade400,
                              letterSpacing: 3,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Colors.brown.shade300),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.brown.shade700,
                                width: 2,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 20,
                            ),
                            prefixIcon: Icon(
                              Icons.confirmation_number,
                              color: Colors.brown.shade700,
                              size: 28,
                            ),
                          ),
                        ),
                        
                        const SizedBox(height: 20),
                        
                        // Submit Button
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: _validateAndRedeemCode,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.brown.shade700,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              elevation: 4,
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.check_circle, size: 24, color: Colors.white),
                                SizedBox(width: 10),
                                Text(
                                  'ยืนยันโค้ด',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
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
                
                const SizedBox(height: 30),
                
                // Info Box
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.3),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.info_outline,
                            size: 22,
                            color: Colors.amber.shade300,
                          ),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Text(
                              'ข้อมูลสำคัญ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      _buildInfoItem('แต่ละโค้ดใช้ได้เพียงครั้งเดียว'),
                      _buildInfoItem('รับ $_pointsPerCoffee แต้มต่อ 1 โค้ด'),
                      _buildInfoItem('ตรวจสอบโค้ดจากใบเสร็จ'),
                    ],
                  ),
                ),
                
                const SizedBox(height: 30),
                
                // Example codes (for testing)
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade100.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.orange.shade200.withOpacity(0.3),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'โค้ดตัวอย่างสำหรับทดสอบ:',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white.withOpacity(0.8),
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'COFFEE123, CAFE456, BREW789',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.white.withOpacity(0.7),
                          fontFamily: 'monospace',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 6),
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}