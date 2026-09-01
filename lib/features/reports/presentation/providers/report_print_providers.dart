import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/services/report_print_service.dart';

final reportPrintServiceProvider = Provider<ReportPrintService>((ref) {
  return ReportPrintService();
});
