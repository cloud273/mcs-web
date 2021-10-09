// ------------ APP PARAMETER - DO NOT CHANGE -------------//
String didLogoutNotification = 'didLogoutNotification';
const int ApiTimeoutCode = -1001;
const int ApiResponseWithoutCode = -1;
const int ApiUnknownErrorCode = -1002;

// ------------ CHANGE IF NEED -------------//
const Host = 'https://cloud273.com';
const ApiUrl = "$Host/mcs/api/";
const ImageUrl = "$Host/mcs/image/";
const ResourceUrl = "$Host/mcs/resource/";

const AboutUsUrl = "$Host/mcs/support/patient/about.html";
const FaqUrl = "$Host/mcs/support/patient/faq.html";
const TermUrl = "$Host/mcs/support/patient/termcondition.html";
const ContactUrl = "$Host/mcs/support/patient/contact.html";

const int DefaultCreatableEnd = 3600 * (-18);
const int DefaultAcceptableEnd = 3600 * (-6);
const int DefaultCancelableEnd = 3600 * (-6);
const int DefaultRejectableEnd = 3600 * (-6);
const int DefaultBeginableFrom = 3600 * (-6);
const int DefaultBeginableEnd = 3600 * (12);
const int DefaultFinishableEnd = 3600 * (12);
