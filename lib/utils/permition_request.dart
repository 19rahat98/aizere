import 'package:permission_handler/permission_handler.dart';

/// запрашивает разрешение
void requestPermission({
  required Permission permission,
  Function()? onGrantedPermission,
  Function()? onDeniedForever,
  Function()? onDenied,
  Function()? onFinish,
}) async {
  final status = await permission.request();

  if (status.isGranted) {
    onGrantedPermission?.call();
    onFinish?.call();
    return;
  }

  if (status.isPermanentlyDenied) {
    onDeniedForever?.call();
    onFinish?.call();
    return;
  }

  if (status.isDenied) {
    onDenied?.call();
    onFinish?.call();
    return;
  }
}
