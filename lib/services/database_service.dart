import '../models/menu_item_model.dart';
import '../models/post_model.dart';

class DatabaseService {
  // จำลองข้อมูลเมนู
  static List<MenuItemModel> getMenuItems() {
    return [
      MenuItemModel(
        id: '1',
        name: 'Espresso',
        description: 'กาแฟเข้มข้น หอมกรุ่น',
        price: 45,
        imageUrl: 'https://via.placeholder.com/150',
        category: 'Hot Coffee',
        isRecommended: true,
      ),
      MenuItemModel(
        id: '2',
        name: 'Cappuccino',
        description: 'กาแฟผสมนมฟองนุ่ม',
        price: 55,
        imageUrl: 'https://via.placeholder.com/150',
        category: 'Hot Coffee',
        isBestSeller: true,
        discount: 10,
      ),
      MenuItemModel(
        id: '3',
        name: 'Latte',
        description: 'กาแฟนมหอมมัน',
        price: 60,
        imageUrl: 'https://via.placeholder.com/150',
        category: 'Hot Coffee',
        isBestSeller: true,
      ),
      MenuItemModel(
        id: '4',
        name: 'Mocha',
        description: 'กาแฟช็อกโกแลต หวานมัน',
        price: 65,
        imageUrl: 'https://via.placeholder.com/150',
        category: 'Hot Coffee',
        discount: 10,
      ),
      MenuItemModel(
        id: '5',
        name: 'Americano',
        description: 'กาแฟอเมริกันโน่ เข้มกำลังดี',
        price: 50,
        imageUrl: 'https://via.placeholder.com/150',
        category: 'Hot Coffee',
        isRecommended: true,
      ),
      MenuItemModel(
        id: '6',
        name: 'Iced Latte',
        description: 'ลาเต้เย็น สดชื่น',
        price: 65,
        imageUrl: 'https://via.placeholder.com/150',
        category: 'Cold Coffee',
        isBestSeller: true,
      ),
    ];
  }

  // จำลองข้อมูลโพสต์
  static List<PostModel> getPosts() {
    return [
      PostModel(
        id: '1',
        userId: '2',
        userName: 'Coffee Addict',
        imageUrl: 'https://via.placeholder.com/400',
        caption: 'เช้านี้ดื่มลาเต้ อร่อยมาก! ☕️ #coffeelover',
        menuTag: 'Latte',
        likes: 45,
        createdAt: DateTime.now().subtract(const Duration(hours: 2)),
        comments: [],
      ),
      PostModel(
        id: '2',
        userId: '3',
        userName: 'Barista Pro',
        imageUrl: 'https://via.placeholder.com/400',
        caption: 'Cappuccino art วันนี้ เป็นยังไงบ้าง? ❤️',
        menuTag: 'Cappuccino',
        likes: 128,
        createdAt: DateTime.now().subtract(const Duration(hours: 5)),
        comments: [],
      ),
    ];
  }

  // ตรวจสอบโค้ด
  static bool verifyCode(String code) {
    // จำลองโค้ดที่ถูกต้อง
    List<String> validCodes = ['cof11', 'cof12', 'cof13', 'cof14', 'cof15'];
    return validCodes.contains(code.toLowerCase());
  }
}