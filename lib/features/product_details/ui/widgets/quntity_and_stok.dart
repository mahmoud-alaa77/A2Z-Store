import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_store/core/theming/app_colors.dart';
import 'package:online_store/core/theming/app_text_styles.dart';
import 'package:online_store/features/cart/logic/cubit/cart_cubit.dart';
import 'package:toast/toast.dart';

import '../../../../core/helpers/spacing.dart';

class QuntityAndStok extends StatelessWidget {
  final int stok;
  const QuntityAndStok({super.key, required this.stok});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Row(
          children: [
            Text(
              "Avaliable quntity in stok ( $stok )",
              style: AppTextStyles.font14BlueW700
                  .copyWith(color: AppColors.mainBlack),
            ),
            horizontalSpace(16),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(8),
                    color: AppColors.lighterGray),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      iconSize: 22.w,
                      onPressed: () {
                        1 <= context.read<CartCubit>().quntity
                            ? context.read<CartCubit>().minusOne()
                            : const SizedBox.shrink();
                      },
                    ),
                    Text(
                      '${context.read<CartCubit>().quntity}',
                      style: AppTextStyles.font16BlackW400,
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      iconSize: 22.w,
                      onPressed: () {
                        stok > context.read<CartCubit>().quntity
                            ? context.read<CartCubit>().addOne()
                            : Toast.show("Quantity is not available",
                                duration: Toast.lengthShort,
                                gravity: Toast.bottom);
                      },
                    )
                  ],
                )),
          ],
        );
      },
    );
  }
}
