import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../const/fonts.dart';
import '../const/image_assets.dart';
import '../controller/car_controller.dart';
import '../models/car.dart';
import '../widgets/custom_image_button.dart';

class DetailScreen extends StatefulWidget {
  final Car? car;

  const DetailScreen({super.key, this.car});

  @override
  State<StatefulWidget> createState() => _DetailScreen();
}

class _DetailScreen extends State<DetailScreen> {
  late TextEditingController nameController;
  late TextEditingController numberPlateController;
  late TextEditingController vehicleCategoryController;
  late TextEditingController driverNameController;
  late TextEditingController yearUsageController;
  late TextEditingController techStatusController;

  var nameFocus = FocusNode();
  var numberPlateFocus = FocusNode();
  var vehicleFocus = FocusNode();
  var driverNameFocus = FocusNode();
  var yearUsageFocus = FocusNode();
  var techStatusFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.car?.name);
    numberPlateController =
        TextEditingController(text: widget.car?.numberPlate);
    vehicleCategoryController =
        TextEditingController(text: widget.car?.vehicleCategory ?? "KAMAZ");
    driverNameController = TextEditingController(text: widget.car?.driverName);
    yearUsageController = TextEditingController(text: widget.car?.usageYear);
    techStatusController = TextEditingController(
        text: widget.car?.usageStatus ??
            "Tình trạng kỹ thuật tốt, bảo đảm cho thực hiện nhiệm vụ.");
    if (widget.car == null) nameFocus.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          clipBehavior: Clip.antiAlias,
          padding: const EdgeInsets.only(left: 16, right: 16),
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              const SizedBox(
                height: 32,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 16,
                  ),
                  ImageButton(
                      padding: 12,
                      image: ImageAssetsUtil.arrowBack,
                      onClick: () {
                        Navigator.of(context).pop();
                      }),
                  const Spacer(
                    flex: 1,
                  ),
                  Text(
                    widget.car == null ? 'Thêm Xe Mới' : 'Sửa Thông Tin Xe',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF222222),
                      fontSize: 16,
                      fontFamily: Fonts.sfProText,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.none,
                      height: 0,
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        width: 16,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                  labelText: 'Nhập Tên Xe',
                                  // Set border for enabled state (default)
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 3, color: Colors.blue),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  // Set border for focused state
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 3, color: Colors.green),
                                    borderRadius: BorderRadius.circular(15),
                                  )),
                              controller: nameController,
                              focusNode: nameFocus,
                              onSubmitted: (text) {
                                numberPlateFocus.requestFocus();
                              },
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: Fonts.sfProText,
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.none),
                              cursorColor: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                  labelText: 'Nhập Biển Số Xe',
                                  // Set border for enabled state (default)
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 3, color: Colors.blue),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  // Set border for focused state
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 3, color: Colors.green),
                                    borderRadius: BorderRadius.circular(15),
                                  )),
                              controller: numberPlateController,
                              focusNode: numberPlateFocus,
                              onSubmitted: (text) {
                                vehicleFocus.requestFocus();
                              },
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: Fonts.sfProText,
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.none),
                              cursorColor: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                  labelText: 'Nhập Chủng Loại Xe',
                                  // Set border for enabled state (default)
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 3, color: Colors.blue),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  // Set border for focused state
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 3, color: Colors.green),
                                    borderRadius: BorderRadius.circular(15),
                                  )),
                              controller: vehicleCategoryController,
                              focusNode: vehicleFocus,
                              onSubmitted: (text) {
                                driverNameFocus.requestFocus();
                              },
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: Fonts.sfProText,
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.none),
                              cursorColor: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                  labelText: 'Nhập Tên Lái Xe',
                                  // Set border for enabled state (default)
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 3, color: Colors.blue),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  // Set border for focused state
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 3, color: Colors.green),
                                    borderRadius: BorderRadius.circular(15),
                                  )),
                              controller: driverNameController,
                              focusNode: driverNameFocus,
                              onSubmitted: (text) {
                                yearUsageFocus.requestFocus();
                              },
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: Fonts.sfProText,
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.none),
                              cursorColor: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                  labelText: 'Nhập Năm Đưa Vào Sử Dụng',
                                  // Set border for enabled state (default)
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 3, color: Colors.blue),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  // Set border for focused state
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 3, color: Colors.green),
                                    borderRadius: BorderRadius.circular(15),
                                  )),
                              controller: yearUsageController,
                              focusNode: yearUsageFocus,
                              onSubmitted: (text) {
                                techStatusFocus.requestFocus();
                              },
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: Fonts.sfProText,
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.none),
                              cursorColor: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                  labelText: 'Nhập Trạng Thái Kỹ Thuật',
                                  // Set border for enabled state (default)
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 3, color: Colors.blue),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  // Set border for focused state
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 3, color: Colors.green),
                                    borderRadius: BorderRadius.circular(15),
                                  )),
                              controller: techStatusController,
                              focusNode: techStatusFocus,
                              maxLines: 3,
                              minLines: 1,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: Fonts.sfProText,
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.none),
                              cursorColor: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: () async {
                  var carController = Get.find<CarController>();
                  if (nameController.text.isEmpty) {
                    Get.snackbar("Dữ liệu thiếu", "Vui lòng nhập tên xe");
                    return;
                  }
                  if (numberPlateController.text.isEmpty) {
                    Get.snackbar("Dữ liệu thiếu", "Vui lòng nhập biển số xe");
                    return;
                  }
                  if (vehicleCategoryController.text.isEmpty) {
                    Get.snackbar("Dữ liệu thiếu", "Vui lòng nhập loại xe");
                    return;
                  }
                  if (driverNameController.text.isEmpty) {
                    Get.snackbar("Dữ liệu thiếu", "Vui lòng nhập tên lái xe");
                    return;
                  }
                  if (yearUsageController.text.isEmpty) {
                    Get.snackbar("Dữ liệu thiếu", "Vui lòng nhập năm sử dụng");
                    return;
                  }
                  if (techStatusController.text.isEmpty) {
                    Get.snackbar(
                        "Dữ liệu thiếu", "Vui lòng nhập tình trạng kỹ thuật");
                    return;
                  }
                  var status = widget.car == null
                      ? (await carController.addCar(
                          car: Car(
                              name: nameController.text,
                              numberPlate: numberPlateController.text,
                              vehicleCategory: vehicleCategoryController.text,
                              driverName: driverNameController.text,
                              usageYear: yearUsageController.text,
                              usageStatus: techStatusController.text,
                              currentStatus: false)))
                      : (await carController.updateCar(
                          car: Car(
                              id: widget.car?.id,
                              name: nameController.text,
                              numberPlate: numberPlateController.text,
                              vehicleCategory: vehicleCategoryController.text,
                              driverName: driverNameController.text,
                              usageYear: yearUsageController.text,
                              usageStatus: techStatusController.text,
                              currentStatus: false)));
                  Get.snackbar(
                      "Thông báo",
                      widget.car == null
                          ? status
                              ? "Thêm mới thành công."
                              : "Thêm mới thất bại."
                          : status
                              ? "Cập nhật thành công."
                              : "Cập nhật thất bại.");
                  setState(() {
                    if (status) {
                      var channel = Get.find<WebSocketChannel>();
                      channel.sink.add(
                          "Cập nhật xe ${nameController.text} - ${numberPlateController.text} vào hệ thống.");
                    }
                    Get.find<CarController>().getAllCar();
                    context.pop();
                  });
                },
                child: SizedBox(
                  width: 174,
                  height: 36,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 174,
                          height: 36,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF30B725),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 66,
                        top: 10,
                        child: Text(
                          'Đồng ý',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: Fonts.sfProText,
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
