import 'package:employee_system/features/employees/employees.dart';
import 'package:employee_system/features/organization/organization.dart';

List<EmployeeModel> buildSampleEmployees() {
  return [
    EmployeeModel()
      ..fullName = 'أحمد كريم عبدالله'
      ..gender = Gender.male
      ..birthDate = DateTime(1990, 3, 14)
      ..birthPlace = 'بغداد'
      ..maritalStatus = MaritalStatus.married
      ..phoneNumber = '07701234567'
      ..educationLevel = EducationLevel.bachelor
      ..address = 'بغداد - الكرادة'
      ..nationalNumber = '19900314001'
      ..nationalCardNumber = 'NC-0001'
      ..housingCardNumber = 'HC-0001'
      ..documentsIssueDate = DateTime(2015, 6, 1)
      ..documentsIssueAuthority = 'مديرية الأحوال المدنية - بغداد'
      ..employeeNumber = 'EMP-1001'
      ..jobTitle = 'محاسب'
      ..currentWorkplace = 'قسم الحسابات'
      ..previousWorkplace = 'قسم المخازن'
      ..jobNotes = 'يعمل بدوام كامل'
      ..generalNotes = '',
    EmployeeModel()
      ..fullName = 'زينب علي حسين'
      ..gender = Gender.female
      ..birthDate = DateTime(1995, 7, 22)
      ..birthPlace = 'البصرة'
      ..maritalStatus = MaritalStatus.single
      ..phoneNumber = '07709876543'
      ..educationLevel = EducationLevel.master
      ..address = 'البصرة - العشار'
      ..nationalNumber = '19950722002'
      ..nationalCardNumber = 'NC-0002'
      ..housingCardNumber = 'HC-0002'
      ..documentsIssueDate = DateTime(2018, 2, 10)
      ..documentsIssueAuthority = 'مديرية الأحوال المدنية - البصرة'
      ..employeeNumber = 'EMP-1002'
      ..jobTitle = 'مهندسة برمجيات'
      ..currentWorkplace = 'قسم تقنية المعلومات'
      ..previousWorkplace = ''
      ..jobNotes = ''
      ..generalNotes = 'حاصلة على شهادة تقدير',
    EmployeeModel()
      ..fullName = 'محمد جاسم محمود'
      ..gender = Gender.male
      ..birthDate = DateTime(1985, 11, 2)
      ..birthPlace = 'الموصل'
      ..maritalStatus = MaritalStatus.divorced
      ..phoneNumber = '07715558899'
      ..educationLevel = EducationLevel.diploma
      ..address = 'الموصل - الدواسة'
      ..nationalNumber = '19851102003'
      ..nationalCardNumber = 'NC-0003'
      ..housingCardNumber = 'HC-0003'
      ..documentsIssueDate = DateTime(2012, 9, 5)
      ..documentsIssueAuthority = 'مديرية الأحوال المدنية - نينوى'
      ..employeeNumber = 'EMP-1003'
      ..jobTitle = 'فني صيانة'
      ..currentWorkplace = 'قسم الصيانة'
      ..previousWorkplace = 'قسم النقل'
      ..jobNotes = ''
      ..generalNotes = '',
    EmployeeModel()
      ..fullName = 'سارة عبدالرزاق ياسين'
      ..gender = Gender.female
      ..birthDate = DateTime(2000, 1, 30)
      ..birthPlace = 'أربيل'
      ..maritalStatus = MaritalStatus.widowed
      ..phoneNumber = '07733221100'
      ..educationLevel = EducationLevel.secondary
      ..address = 'أربيل - المركز'
      ..nationalNumber = '20000130004'
      ..nationalCardNumber = 'NC-0004'
      ..housingCardNumber = 'HC-0004'
      ..documentsIssueDate = DateTime(2020, 4, 18)
      ..documentsIssueAuthority = 'مديرية الأحوال المدنية - أربيل'
      ..employeeNumber = 'EMP-1004'
      ..jobTitle = 'موظفة استعلامات'
      ..currentWorkplace = 'قسم العلاقات العامة'
      ..previousWorkplace = ''
      ..jobNotes = ''
      ..generalNotes = '',
  ];
}

OrganizationInfoModel buildSampleOrganizationInfo() {
  return OrganizationInfoModel()
    ..ministryName = 'وزارة النموذج'
    ..organizationName = 'دائرة نظام إدارة الموظفين'
    ..branchName = 'الفرع الرئيسي'
    ..departmentName = 'قسم الموارد البشرية'
    ..address = 'بغداد - المنطقة الحكومية'
    ..phoneNumber = '07800000000'
    ..email = 'info@example-ministry.gov.iq'
    ..reportsFooter = 'هذا المستند صادر آلياً من نظام إدارة بيانات الموظفين.';
}
