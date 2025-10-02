import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'points_provider.dart';

class RewardScreen extends StatefulWidget {
  const RewardScreen({super.key});

  @override
  State<RewardScreen> createState() => _RewardScreenState();
}

class _RewardScreenState extends State<RewardScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  
  final List<Map<String, dynamic>> rewards = [
    {
      'name': 'กาแฟฟรี 1 แก้ว',
      'points': 80,
      'icon': Icons.coffee,
      'color': Colors.brown,
      'category': 'เครื่องดื่ม',
      'image': 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?auto=format&fit=crop&w=400&q=80', // coffee cup
    },
    {
      'name': 'ส่วนลด 20%',
      'points': 150,
      'icon': Icons.discount,
      'color': Colors.orange,
      'category': 'คูปอง',
      'image': 'https://images.unsplash.com/photo-1607083206968-13611e3d76db?auto=format&fit=crop&w=400&q=80', // discount tag
    },
    {
      'name': 'Espresso 1 Shot',
      'points': 60,
      'icon': Icons.local_cafe,
      'color': Colors.brown.shade900,
      'category': 'เครื่องดื่ม',
      'image': 'https://images.unsplash.com/photo-1510591509098-f4fdc6d0ff04?auto=format&fit=crop&w=400&q=80', // espresso shot
    },
    {
      'name': 'Latte ฟรี',
      'points': 90,
      'icon': Icons.local_drink,
      'color': Colors.brown.shade600,
      'category': 'เครื่องดื่ม',
      'image': 'https://images.unsplash.com/photo-1561882468-9110e03e0f78?auto=format&fit=crop&w=400&q=80', // latte art
    },
    {
      'name': 'เค้กฟรี 1 ชิ้น',
      'points': 120,
      'icon': Icons.cake,
      'color': Colors.pink,
      'category': 'ของหวาน',
      'image': 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?auto=format&fit=crop&w=400&q=80', // cake slice
    },
    {
      'name': 'ขนมปังฟรี 1 ชิ้น',
      'points': 100,
      'icon': Icons.bakery_dining,
      'color': Colors.amber,
      'category': 'ของหวาน',
      'image': 'https://images.unsplash.com/photo-1509440159596-0249088772ff?auto=format&fit=crop&w=400&q=80', // bread loaf
    },
    {
      'name': 'คุกกี้ฟรี 3 ชิ้น',
      'points': 130,
      'icon': Icons.cookie,
      'color': Colors.orange.shade600,
      'category': 'ของหวาน',
      'image': 'https://images.unsplash.com/photo-1499636136210-6f4ee915583e?auto=format&fit=crop&w=400&q=80', // cookies
    },
    {
      'name': 'ส่วนลด 30%',
      'points': 250,
      'icon': Icons.local_offer,
      'color': Colors.red,
      'category': 'คูปอง',
      'image': 'https://images.unsplash.com/photo-1607082348824-0a96f2a4b9da?auto=format&fit=crop&w=400&q=80', // sale coupon
    },
    {
      'name': 'แก้วกาแฟพิเศษ',
      'points': 400,
      'icon': Icons.emoji_food_beverage,
      'color': Colors.deepPurple,
      'category': 'ของรางวัล',
      'image': 'https://images.unsplash.com/photo-1514228742587-6b1558fcca3d?auto=format&fit=crop&w=400&q=80', // coffee mug
    },
    {
      'name': 'เสื้อยืดร้านกาแฟ',
      'points': 800,
      'icon': Icons.checkroom,
      'color': Colors.indigo,
      'category': 'ของรางวัล',
      'image': 'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?auto=format&fit=crop&w=400&q=80', // t-shirt
    },
    {
      'name': 'กระเป๋าผ้าแบรนด์',
      'points': 600,
      'icon': Icons.shopping_bag,
      'color': Colors.teal,
      'category': 'ของรางวัล',
      'image': 'https://images.unsplash.com/photo-1590874103328-eac38a683ce7?auto=format&fit=crop&w=400&q=80', // tote bag
    },
    {
      'name': 'บัตรสมาชิก VIP',
      'points': 1000,
      'icon': Icons.card_membership,
      'color': Colors.red.shade900,
      'category': 'พิเศษ',
      'image': 'https://images.unsplash.com/photo-1559056199-641a0ac8b55e?auto=format&fit=crop&w=400&q=80', // vip card
    },
    {
      'name': 'หนังสือสูตรกาแฟ',
      'points': 350,
      'icon': Icons.menu_book,
      'color': Colors.blueGrey,
      'category': 'ของรางวัล',
      'image': 'https://images.unsplash.com/photo-1495446815901-a7297e633e8d?auto=format&fit=crop&w=400&q=80', // book
    },
    {
      'name': 'เครื่องชงกาแฟมือ',
      'points': 1500,
      'icon': Icons.coffee_maker,
      'color': Colors.brown.shade900,
      'category': 'พิเศษ',
      'image': 'https://img5.pic.in.th/file/secure-sv1/ChatGPT-Image-Oct-2-2025-07_14_43-PM.md.png', // coffee maker
    },
    {
      'name': 'เมล็ดกาแฟพรีเมียม',
      'points': 7000,
      'icon': Icons.grain,
      'color': Colors.brown.shade700,
      'category': 'พิเศษ',
      'image': 'https://images.unsplash.com/photo-1447933601403-0c6688de566e?auto=format&fit=crop&w=400&q=80', // coffee beans
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> _getRewardsByCategory(String category) {
    return rewards.where((r) => r['category'] == category).toList();
  }

  void _redeemReward(Map<String, dynamic> reward, PointsProvider pointsProvider) {
    if (pointsProvider.currentPoints >= reward['points']) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Row(
            children: [
              Icon(
                Icons.redeem,
                color: reward['color'] as Color,
                size: 28,
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  'ยืนยันการแลก',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: (reward['color'] as Color).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  reward['icon'] as IconData,
                  size: 60,
                  color: reward['color'] as Color,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                reward['name'] as String,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.stars, color: Colors.orange.shade700, size: 20),
                    const SizedBox(width: 6),
                    Text(
                      '${reward['points']} แต้ม',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange.shade700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'ต้องการแลกรางวัลนี้ใช่หรือไม่?',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'ยกเลิก',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade600,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                pointsProvider.subtractPoints(reward['points'] as int);
                Navigator.pop(context);
                
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Row(
                      children: [
                        const Icon(Icons.check_circle, color: Colors.white),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text('แลก ${reward['name']} สำเร็จ! 🎉'),
                        ),
                      ],
                    ),
                    backgroundColor: Colors.green.shade600,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    duration: const Duration(seconds: 3),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown.shade700,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'ยืนยัน',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.error_outline, color: Colors.white),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'แต้มไม่เพียงพอ ต้องการอีก ${reward['points'] - pointsProvider.currentPoints} แต้ม',
                ),
              ),
            ],
          ),
          backgroundColor: Colors.red.shade600,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PointsProvider>(
      builder: (context, pointsProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'แลกของรางวัล',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.brown.shade800,
            foregroundColor: Colors.white,
            elevation: 0,
            bottom: TabBar(
              controller: _tabController,
              isScrollable: true,
              indicatorColor: Colors.orange.shade700,
              indicatorWeight: 3,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white70,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              tabs: const [
                Tab(text: 'ทั้งหมด'),
                Tab(text: 'เครื่องดื่ม'),
                Tab(text: 'ของหวาน'),
                Tab(text: 'พิเศษ'),
              ],
            ),
          ),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.brown.shade800,
                  Colors.brown.shade100,
                ],
              ),
            ),
            child: Column(
              children: [
                // Points Display Card
                Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        Colors.orange.shade50,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.orange.shade400,
                              Colors.orange.shade600,
                            ],
                          ),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.orange.withOpacity(0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.stars,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'แต้มสะสมของคุณ',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${pointsProvider.currentPoints}',
                              style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                color: Colors.brown.shade800,
                              ),
                            ),
                            Text(
                              'แต้ม',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey.shade400,
                      ),
                    ],
                  ),
                ),

                // Rewards List
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _buildRewardsList(rewards, pointsProvider),
                      _buildRewardsList(_getRewardsByCategory('เครื่องดื่ม'), pointsProvider),
                      _buildRewardsList(_getRewardsByCategory('ของหวาน'), pointsProvider),
                      _buildRewardsList(
                        rewards.where((r) => 
                          r['category'] == 'พิเศษ' || 
                          r['category'] == 'ของรางวัล' || 
                          r['category'] == 'คูปอง'
                        ).toList(),
                        pointsProvider,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildRewardsList(List<Map<String, dynamic>> rewardsList, PointsProvider pointsProvider) {
    if (rewardsList.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.inbox_outlined,
              size: 80,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 16),
            Text(
              'ไม่มีรางวัลในหมวดนี้',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      physics: const BouncingScrollPhysics(),
      itemCount: rewardsList.length,
      itemBuilder: (context, index) {
        final reward = rewardsList[index];
        final canRedeem = pointsProvider.currentPoints >= reward['points'];

        return TweenAnimationBuilder<double>(
          duration: Duration(milliseconds: 300 + (index * 50)),
          tween: Tween(begin: 0.0, end: 1.0),
          builder: (context, value, child) {
            return Transform.scale(
              scale: value,
              child: Opacity(
                opacity: value,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: canRedeem
                          ? () => _redeemReward(reward, pointsProvider)
                          : null,
                      borderRadius: BorderRadius.circular(20),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            // รูปภาพของรางวัล
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                reward['image'] ?? '',
                                width: 56,
                                height: 56,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) => Container(
                                  width: 56,
                                  height: 56,
                                  color: Colors.grey.shade200,
                                  child: Icon(reward['icon'], color: reward['color'], size: 32),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    reward['name'] as String,
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.brown,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.orange.shade50,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Colors.orange.shade200,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.stars,
                                          size: 16,
                                          color: Colors.orange.shade700,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          '${reward['points']} แต้ม',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.orange.shade700,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 12),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                gradient: canRedeem
                                    ? LinearGradient(
                                        colors: [
                                          Colors.brown.shade700,
                                          Colors.brown.shade900,
                                        ],
                                      )
                                    : null,
                                color: canRedeem ? null : Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: canRedeem
                                    ? [
                                        BoxShadow(
                                          color: Colors.brown.withOpacity(0.3),
                                          blurRadius: 8,
                                          offset: const Offset(0, 4),
                                        ),
                                      ]
                                    : null,
                              ),
                              child: Text(
                                canRedeem ? 'แลก' : 'ล็อก',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: canRedeem ? Colors.white : Colors.grey.shade500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}