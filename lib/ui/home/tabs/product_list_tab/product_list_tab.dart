import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/di.dart';
import 'package:flutter_e_commerce_c10_sun3/ui/home/tabs/product_list_tab/cubit/product_list_states.dart';
import 'package:flutter_e_commerce_c10_sun3/ui/home/tabs/product_list_tab/cubit/product_list_tab_view_model.dart';
import '../../../utils/my_assets.dart';
import '../../../utils/my_colors.dart';
import '../../product_details/product_details_view.dart';
import '../home_tab/widgets/custom_text_field.dart';
import 'widgets/grid_view_card_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductListTab extends StatelessWidget {
  ProductListTabViewModel viewModel = ProductListTabViewModel(
      productsUseCase: injectGetAllProductsUseCase());
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductListTabViewModel,ProductListStates>(
      bloc: viewModel..getAllProducts(),
      builder: (context,state){
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.w),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Image.asset(
                    MyAssets.logo,
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  Row(children: [
                    Expanded(
                      child: CustomTextField(),
                    ),
                    SizedBox(
                      width: 24.w,
                    ),
                    ImageIcon(
                      AssetImage(MyAssets.shoppingCart),
                      size: 28.sp,
                      color: AppColors.primaryColor,
                    ),
                  ]),
                  SizedBox(
                    height: 24.h,
                  ),
                  state is ProductListLoadingState?
                      const Center(
                        child: CircularProgressIndicator(
                        color: AppColors.primaryColor),
                      ):
                      Text(viewModel.productsList.length.toString())
                  // Expanded(
                  //   child: GridView.builder(
                  //     itemCount: 10,
                  //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //         crossAxisCount: 2,
                  //         childAspectRatio: 2 / 2.4,
                  //         crossAxisSpacing: 16.w,
                  //         mainAxisSpacing: 16.h),
                  //     itemBuilder: (context, index) {
                  //       return InkWell(
                  //         splashColor: Colors.transparent,
                  //         hoverColor: Colors.transparent,
                  //         highlightColor: Colors.transparent,
                  //         onTap: () {
                  //           Navigator.of(context).pushNamed(
                  //             ProductDetailsView.routeName,
                  //           );
                  //         },
                  //         child: GridViewCardItem(),
                  //       );
                  //     },
                  //   ),
                  // )
                ]),
          ),
        );
      },
    );
  }
}
