import 'package:car_manager/controller/car_controller.dart';
import 'package:car_manager/widgets/custom_image_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../const/fonts.dart';
import '../const/image_assets.dart';
import '../models/car.dart';
import '../routes/routes.dart';

class VehiclesScreen extends StatefulWidget {
  const VehiclesScreen({super.key});

  @override
  State<StatefulWidget> createState() => _VehiclesScreen();
}

class _VehiclesScreen extends State<VehiclesScreen> {
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
                    width: 40,
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  const Text(
                    'DANH SÁCH XE bVT',
                    textAlign: TextAlign.center,
                    style: TextStyle(
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
                  ImageButton(
                      padding: 12,
                      image: ImageAssetsUtil.icAdd,
                      onClick: () {
                        context.go("/${Routes.detail}");
                      }),
                  const SizedBox(
                    width: 16,
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(child: listVehicle(context)),
              const SizedBox(
                height: 16,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget listVehicle(BuildContext context) {
    return GetBuilder<CarController>(builder: (carController) {
      return carController.listCar.isNotEmpty
          ? ListView.builder(
              key: const PageStorageKey("item"),
              itemBuilder: (context, indexItem) {
                return itemVehicle(context, carController.listCar[indexItem]);
              },
              itemCount: carController.listCar.length)
          : Column(
              children: [
                const Spacer(
                  flex: 1,
                ),
                const Text(
                  'Chưa có xe nào trong danh sách',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF222222),
                    fontSize: 14,
                    fontFamily: Fonts.sfProText,
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                InkWell(
                  onTap: () {
                    context.go("/${Routes.detail}");
                  },
                  child: Container(
                      width: 174,
                      height: 36,
                      decoration: ShapeDecoration(
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Thêm Mới Ngay',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: Fonts.sfProText,
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      )),
                ),
                const Spacer(
                  flex: 1,
                )
              ],
            );
    });
  }

  Widget itemVehicle(BuildContext context, Car? car) {
    final MaterialStateProperty<Color?> trackColor =
        MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        // Track color when the switch is selected.
        if (states.contains(MaterialState.selected)) {
          return Colors.green;
        }
        // Otherwise return null to set default track color
        // for remaining states such as when the switch is
        // hovered, focused, or disabled.
        return null;
      },
    );
    final MaterialStateProperty<Color?> overlayColor =
        MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        // Material color when switch is selected.
        if (states.contains(MaterialState.selected)) {
          return Colors.green.withOpacity(0.54);
        }
        // Material color when switch is disabled.
        if (states.contains(MaterialState.disabled)) {
          return Colors.grey.shade400;
        }
        // Otherwise return null to set default material color
        // for remaining states such as when the switch is
        // hovered, or focused.
        return null;
      },
    );
    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xFFF5EDED),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      margin: const EdgeInsets.only(top: 4, bottom: 4),
      width: double.infinity,
      child: Row(
        children: [
          const SizedBox(
            width: 16,
          ),
          Text(
            car?.name ?? "",
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              decoration: TextDecoration.none,
              fontFamily: Fonts.sfProText,
              fontWeight: FontWeight.w700,
              height: 0,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            car?.numberPlate ?? "",
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF666666),
              fontSize: 14,
              decoration: TextDecoration.none,
              fontFamily: Fonts.sfProText,
              fontWeight: FontWeight.w700,
              height: 0,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Text(
              car?.driverName ?? "",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF666666),
                fontSize: 14,
                decoration: TextDecoration.none,
                fontFamily: Fonts.sfProText,
                fontWeight: FontWeight.w700,
                height: 0,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          SizedBox(
            height: 24,
            child: Switch(
              // This bool value toggles the switch.
              value: car?.currentStatus ?? false,
              overlayColor: overlayColor,
              trackColor: trackColor,
              thumbColor: const MaterialStatePropertyAll<Color>(Colors.black),
              onChanged: (bool value) async {
                // This is called when the user toggles the switch.
                setState(() {
                  car?.currentStatus = value;
                });
                if (car?.id != null) {
                  var status = await Get.find<CarController>()
                      .updateStatusCar(id: car?.id ?? 1, status: value);
                  if (status) {
                    Get.snackbar(
                        "Cập nhật Xe ${car?.name} do lái xe ${car?.driverName}",
                        value
                            ? "Đang thực hiện nhiệm vụ"
                            : "Đang chờ nhiệm vụ");
                    var channel = Get.find<WebSocketChannel>();
                    channel.sink.add(
                        "Xe ${car?.name} do lái xe ${car?.driverName} ${value
                            ? "đang thực hiện nhiệm vụ"
                            : "đang chờ nhiệm vụ"}");
                    setState(() {
                      car?.currentStatus = value;
                    });
                  } else {
                    Get.snackbar("Lỗi đã xảy ra", "Vui lòng thử lại sau.");
                    setState(() {
                      car?.currentStatus = !value;
                    });
                  }
                }
              },
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Container(
            height: 58,
            decoration: const ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignCenter,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Get.bottomSheet(
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0))),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Xe: ${car?.name} - Biển số: ${car?.numberPlate}\n\nLái xe: ${car?.driverName}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          decoration: TextDecoration.none,
                          fontFamily: Fonts.sfProText,
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignCenter,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Row(
                        children: [
                          const Spacer(
                            flex: 1,
                          ),
                          InkWell(
                            onTap: () async {
                              setState(() {
                                Get.back();
                              });
                              if (car?.id != null) {
                                var status = await Get.find<CarController>()
                                    .deleteCar(context, id: car?.id ?? 0);
                                if (status) {
                                  Get.snackbar(
                                      "Đã xoá ${car?.name}", "Thành công");
                                  Get.find<CarController>().getAllCar();
                                  var channel = Get.find<WebSocketChannel>();
                                  channel.sink.add(
                                      "Đã xoá ${car?.name} thành công");
                                } else {
                                  Get.snackbar(
                                      "Lỗi đã xảy ra", "Vui lòng thử lại sau.");
                                }
                              }
                            },
                            child: Container(
                                width: 174,
                                height: 36,
                                decoration: ShapeDecoration(
                                  color: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                child: const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Xoá',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: Fonts.sfProText,
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                )),
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                          InkWell(
                            onTap: () {
                              Get.back();
                              context.go("/${Routes.update}", extra: car);
                            },
                            child: Container(
                                width: 174,
                                height: 36,
                                decoration: ShapeDecoration(
                                  color: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                child: const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Sửa thông tin',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: Fonts.sfProText,
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                )),
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                        ],
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                    ],
                  ),
                ),
              );
            },
            child: const SizedBox(
              height: 58,
              child: Row(
                children: [
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    '...',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      decoration: TextDecoration.none,
                      fontFamily: Fonts.sfProText,
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
