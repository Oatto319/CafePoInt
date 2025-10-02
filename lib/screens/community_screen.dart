import 'package:flutter/material.dart';
import '../services/database_service.dart';
import '../services/auth_service.dart';
import '../models/post_model.dart';
import '../models/menu_item_model.dart';
import '../widgets/post_card.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  List<PostModel> _posts = [];
  
  @override
  void initState() {
    super.initState();
    _posts = DatabaseService.getPosts();

    _posts.insertAll(0, [
      PostModel(
        id: 'sample1',
        userId: 'user1',
        userName: 'Wimol',
        userImage: null,
        imageUrl: 'https://media.istockphoto.com/id/2156124171/photo/ice-caramel-macchiato-coffee.webp?a=1&b=1&s=612x612&w=0&k=20&c=IifzK8dqdcDezZvXA1KyjF4R_JqyRAppWcf-5QVFl0Y=', // Caramel Macchiato
        caption: 'กาแฟ Caramel Macchiato หอมหวานมากๆ วันนี้ได้ลองเมนูใหม่ อร่อยสุดๆ!',
        menuTag: 'Caramel Macchiato',
        likes: 5,
        createdAt: DateTime.now().subtract(const Duration(hours: 2)),
        comments: [
          Comment(
            userId: 'user2',
            userName: 'Nina',
            text: 'น่ากินมากเลยค่ะ!',
            createdAt: DateTime.now().subtract(const Duration(hours: 1, minutes: 30)),
          ),
          Comment(
            userId: 'user3',
            userName: 'Bank',
            text: 'ร้านนี้กาแฟดีจริง 👍',
            createdAt: DateTime.now().subtract(const Duration(hours: 1)),
          ),
        ],
      ),
      PostModel(
        id: 'sample2',
        userId: 'user2',
        userName: 'Nina',
        userImage: null,
        imageUrl: 'https://images.unsplash.com/photo-1511920170033-f8396924c348?auto=format&fit=crop&w=400&q=80', // Espresso
        caption: 'Espresso เข้มข้น ตื่นเต็มตา! ใครชอบกาแฟเข้มๆ ต้องลอง',
        menuTag: 'Espresso',
        likes: 3,
        createdAt: DateTime.now().subtract(const Duration(hours: 3)),
        comments: [
          Comment(
            userId: 'user1',
            userName: 'Wimol',
            text: 'เมนูโปรดเลยค่ะ!',
            createdAt: DateTime.now().subtract(const Duration(hours: 2, minutes: 45)),
          ),
        ],
      ),
      PostModel(
        id: 'sample3',
        userId: 'user3',
        userName: 'Bank',
        userImage: null,
        imageUrl: 'https://plus.unsplash.com/premium_photo-1668970851336-6c81cc888ba7?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8TW9jaGF8ZW58MHx8MHx8fDA%3D', // Mocha
        caption: 'Mocha หวานมันกำลังดี ดื่มกับขนมปังยิ่งฟิน~',
        menuTag: 'Mocha',
        likes: 2,
        createdAt: DateTime.now().subtract(const Duration(hours: 5)),
        comments: [
          Comment(
            userId: 'user2',
            userName: 'Nina',
            text: 'ต้องลองบ้างแล้วค่ะ',
            createdAt: DateTime.now().subtract(const Duration(hours: 4, minutes: 50)),
          ),
        ],
      ),
      PostModel(
        id: 'sample4',
        userId: 'user4',
        userName: 'Tom',
        userImage: null,
        imageUrl: 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?auto=format&fit=crop&w=400&q=80', // Latte
        caption: 'ลาเต้ร้อน นุ่มละมุนมากๆ เหมาะกับเช้าวันใหม่!',
        menuTag: 'Latte',
        likes: 4,
        createdAt: DateTime.now().subtract(const Duration(hours: 6)),
        comments: [
          Comment(
            userId: 'user1',
            userName: 'Wimol',
            text: 'ต้องไปลองบ้างแล้วค่ะ',
            createdAt: DateTime.now().subtract(const Duration(hours: 5, minutes: 45)),
          ),
        ],
      ),
      PostModel(
        id: 'sample5',
        userId: 'user5',
        userName: 'Ice',
        userImage: null,
        imageUrl: 'https://media.istockphoto.com/id/2187142621/th/%E0%B8%A3%E0%B8%B9%E0%B8%9B%E0%B8%96%E0%B9%88%E0%B8%B2%E0%B8%A2/%E0%B8%81%E0%B8%B2%E0%B9%81%E0%B8%9F%E0%B9%80%E0%B8%A2%E0%B9%87%E0%B8%99%E0%B9%83%E0%B8%99%E0%B9%81%E0%B8%81%E0%B9%89%E0%B8%A7%E0%B8%9E%E0%B8%A3%E0%B9%89%E0%B8%AD%E0%B8%A1%E0%B8%AB%E0%B8%A5%E0%B8%AD%E0%B8%94%E0%B8%94%E0%B9%8D%E0%B8%B2.jpg?s=612x612&w=0&k=20&c=V7FEZXSS39evKwNDE-V_j5VgvaP1xEss2PkfO-MuXmQ=', // Iced Coffee
        caption: 'อากาศร้อนแบบนี้ต้องกาแฟเย็นเท่านั้น สดชื่นมาก!',
        menuTag: 'Iced Coffee',
        likes: 6,
        createdAt: DateTime.now().subtract(const Duration(hours: 7)),
        comments: [
          Comment(
            userId: 'user2',
            userName: 'Nina',
            text: 'น่าดื่มมากค่ะ',
            createdAt: DateTime.now().subtract(const Duration(hours: 6, minutes: 45)),
          ),
        ],
      ),
      PostModel(
        id: 'sample6',
        userId: 'user6',
        userName: 'Mint',
        userImage: null,
        imageUrl: 'https://media.istockphoto.com/id/1297370884/th/%E0%B8%A3%E0%B8%B9%E0%B8%9B%E0%B8%96%E0%B9%88%E0%B8%B2%E0%B8%A2/%E0%B8%A1%E0%B8%A1%E0%B8%A7%E0%B8%A1%E0%B8%94%E0%B9%8D%E0%B8%B2%E0%B9%80%E0%B8%A2%E0%B9%87%E0%B8%99%E0%B8%81%E0%B8%B1%E0%B8%9A%E0%B9%82%E0%B8%9F%E0%B8%A1%E0%B8%99%E0%B8%A1-%E0%B8%95%E0%B8%A3%E0%B8%87%E0%B8%81%E0%B8%A5%E0%B8%B2%E0%B8%87.jpg?s=612x612&w=0&k=20&c=WTtLaVI2ouj4Ett38x1bwo5Tcv37QLPkxVI1xh6Yt2c=', // Matcha Latte
        caption: 'Matcha Latte เขียวเข้มข้น หอมกลิ่นชาเขียวแท้ๆ',
        menuTag: 'Matcha Latte',
        likes: 2,
        createdAt: DateTime.now().subtract(const Duration(hours: 8)),
        comments: [
          Comment(
            userId: 'user3',
            userName: 'Bank',
            text: 'ต้องลองเมนูนี้บ้างแล้ว',
            createdAt: DateTime.now().subtract(const Duration(hours: 7, minutes: 50)),
          ),
        ],
      ),
      PostModel(
        id: 'sample7',
        userId: 'user7',
        userName: 'Nam',
        userImage: null,
        imageUrl: 'https://media.istockphoto.com/id/1147846777/th/%E0%B8%A3%E0%B8%B9%E0%B8%9B%E0%B8%96%E0%B9%88%E0%B8%B2%E0%B8%A2/%E0%B8%8A%E0%B8%B2%E0%B8%99%E0%B9%89%E0%B9%8D%E0%B8%B2%E0%B9%81%E0%B8%82%E0%B9%87%E0%B8%87%E0%B8%81%E0%B8%B1%E0%B8%9A%E0%B8%A1%E0%B8%B0%E0%B8%99%E0%B8%B2%E0%B8%A7%E0%B9%81%E0%B8%A5%E0%B8%B0%E0%B8%AA%E0%B8%B0%E0%B8%A3%E0%B8%B0%E0%B9%81%E0%B8%AB%E0%B8%99%E0%B9%88%E0%B9%83%E0%B8%99%E0%B8%82%E0%B8%A7%E0%B8%94.jpg?s=612x612&w=0&k=20&c=SoV1ByKpX3t5Ep_Q7CuDpidG7aIY6MI2BAndhJ9PL4k=', // Lemon Tea
        caption: 'ชามะนาวเย็นๆ สดชื่นสุดๆ!',
        menuTag: 'Lemon Tea',
        likes: 3,
        createdAt: DateTime.now().subtract(const Duration(hours: 9)),
        comments: [
          Comment(
            userId: 'user4',
            userName: 'Tom',
            text: 'เหมาะกับอากาศร้อนจริงๆ',
            createdAt: DateTime.now().subtract(const Duration(hours: 8, minutes: 45)),
          ),
        ],
      ),
    ]);
  }

  void _showCreatePostDialog() {
    final TextEditingController captionController = TextEditingController();
    String? selectedMenu;
    List<MenuItemModel> menuItems = DatabaseService.getMenuItems();

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text('สร้างโพสต์ใหม่'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image Picker Placeholder
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_photo_alternate,
                          size: 50, color: Colors.grey.shade400),
                      const SizedBox(height: 8),
                      Text(
                        'เพิ่มรูปภาพ',
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Caption Input
                TextField(
                  controller: captionController,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: 'เขียนคำบรรยาย...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Menu Tag Selector
                const Text(
                  'เลือกเมนู (ถ้ามี)',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: selectedMenu,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                  hint: const Text('เลือกเมนู'),
                  items: [
                    const DropdownMenuItem(
                      value: null,
                      child: Text('ไม่ระบุ'),
                    ),
                    ...menuItems.map((item) => DropdownMenuItem(
                          value: item.name,
                          child: Text(item.name),
                        )),
                  ],
                  onChanged: (value) {
                    setDialogState(() {
                      selectedMenu = value;
                    });
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('ยกเลิก'),
            ),
            ElevatedButton(
              onPressed: () {
                if (captionController.text.isNotEmpty) {
                  var user = AuthService.currentUser;
                  if (user != null) {
                    setState(() {
                      _posts.insert(
                        0,
                        PostModel(
                          id: DateTime.now().toString(),
                          userId: user.id,
                          userName: user.name,
                          userImage: user.profileImage,
                          imageUrl: 'https://via.placeholder.com/400',
                          caption: captionController.text,
                          menuTag: selectedMenu,
                          likes: 0,
                          createdAt: DateTime.now(),
                          comments: [],
                        ),
                      );
                    });
                  }
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('สร้างโพสต์สำเร็จ! 🎉'),
                      backgroundColor: Colors.green,
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown.shade700,
                foregroundColor: Colors.white,
              ),
              child: const Text('โพสต์'),
            ),
          ],
        ),
      ),
    );
  }

  void _toggleLike(int index) {
    setState(() {
      var post = _posts[index];
      _posts[index] = PostModel(
        id: post.id,
        userId: post.userId,
        userName: post.userName,
        userImage: post.userImage,
        imageUrl: post.imageUrl,
        caption: post.caption,
        menuTag: post.menuTag,
        likes: post.isLikedByCurrentUser ? post.likes - 1 : post.likes + 1,
        comments: post.comments,
        createdAt: post.createdAt,
        isLikedByCurrentUser: !post.isLikedByCurrentUser,
      );
    });
  }

  void _showComments(int index) {
    final TextEditingController commentController = TextEditingController();
    
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.3,
        maxChildSize: 0.9,
        expand: false,
        builder: (context, scrollController) => Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey.shade300),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'ความคิดเห็น',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            Expanded(
              child: _posts[index].comments.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.chat_bubble_outline,
                              size: 60, color: Colors.grey.shade400),
                          const SizedBox(height: 16),
                          Text(
                            'ยังไม่มีความคิดเห็น',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      controller: scrollController,
                      itemCount: _posts[index].comments.length,
                      itemBuilder: (context, commentIndex) {
                        final comment = _posts[index].comments[commentIndex];
                        return ListTile(
                          leading: CircleAvatar(
                            child: Text(comment.userName[0]),
                          ),
                          title: Text(
                            comment.userName,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(comment.text),
                        );
                      },
                    ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey.shade300),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: commentController,
                      decoration: InputDecoration(
                        hintText: 'เขียนความคิดเห็น...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    icon: Icon(Icons.send, color: Colors.brown.shade700),
                    onPressed: () {
                      if (commentController.text.isNotEmpty) {
                        var user = AuthService.currentUser;
                        if (user != null) {
                          setState(() {
                            _posts[index].comments.add(
                              Comment(
                                userId: user.id,
                                userName: user.name,
                                text: commentController.text,
                                createdAt: DateTime.now(),
                              ),
                            );
                          });
                          commentController.clear();
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('แสดงความคิดเห็นแล้ว!'),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('คอมมูนิตี้'),
        backgroundColor: Colors.brown.shade700,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: _posts.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.photo_library_outlined,
                      size: 80, color: Colors.grey.shade400),
                  const SizedBox(height: 20),
                  Text(
                    'ยังไม่มีโพสต์',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: _showCreatePostDialog,
                    icon: const Icon(Icons.add),
                    label: const Text('สร้างโพสต์แรก'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown.shade700,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: _posts.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    PostCard(
                      post: _posts[index],
                      onLike: () => _toggleLike(index),
                      onComment: () => _showComments(index),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: PopupMenuButton<String>(
                        onSelected: (value) {
                          if (value == 'edit') {
                            // TODO: เพิ่มฟังก์ชันแก้ไขโพสต์
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('ฟีเจอร์แก้ไขโพสต์ (ยังไม่พร้อมใช้งาน)')),
                            );
                          } else if (value == 'delete') {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('ลบโพสต์'),
                                content: const Text('คุณต้องการลบโพสต์นี้หรือไม่?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('ยกเลิก'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        _posts.removeAt(index);
                                      });
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(content: Text('ลบโพสต์สำเร็จ')),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                      foregroundColor: Colors.white,
                                    ),
                                    child: const Text('ลบ'),
                                  ),
                                ],
                              ),
                            );
                          } else if (value == 'report') {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('รายงานโพสต์เรียบร้อยแล้ว')),
                            );
                          }
                        },
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            value: 'edit',
                            child: Text('แก้ไขโพสต์'),
                          ),
                          const PopupMenuItem(
                            value: 'delete',
                            child: Text('ลบโพสต์'),
                          ),
                          const PopupMenuItem(
                            value: 'report',
                            child: Text('รายงานโพสต์'),
                          ),
                        ],
                        icon: const Icon(Icons.more_vert, color: Colors.grey),
                      ),
                    ),
                  ],
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showCreatePostDialog,
        backgroundColor: Colors.brown.shade700,
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }
}