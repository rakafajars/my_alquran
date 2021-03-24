import 'package:bloc/bloc.dart';

class GlobalBlocObserver extends BlocObserver {
  // Pada method onEvent di muculkan ketika ada aksi event ke salah satu Bloc,
  // jadi untuk semua event di semua state management Bloc akan bisa dilihat disini.
  @override
  void onEvent(Bloc bloc, Object event) {
    print('onEvent $event');
    super.onEvent(bloc, event);
  }

  //Pada method onTransition dipanggil ketika ada perubahan state dari
  // Bloc lewat event trigger .add() dan di handle di mapEventToState pada Bloc.
  @override
  void onTransition(Bloc bloc, Transition transition) {
    print('onTransition $transition');
    super.onTransition(bloc, transition);
  }

  // Pada method onChange ketika ada perubahan state pada StateManagement Cubit.
  @override
  void onChange(Cubit cubit, Change change) {
    print('onChange ${cubit.runtimeType}'
        'From: ${change?.currentState}'
        'To: ${change.nextState}');
    super.onChange(cubit, change);
  }
  // Method ini dipanggil ketika Cubit telah di close
  // atau dispose oleh sistem atau juga user. Misal jika user
  // pindah halaman dengan replace halaman sebelumnya dengan Provider
  // pada halaman yang di replace, maka method onClose ini dijalankan.
  @override
  void onClose(Cubit cubit) {
    print('Close ${cubit.runtimeType}');
    super.onClose(cubit);
  }

  // Pada method onCreate ini, dimana State Management Bloc ataupun Cubit di
  // Flutter dibuat/di inisialisasikan saat pertama kalinya.
  @override
  void onCreate(Cubit cubit) {
    print('Create ${cubit.runtimeType}');
    super.onCreate(cubit);
  }

  // Method ini dipanggil ketika terjadi error pada salah satu state management di Bloc
  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    print('Error in : ${cubit.runtimeType}'
        'Error: $error'
        'StackTrace: $stackTrace');
    super.onError(cubit, error, stackTrace);
  }
}
