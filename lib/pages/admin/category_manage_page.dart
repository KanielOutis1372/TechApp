import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/admin/category_manage_controller.dart';

import '../../models/category.dart';
import '../../utils/my_definition.dart';

class CategoryManagePage extends GetView<CategoryManageController> {
  const CategoryManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: MyDefinition.SECONDARY_COLOR_2,
            onPressed: () => Get.back(),
          ),
          title: const Align(child: Text('Quản lý danh mục')),
          actions: [
            // IconButton(
            //   icon: const Icon(Icons.search),
            //   onPressed: () {
            //     // Xử lý khi người dùng bấm nút tìm kiếm
            //   },
            // ),
            IconButton(
              icon: const Icon(Icons.add),
              color: MyDefinition.SECONDARY_COLOR_2,
              onPressed: () {
                _showAddCategoryDialog(context, controller);
              },
            ),
          ],
        ),
        body: Obx(() => controller.isLoadingCate.value
            ? const Align(
                alignment: Alignment.center,
                child: LinearProgressIndicator(),
              )
            : const CategoryListView()),
      ),
    );
  }

  void _showAddCategoryDialog(
      BuildContext context, CategoryManageController controller) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Thêm danh mục'),
          content: TextField(
            decoration: const InputDecoration(labelText: 'Tên danh mục'),
            controller: controller.txtController,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Hủy'),
            ),
            TextButton(
              onPressed: () {
                // Xử lý khi người dùng bấm nút thêm
                controller.AddCate();
                Navigator.of(context).pop();
              },
              child: const Text('Thêm'),
            ),
          ],
        );
      },
    );
  }
}

class CategoryListView extends GetView<CategoryManageController> {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.categories.isEmpty
          ? const Align(
              child: Text('Không có dữ liệu'),
            )
          : ListView.builder(
              itemCount: controller.categories.length,
              itemBuilder: (context, index) {
                final category = controller.categories[index];
                return ListTile(
                  title: Text(category.name),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        color: MyDefinition.SECONDARY_COLOR_2,
                        onPressed: () {
                          _showEditCategoryDialog(context, category);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        color: MyDefinition.SECONDARY_COLOR_2,
                        onPressed: () {
                          _showDeleteConfirmationDialog(context, category.id);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }

  void _showEditCategoryDialog(BuildContext context, Category category) {
    final TextEditingController textController =
        TextEditingController(text: category.name);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sửa danh mục'),
          content: TextField(
            decoration: const InputDecoration(labelText: 'Tên danh mục'),
            controller: textController,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Hủy'),
            ),
            TextButton(
              onPressed: () {
                // Xử lý khi người dùng bấm nút lưu
                String updatedName = textController.text;
                controller.updateCategory(category.id, updatedName);
                Navigator.of(context).pop();
              },
              child: const Text('Lưu'),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, int id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Xác nhận xóa'),
          content: const Text('Bạn có chắc chắn muốn xóa danh mục này?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Hủy'),
            ),
            TextButton(
              onPressed: () {
                // Xử lý khi người dùng xác nhận xóa
                controller.DeleteCate(id);
                Navigator.of(context).pop();
              },
              child: const Text('Xóa'),
            ),
          ],
        );
      },
    );
  }
}
