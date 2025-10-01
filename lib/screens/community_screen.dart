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
                return PostCard(
                  post: _posts[index],
                  onLike: () => _toggleLike(index),
                  onComment: () => _showComments(index),
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