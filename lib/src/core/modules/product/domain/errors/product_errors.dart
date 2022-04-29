import '../../../../shared/failures/failures.dart';

abstract class ProductError implements Failure {}

class ProductInvalid extends ProductError {}
