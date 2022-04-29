import '../../../../shared/failures/failures.dart';

abstract class UserError implements Failure {}

class UserInvalid extends UserError {}
