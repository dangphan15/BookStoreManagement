package com.swp391.group3.utils;

public class AppConstants {

    public class DispatchFeatures {

        public static final String LOGIN_PAGE = "loginPage";

    }

    public class StartAppFeature {

        public static final String HOME_PAGE = "homePage";
    }

    public class SearchBookFeatures {

        public static final String SEARCH_PAGE = "searchPage";
    }

    public class ViewBookDetailFeature {

        public static final String VIEW_BOOK_DETAIL_PAGE = "viewBookPage";
        public static final String VIEW_BOOK_DETAIL_CONTROLLER = "viewBookDetailController";
    }

    public class AddToCartFeatures {

        public static final String VIEW_CART_PAGE = "viewCartPage";

    }

    public class RegistrationFeatures {

        public static final String REGISTRATION_PAGE = "registrationPage";
        public static final String LOGIN_PAGE = "loginPage";

    }

    public class LoginFeatures {

        public static final String LOGIN_PAGE = "loginPage";
        public static final String START_APP_CONTROLLER = "./";
        public static final String HOME_PAGE = "homePage";
        public static final String SALE_STAFF_PAGE = "salePage";
        public static final String INVENTORY_STAFF_PAGE = "InventoryBookAction";
        public static final String MANAGER_PAGE = "managerPage";
        public static final String START_SALE_STAFF = "viewAllOrderAction";

    }

    public class UserRoles {

        public static final int ADMIN = 1;
        public static final int SALE_STAFF = 2;
        public static final int INVENTORY_STAFF = 3;
        public static final int CUSTOMER = 4;
        // public static final int GUEST = 5;

    }

    public class LogOutFeatures {

        public static final String HOME_PAGE = "homePage";
        public static final String START_APP_CONTROLLER = "./";

    }

    public class AccountInforFeatures {

        public static final String UPDATE_INFOR_PAGE = "accountInfor";

    }

    public class UpdateInforFeatures {

        public static final String UPDATE_INFOR_PAGE = "accountInfor";
        public static final String USER_INFOR_PAGE = "userInformation";

    }

    public class UpdatePasswordFeatures {

        public static final String UPDATE_PASSWORD_PAGE = "updatePasswordPage";
        public static final String USER_INFOR_PAGE = "userInformation";

    }

    public class ViewOrderHistotyFeatures {

        public static final String ERROR_PAGE = "errorPage";
        public static final String ORDER_HISTORY_PAGE = "orderHistoryPage";
    }

    public class ViewOrderHistotyDetailFeatures {

        public static final String ERROR_PAGE = "errorPage";
        public static final String ORDER_DETAIL_PAGE = "orderDetailPage";
        public static final String VIEW_CART_PAGE = "viewCartPage";

    }

    public class OrderStatus {

        public static final String TO_CONFIRM = "To Confirm";
        public static final String TO_RECEIVE = "To Receive";
        public static final String TO_SHIP = "To Ship";
        public static final String COMPLETED = "Completed";
        public static final String CANCELLED = "Cancelled";
        public static final String RETURN_REFUND = "Return/Refund";
    }

    public class CheckoutFeatures {

        public static final String ERROR_PAGE = "errorPage";
        public static final String VIEW_CART_PAGE = "viewCartPage";
        public static final String PAYPAL_CHECKOUT = "paypalCheckoutAction";

    }

    public class PaypalCheckoutFeatures {

        public static final String ERROR_PAGE = "errorPage";

    }

    public class ReviewPaypalBillFeatures {

        public static final String REVIEW_PAGE = "reviewPage";
        public static final String ERROR_PAGE = "errorPage";

    }

    public class ExecutePaypalCheckoutFeatures {

        public static final String ERROR_PAGE = "errorPage";
        public static final String VIEW_CART_PAGE = "viewCartPage";

    }

    public class PaymentMethod {

        public static final String PAYPAL = "Paypal";
        public static final String COD = "COD";

    }

    public class PaymentService {

        public static final String CLIENT_ID = "AYura2hYL1BmDnhoPl6Fco3xC-dm1KtGIuYIFqKn7amJwJlKZomTpMb-j7FLKrx1bJxDHXaUbrGcCf7q";
        public static final String SECRET_KEY = "EJbR6KCFKx8W3GBUXW0-Ty8wohmlegXvo4Neft8vyzu0uETSf-_Tf2npalPHKS95DgOdRpcm4DRnyksA";
        public static final String MODE = "sandbox";
        public static final String TEST_EMAIL = "sb-s02t321081402@personal.example.com";

    }

    public class SignInWithGoogleFeatures {

        public static final String GOOGLE_CLIENT_ID = "1044236251299-peoeb56evfufdlt8cri6p48ds2u13a7f.apps.googleusercontent.com";
        public static final String GOOGLE_CLIENT_SECRET = "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";
        public static final String GOOGLE_REDIRECT_URI = "http://localhost:8084/BookStoreManagement/googleLoginAction";
        public static final String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";
        public static final String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";
        public static final String GOOGLE_GRANT_TYPE = "authorization_code";
        public static final String VERIFY_PHONE_NUMBER_PAGE = "verifyPhoneNumberPage";
    }

    public class CompletedOrderFeatures {

        public static final String COMPLETED_ORDER_PAGE = "completedOrderPage";

    }

    public class CancelledOrderFeatures {

        public static final String CANCELLED_ORDER_PAGE = "cancelledOrderPage";

    }

    public class ToConfirmOrderFeatures {

        public static final String VIEW_ORDERS_PAGE = "viewOrdersPage";
        public static final String VIEW_ORDER_DETAIL_CONTROLLER = "viewOrderDetailAction";
        public static final String VIEW_ORDER_DETAIL_PAGE = "orderDetailPage";
    }

    public class ToShipOrderFeatures {

        public static final String VIEW_ORDERS_PAGE = "viewOrdersPage";
        public static final String VIEW_ORDER_DETAIL_CONTROLLER = "viewOrderDetailAction";
        public static final String TO_SHIP_ORDER_CONTROLLER = "ToShipOrderAction";
        public static final String VIEW_ORDER_DETAIL_PAGE = "viewOrderDetailPage";
    }

    public class ToReceiveOrderFeatures {

        public static final String VIEW_ORDERS_PAGE = "viewOrdersPage";
        public static final String VIEW_ORDER_DETAIL_CONTROLLER = "viewOrderDetailAction";
    }

    public class ViewCancelOrderFeature {

        public static final String CANCEL_ORDER_PAGE = "cancelOrderPage";
    }

    public class ViewImportStatistcFeature {

        public static final String IMPORT_STATISTIC_PAGE = "importStatisticPage";
    }

    public class ReturnAndReFundFeatures {

        public static final String RETURN_AND_REFUND_ORDER_PAGE = "cancelledOrderPage";
    }

    public class ManageBookFeatures {

        public static final String INVENTORY_BOOK_PAGE = "inventoryBookPage";
        public static final String INVENTORY_BOOK_CONTROLLER = "InventoryBookAction";
    }

    public class ManagerFinancialStatisticsFeatures {

        public static final String FINANCIAL_STATISTICS_PAGE = "financialStatisticsPage";

    }

    public class GenderStatiisticFeatures {

        public static final String GENDER_STATISTIC_PAGE = "genderStatisticPage";
        public static final String GENDER_STATISTIC_CONTROLLER = "GenderStatisticAction";
    }
    public class BlogFeatures {

        public static final String VIEW_BLOG_PAGE = "viewBlogPage";
        public static final String VIEW_BLOG_CONTROLLER = "viewBlogAction";
        public static final String MANAGE_BLOGS_PAGE = "manageBlogsPage";
        public static final String VIEW_BLOGS_CONTROLLER = "viewBlogsAction";
    }

    public class ManageStaffFeatures {

        public static final String MANAGE_STAFF_PAGE = "manageStaffPage";
        public static final String STAFF_ORDER_PAGE = "staffOrderPage";
    }
}
