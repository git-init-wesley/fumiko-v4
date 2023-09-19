library core_data;

import 'package:fumiko/core/core.dart';

class CoreData {
  final String _version;
  final Map<String, dynamic> _maintenanceCauses;
  final int _maintenanceEnd;

  String get version => _version;

  Map<String, dynamic> get maintenanceCauses => _maintenanceCauses;

  int get maintenanceEnd => _maintenanceEnd;

  CoreData(
      {required String version,
      Map<String, dynamic> maintenanceCauses = const {},
      required int maintenanceEnd})
      : _version = version,
        _maintenanceCauses = maintenanceCauses,
        _maintenanceEnd = maintenanceEnd;

  factory CoreData.fromJson(Map<String, dynamic> json) => CoreData(
      version: json['version'],
      maintenanceCauses: json['maintenanceCauses'],
      maintenanceEnd: json['maintenanceEnd']);

  Map<String, dynamic> toJson() => {
        'version': version,
        'maintenanceCauses': maintenanceCauses,
        'maintenanceEnd': maintenanceEnd
      };

  bool get isCurrentlyMaintenance =>
      _maintenanceEnd >= DateTime.now().millisecondsSinceEpoch;

  Future<bool> get isUpdateAvailable async =>
      Core.instance.packageInfo?.version != version;

  String getMaintenanceCauseFromLocale(String locale) =>
      maintenanceCauses.entries
          .firstWhere((element) => locale.contains(element.key),
              orElse: () => const MapEntry('N/A', 'N/A'))
          .value;
}
