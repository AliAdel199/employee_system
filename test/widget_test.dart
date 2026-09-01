import 'package:employee_system/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('يعرض الشاشة التمهيدية للمشروع', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: EmployeeSystemApp()));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 200));

    expect(find.text('لوحة التحكم'), findsAtLeastNWidgets(1));
    expect(find.text('المرحلة الحالية: إنشاء الطباعة وPDF'), findsOneWidget);
  });
}
