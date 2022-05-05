import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/shared/widgets/custom_circular_progress_indicator.dart';
import '../router/detail_arguments.dart';
import 'controller/detail_controller.dart';
import 'states/detail_states.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, required this.detailArguments}) : super(key: key);
  final DetailArguments detailArguments;
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final controller = GetIt.instance.get<DetailProductController>();

  @override
  void initState() {
    super.initState();
    controller.getProductById(widget.detailArguments.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ValueListenableBuilder(
        valueListenable: controller,
        builder: (context, value, child) {
          if (value is DetailProductLoadedState) {
            return Container();
          }
          if (value is DetailProductErrorState) {
            return Container();
          }
          return const Center(
            child: CustomCircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
