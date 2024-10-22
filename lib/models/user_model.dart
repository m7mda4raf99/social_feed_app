import 'package:hive/hive.dart';
import 'package:social_feed_app/services/auto_increment_service.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String username;

  @HiveField(2)
  final String password;

  @HiveField(3)
  final String profileImageUrl;

  User({
    required this.id,
    required this.username,
    required this.password,
    required this.profileImageUrl,
  });

  // Static method to create a new User object with auto-incremented ID
  static Future<User> create({
    required String username,
    required String password,
    required String profileImageUrl,
  }) async {
    int nextId = await AutoIncrementService.getNextId('user');

    // Create and return the new user object with the auto-incremented ID
    return User(
      id: nextId.toString(),
      username: username,
      password: password,
      profileImageUrl: profileImageUrl,
    );
  }
}
