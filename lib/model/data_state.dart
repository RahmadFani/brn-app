/*--------------------------------------------------------------------------
* Author Supriyadi
*
* Model digunakan sebagai flag suatu state
* apakah sedang dalam state idle, loading, loadSuccess, loadError
*
* */

abstract class DataState {}

class DataStateIdle extends DataState {}

class DataStateLoading extends DataState {}

class DataStateSuccess<T> extends DataState {
  T data;
  DataStateSuccess({this.data});
}

class DataStateError extends DataState {
  String errorMessage = "Terjadi kesalahan";
  DataStateError({this.errorMessage});
}
