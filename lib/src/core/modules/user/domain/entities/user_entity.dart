import '../value_objects/address.dart';
import '../value_objects/name.dart';

class UserEntity {
  final int id;
  final String email;
  final String username;
  final Name name;
  final Address? address;
  final String? phone;

  const UserEntity({
    required this.id,
    required this.email,
    required this.username,
    required this.name,
    this.address,
    this.phone,
  });

  bool isValid() {
    return !id.isNaN &&
        email.isNotEmpty &&
        username.isNotEmpty &&
        name.firstName.isNotEmpty &&
        name.lastName.isNotEmpty;
  }
}
