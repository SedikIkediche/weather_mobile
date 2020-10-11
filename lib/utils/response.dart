import 'status.dart';

class Response<T> {
  Status status;
  T data;
  String message;

  Response.locationServiceLoading(this.message)
      : status = Status.LOCATIONSERVICELOADING;
  Response.permissionError(this.message) : status = Status.PERMISSIONERROR;
  Response.locationServiceError(this.message)
      : status = Status.LOCATIONSERVICEERROR;
  Response.locationError(this.message) : status = Status.LOCATIONERROR;
  Response.netWorkLoading(this.message) : status = Status.NETWORKLOADING;
  Response.netWorkError(this.message) : status = Status.NETWORKERROR;
  Response.completed(this.data) : status = Status.COMPLETED;
}
