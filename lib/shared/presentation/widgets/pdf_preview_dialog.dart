import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

typedef PdfDocumentBuilder = Future<Uint8List> Function(PdfPageFormat format);

Future<void> showPdfPrintPreviewDialog({
  required BuildContext context,
  required String title,
  required String fileName,
  required PdfDocumentBuilder buildDocument,
}) {
  return showDialog<void>(
    context: context,
    builder: (dialogContext) {
      return _PdfPreviewDialog(
        title: title,
        fileName: fileName,
        buildDocument: buildDocument,
      );
    },
  );
}

class _PdfPreviewDialog extends StatelessWidget {
  const _PdfPreviewDialog({
    required this.title,
    required this.fileName,
    required this.buildDocument,
  });

  final String title;
  final String fileName;
  final PdfDocumentBuilder buildDocument;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(24),
      child: SizedBox(
        width: 1120,
        height: 820,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(
                      context,
                    ).dividerColor.withValues(alpha: 0.4),
                  ),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close_rounded),
                    tooltip: 'إغلاق المعاينة',
                  ),
                ],
              ),
            ),
            Expanded(
              child: PdfPreview(
                build: buildDocument,
                pdfFileName: fileName,
                allowPrinting: true,
                allowSharing: false,
                canChangePageFormat: false,
                canChangeOrientation: false,
                canDebug: false,
                maxPageWidth: 700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
