import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/admin/add_update_product_controller.dart';
import 'package:myapp/utils/my_definition.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class AddOrUpdateProductPage extends GetView<AddOrUpdateProductController> {
  const AddOrUpdateProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios),
            color: MyDefinition.SECONDARY_COLOR_2,
          ),
          title: Align(
            child: Text(controller.product_id != null
                ? 'Cập nhật sản phẩm'
                : 'Thêm sản phẩm'),
          ),
          actions: [
            IconButton(
              onPressed: () => controller.addProduct(),
              icon: const Icon(Icons.save_as),
              color: MyDefinition.SECONDARY_COLOR_2,
            ),
            const SizedBox(
              width: 16,
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: controller.nameController,
                decoration: const InputDecoration(labelText: 'Tên sản phẩm'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: controller.priceController,
                decoration: const InputDecoration(labelText: 'Giá'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: controller.quantityController,
                decoration: const InputDecoration(labelText: 'Số lượng'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: controller.descriptionController,
                decoration: const InputDecoration(labelText: 'Mô tả'),
                maxLines: 3,
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: controller.pickImages,
                child: const Icon(
                  Icons.add_photo_alternate,
                  color: Colors.blue,
                  size: 100,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Obx(() {
                  return controller.imageFileList.isNotEmpty
                      ? GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 4.0,
                            mainAxisSpacing: 4.0,
                          ),
                          itemCount: controller.imageFileList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Stack(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.to(() =>
                                        ImageViewerPage(initialIndex: index));
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(
                                                0.5), // Màu đậm hơn
                                            spreadRadius: 5, // Giá trị lớn hơn
                                            blurRadius: 10, // Giá trị lớn hơn
                                            offset: const Offset(
                                                0, 4), // Offset rõ hơn
                                          ),
                                        ],
                                      ),
                                      child: Image.file(
                                        File(controller
                                            .imageFileList[index].path),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 4,
                                  right: 4,
                                  child: GestureDetector(
                                    onTap: () {
                                      controller.imageFileList.removeAt(index);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.8),
                                            spreadRadius: 2,
                                            blurRadius: 4,
                                            offset: const Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: const Icon(
                                        Icons.close,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        )
                      : const SizedBox.shrink();
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageViewerPage extends StatelessWidget {
  final int initialIndex;
  final AddOrUpdateProductController controller = Get.find();

  ImageViewerPage({super.key, required this.initialIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Xem Ảnh'),
      ),
      body: PhotoViewGallery.builder(
        itemCount: controller.imageFileList.length,
        builder: (context, index) {
          return PhotoViewGalleryPageOptions(
            imageProvider:
                FileImage(File(controller.imageFileList[index].path)),
            minScale: PhotoViewComputedScale.contained * 0.8,
            maxScale: PhotoViewComputedScale.covered * 2,
          );
        },
        pageController: PageController(initialPage: initialIndex),
        scrollPhysics: const BouncingScrollPhysics(),
        backgroundDecoration: const BoxDecoration(
          color: Colors.black,
        ),
      ),
    );
  }
}
