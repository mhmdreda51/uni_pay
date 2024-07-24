library uni_pay;

/// A library for making online payment by using Moyasar and Tamara payment gateway
/// Developed, published, and maintained by Mohammad Saiful Islam Saif
/// https://github.com/mohammadsaif19

/// Models used to process the payment
export 'src/core/models/transaction.dart';
export 'src/core/models/uni_credentials.dart';
export 'src/core/models/uni_order.dart';
export 'src/core/models/uni_pay_address.dart';
export 'src/core/models/uni_pay_customer.dart';
export 'src/core/models/uni_pay_data.dart';
export 'src/core/models/uni_pay_res.dart';
export 'src/core/models/uni_pay_item.dart';
export 'src/core/models/widget_data.dart';
export 'src/core/models/meta_data.dart';

/// Modules or payment gateways used to process the payment

// Tamara - Models
export 'src/modules/tamara/core/models/t_checkout.dart';
export 'src/modules/tamara/core/models/tamara_data.dart';
export 'src/modules/tamara/core/models/capture_order.dart';
export 'src/modules/tamara/core/models/capture_response.dart';

// Tamara - Services
export 'src/modules/tamara/core/services/uni_tamara.dart';

// Tamara - Views
export 'src/modules/tamara/views/tamara_pay_view.dart';
export 'src/modules/tamara/views/widget/tamara_split_widget.dart';

/// Controllers used to process the payment
export 'src/providers/uni_pay_provider.dart';

/// Utils - services, enums, and other utility files
export 'src/utils/uni_enums.dart';
// export 'src/utils/utils.dart';

/// Views - Main view to process the payment with different payment gateways
export 'src/views/uni_pay_view.dart';

/// Uni Apple Pay
export 'src/modules/applepay/uni_apple_pay.dart';

/// Constants files used for texts, colors, and other constants
// export 'src/constant/locale.dart';
// export 'src/constant/uni_text.dart';

// Keys
// export 'src/core/keys/api_keys.dart';

/// Core services used to process the payment
export 'src/core/services/uni_pay_services.dart';

// Tabby - Models
export 'src/modules/tabby/core/models/tabby_credentials.dart';
export 'src/modules/tabby/core/models/tabby_snippet.dart';

// Tabby - Views
export 'src/modules/tabby/views/tabby_pay_view.dart';
