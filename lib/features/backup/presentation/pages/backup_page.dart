import 'dart:io';

import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../shared/presentation/widgets/app_section_card.dart';
import '../../../employees/employees.dart';
import '../providers/backup_providers.dart';

class BackupPage extends ConsumerStatefulWidget {
  const BackupPage({super.key});

  @override
  ConsumerState<BackupPage> createState() => _BackupPageState();
}

class _BackupPageState extends ConsumerState<BackupPage> {
  bool _isBackingUp = false;
  bool _isRestoring = false;
  bool _isExporting = false;
  bool _isImporting = false;

  Future<void> _createBackup() async {
    setState(() => _isBackingUp = true);
    try {
      final location = await getSaveLocation(
        suggestedName: 'employee_system_backup_${_timestamp()}.isar',
        acceptedTypeGroups: const [
          XTypeGroup(label: 'Isar Database', extensions: ['isar']),
        ],
      );
      if (location == null) {
        return;
      }

      await ref.read(backupServiceProvider).createBackup(location.path);

      if (mounted) {
        _showMessage('تم إنشاء النسخة الاحتياطية بنجاح.');
      }
    } catch (error) {
      if (mounted) {
        _showMessage('تعذر إنشاء النسخة الاحتياطية: $error');
      }
    } finally {
      if (mounted) {
        setState(() => _isBackingUp = false);
      }
    }
  }

  Future<void> _restoreBackup() async {
    const typeGroup = XTypeGroup(
      label: 'Isar Database',
      extensions: ['isar'],
    );
    final file = await openFile(acceptedTypeGroups: [typeGroup]);
    if (file == null || !mounted) {
      return;
    }

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('تأكيد الاستعادة'),
        content: const Text(
          'سيتم استبدال جميع بيانات النظام الحالية على هذا الجهاز ببيانات '
          'النسخة الاحتياطية المختارة، وسيُطلب منك إعادة تشغيل البرنامج بعد '
          'الانتهاء. هل تريد المتابعة؟',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('إلغاء'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: const Text('استعادة'),
          ),
        ],
      ),
    );
    if (confirmed != true || !mounted) {
      return;
    }

    setState(() => _isRestoring = true);
    try {
      await ref.read(backupServiceProvider).restoreBackup(file.path);

      if (mounted) {
        await showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (dialogContext) => AlertDialog(
            title: const Text('تمت الاستعادة'),
            content: const Text(
              'تم استعادة النسخة الاحتياطية بنجاح. الرجاء إغلاق البرنامج '
              'وإعادة تشغيله الآن لتطبيق التغييرات.',
            ),
            actions: [
              FilledButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                child: const Text('حسناً'),
              ),
            ],
          ),
        );
      }
    } catch (error) {
      if (mounted) {
        _showMessage('تعذرت عملية الاستعادة: $error');
      }
    } finally {
      if (mounted) {
        setState(() => _isRestoring = false);
      }
    }
  }

  Future<void> _exportEmployees() async {
    setState(() => _isExporting = true);
    try {
      final employees = await ref.read(employeeServiceProvider).getEmployees();
      final json = await ref
          .read(employeeTransferServiceProvider)
          .exportToJson(employees);

      final location = await getSaveLocation(
        suggestedName: 'employees_export_${_timestamp()}.json',
        acceptedTypeGroups: const [
          XTypeGroup(label: 'JSON', extensions: ['json']),
        ],
      );
      if (location == null) {
        return;
      }

      await File(location.path).writeAsString(json);

      if (mounted) {
        _showMessage('تم تصدير ${employees.length} موظف بنجاح.');
      }
    } catch (error) {
      if (mounted) {
        _showMessage('تعذر التصدير: $error');
      }
    } finally {
      if (mounted) {
        setState(() => _isExporting = false);
      }
    }
  }

  Future<void> _importEmployees() async {
    const typeGroup = XTypeGroup(label: 'JSON', extensions: ['json']);
    final file = await openFile(acceptedTypeGroups: [typeGroup]);
    if (file == null || !mounted) {
      return;
    }

    setState(() => _isImporting = true);
    try {
      final content = await file.readAsString();
      final summary = await ref
          .read(employeeTransferServiceProvider)
          .importFromJson(content, ref.read(employeeServiceProvider));

      if (mounted) {
        await showDialog<void>(
          context: context,
          builder: (dialogContext) => AlertDialog(
            title: const Text('نتيجة الاستيراد'),
            content: Text(
              'تمت إضافة ${summary.added} موظف جديد.\n'
              'تم تحديث ${summary.updated} موظف ببيانات أحدث.\n'
              'تم تجاهل ${summary.skipped} موظف (البيانات المحلية أحدث أو مطابقة).'
              '${summary.failed > 0 ? '\nتعذرت معالجة ${summary.failed} سجل.' : ''}',
            ),
            actions: [
              FilledButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                child: const Text('حسناً'),
              ),
            ],
          ),
        );
      }
    } catch (error) {
      if (mounted) {
        _showMessage('تعذر الاستيراد: $error');
      }
    } finally {
      if (mounted) {
        setState(() => _isImporting = false);
      }
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  String _timestamp() {
    final now = DateTime.now();
    String two(int value) => value.toString().padLeft(2, '0');
    return '${now.year}${two(now.month)}${two(now.day)}_${two(now.hour)}${two(now.minute)}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          AppSectionCard(
            title: 'النسخ الاحتياطي والاستعادة',
            subtitle:
                'نسخ احتياطي كامل لبيانات النظام على هذا الجهاز (الموظفين، '
                'المؤسسة، والمستخدمين). لا يشمل ملفات الصور المرفقة. '
                'يُنصح بأخذ نسخة احتياطية دورياً وحفظها في مكان آمن خارج الجهاز.',
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                FilledButton.icon(
                  onPressed: _isBackingUp ? null : _createBackup,
                  icon: const Icon(Icons.backup_outlined),
                  label: Text(
                    _isBackingUp ? 'جارٍ الإنشاء...' : 'إنشاء نسخة احتياطية',
                  ),
                ),
                OutlinedButton.icon(
                  onPressed: _isRestoring ? null : _restoreBackup,
                  icon: const Icon(Icons.restore_outlined),
                  label: Text(
                    _isRestoring
                        ? 'جارٍ الاستعادة...'
                        : 'استعادة من نسخة احتياطية',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          AppSectionCard(
            title: 'تصدير بيانات الموظفين',
            subtitle:
                'تصدير جميع بيانات الموظفين مع صورهم إلى ملف واحد قابل للنقل '
                'إلى جهاز آخر (عبر USB أو مشاركة الملفات).',
            child: FilledButton.icon(
              onPressed: _isExporting ? null : _exportEmployees,
              icon: const Icon(Icons.upload_file_outlined),
              label: Text(_isExporting ? 'جارٍ التصدير...' : 'تصدير إلى ملف'),
            ),
          ),
          const SizedBox(height: 18),
          AppSectionCard(
            title: 'استيراد بيانات الموظفين',
            subtitle:
                'استيراد ملف موظفين مُصدَّر من جهاز آخر ودمجه مع البيانات '
                'الحالية. عند تطابق الرقم الوطني: يُحدَّث السجل المحلي فقط إذا '
                'كانت بيانات الملف المستورد أحدث تعديلاً، وإلا يُتجاهل مع '
                'الاحتفاظ بالبيانات المحلية كما هي.',
            child: OutlinedButton.icon(
              onPressed: _isImporting ? null : _importEmployees,
              icon: const Icon(Icons.download_outlined),
              label: Text(_isImporting ? 'جارٍ الاستيراد...' : 'استيراد من ملف'),
            ),
          ),
        ],
      ),
    );
  }
}
