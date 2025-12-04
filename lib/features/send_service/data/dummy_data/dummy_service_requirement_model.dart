import 'package:citizen_service_platform/features/send_service/data/model/service_requirement_model.dart';

ServiceRequirementModel dummyServiceRequirementModel = ServiceRequirementModel(
  id: '1',
  title: 'اصدار ترخيص بناء',
  description: serviceDescription,
  requiredDocuments: requiredDocuments,
  applicationSteps: applicationSteps,
  filesRequired: filesRequired,
);
String serviceDescription = """
تتيح هذه الخدمة للمواطنين والمقيمين تقديم طلب استخراج التراخيص الصادرة بسهولة عبر المنصة سواء كانت تراخيص مهنية، تجارية، أو شخصية. تهدف الخدمة إلى تبسيط الإجراءات تقليل أوقات الانتظار، وتمكين المستفيد من متابعة حالة الطلب بشكل لحظي حتى إصدار الترخيص النهائي.
""";
List<String> requiredDocuments = [
  "صورة بطاقة الرقم القومي لصاحب الترخيص.",
  "مستند إثبات الملكية: عقد مشهر أو عقد تخصيص أو عقد انتفاع.",
  "شهادة صلاحية موقع صادرة من الجهة المختصة.",
  "رسومات هندسية معتمدة للبناء من الجهة المختصة.",
  "توكيل رسمي للمندوب أو المكتب الهندسي المعتمد للسرعة في إجراءات الترخيص.",
  "الرسومات الهندسية.",
];

String applicationSteps = """
- تسجيل الدخول على المنصة باستخدام الهوية الرقمية.
- اختيار “خدمة استخراج الترخيص” من قائمة الخدمات.
- إدخال بيانات المستفيد وبيانات الموقع.
- رفع المستندات المطلوبة بصيغة PDF أو صورة.
- سداد الرسوم المقررة.
- إرسال الطلب ومتابعة حالة الطلب من خلال لوحة التحكم.
- استلام الترخيص عند صدور الموافقة النهائية.
""";

List<String> filesRequired = [
  "صورة بطاقة الرقم القومى",
  "مستند اثبات ملكية",
  "توكيل رسمي للمهندس",
  "الرسومات الهندسية",
];
