// ------------ APP PARAMETER - DO NOT CHANGE -------------//
String didLogoutNotification = 'didLogoutNotification';
const int ApiTimeoutCode = -1001;
const int ApiResponseWithoutCode = -1;
const int ApiUnknownErrorCode = -1002;

// ------------ CHANGE IF NEED -------------//
const Host = 'https://mcs.cloud273.com/app';
const ApiUrl = "$Host/api/";
const ImageUrl = "$Host/image/";
const ResourceUrl = "$Host/resource/";

const AboutUsUrl = "$Host/support/clinic/about.html";
const FaqUrl = "$Host/support/clinic/faq.html";
const TermUrl = "$Host/support/clinic/term_condition.html";
const ContactUrl = "$Host/support/clinic/contact.html";

const int defaultCreatableEnd = 3600 * (-18);
const int defaultAcceptableEnd = 3600 * (-6);
const int DefaultCancelableEnd = 3600 * (-6);
const int DefaultRejectableEnd = 3600 * (-6);
const int DefaultBeginableFrom = 3600 * (-6);
const int DefaultBeginableEnd = 3600 * (12);
const int DefaultFinishableEnd = 3600 * (12);
