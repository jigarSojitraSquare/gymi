// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:gymi/core/di/Injectable.dart' as _i9;
import 'package:gymi/core/interceptors/combining_smart_interceptor.dart' as _i7;
import 'package:gymi/core/interceptors/network_auth_interceptor.dart' as _i3;
import 'package:gymi/core/interceptors/network_error_interceptor.dart' as _i4;
import 'package:gymi/core/interceptors/network_log_interceptor.dart' as _i5;
import 'package:gymi/core/interceptors/network_refresh_interceptor.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt $initGetIt({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i3.NetworkAuthInterceptor>(
        () => _i3.NetworkAuthInterceptor());
    gh.singleton<_i4.NetworkErrorInterceptor>(
        () => _i4.NetworkErrorInterceptor());
    gh.singleton<_i5.NetworkLogInterceptor>(() => _i5.NetworkLogInterceptor());
    gh.singleton<_i6.NetworkRefreshInterceptor>(
        () => _i6.NetworkRefreshInterceptor());
    gh.singleton<_i7.CombiningSmartInterceptor>(
        () => registerModule.provideCombiningSmartInterceptor(
              gh<_i5.NetworkLogInterceptor>(),
              gh<_i3.NetworkAuthInterceptor>(),
              gh<_i4.NetworkErrorInterceptor>(),
              gh<_i6.NetworkRefreshInterceptor>(),
            ));
    gh.singleton<_i8.Dio>(
        () => registerModule.provideDio(gh<_i7.CombiningSmartInterceptor>()));
    return this;
  }
}

class _$RegisterModule extends _i9.RegisterModule {}
