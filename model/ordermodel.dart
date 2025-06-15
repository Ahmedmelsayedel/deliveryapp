class OrderModel {
  int? ordreId;
  int? ordrerUserid;
  int? orderPrice;
  String? paymentmethod;
  String? orderType;
  int? orderDeleveryprice;
  int? orderCoupon;
  String? orderData;
  int? orderAdress;
  int? orderTotal;
  int? orderStatus;
  int? orderRate;
  String? orderNote;
  int? userdeleverid;
  int? adressid;
  int? userId;
  String? city;
  String? street;

  OrderModel(
      {this.ordreId,
      this.ordrerUserid,
      this.orderPrice,
      this.paymentmethod,
      this.orderType,
      this.orderDeleveryprice,
      this.orderCoupon,
      this.orderData,
      this.orderAdress,
      this.orderTotal,
      this.orderStatus,
      this.orderRate,
      this.orderNote,
      this.userdeleverid,
      this.adressid,
      this.userId,
      this.city,
      this.street});

  OrderModel.fromJson(Map<String, dynamic> json) {
    ordreId = json['ordre_id'];
    ordrerUserid = json['ordrer_userid'];
    orderPrice = json['order_price'];
    paymentmethod = json['paymentmethod'];
    orderType = json['order_type'];
    orderDeleveryprice = json['order_deleveryprice'];
    orderCoupon = json['order_coupon'];
    orderData = json['order_data'];
    orderAdress = json['order_adress'];
    orderTotal = json['order_total'];
    orderStatus = json['order_status'];
    orderRate = json['order_rate'];
    orderNote = json['order_note'];
    userdeleverid = json['userdeleverid'];
    adressid = json['adressid'];
    userId = json['user_id'];
    city = json['city'];
    street = json['street'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ordre_id'] = this.ordreId;
    data['ordrer_userid'] = this.ordrerUserid;
    data['order_price'] = this.orderPrice;
    data['paymentmethod'] = this.paymentmethod;
    data['order_type'] = this.orderType;
    data['order_deleveryprice'] = this.orderDeleveryprice;
    data['order_coupon'] = this.orderCoupon;
    data['order_data'] = this.orderData;
    data['order_adress'] = this.orderAdress;
    data['order_total'] = this.orderTotal;
    data['order_status'] = this.orderStatus;
    data['order_rate'] = this.orderRate;
    data['order_note'] = this.orderNote;
    data['userdeleverid'] = this.userdeleverid;
    data['adressid'] = this.adressid;
    data['user_id'] = this.userId;
    data['city'] = this.city;
    data['street'] = this.street;
    return data;
  }
}