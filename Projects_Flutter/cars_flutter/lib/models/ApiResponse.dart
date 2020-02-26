class ApiResponse<T>{
  bool ok;
  String msg;
  T result;

  ApiResponse.ok(this.result){//Coloco o response da API na variável result, e seto true para ok
    this.ok = true;
  }

  ApiResponse.error(this.msg){//Coloco a mesagem da API na variável msg, e seto false para ok
    this.ok = false;
  }
}