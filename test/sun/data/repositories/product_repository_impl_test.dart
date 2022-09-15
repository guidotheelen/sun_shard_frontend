// 📦 Package imports:
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// 🌎 Project imports:
import 'package:sun_shard_frontend/core/error/exception.dart';
import 'package:sun_shard_frontend/core/error/failure.dart';
import 'package:sun_shard_frontend/core/network/network_info.dart';
import 'package:sun_shard_frontend/sun_shard/data/datasources/product_local_data_source.dart';
import 'package:sun_shard_frontend/sun_shard/data/datasources/product_remote_datasource.dart';
import 'package:sun_shard_frontend/sun_shard/data/models/product_model.dart';
import 'package:sun_shard_frontend/sun_shard/data/repositories/product_repository_impl.dart';

import '../../../core/test_extensions.dart';

class MockRemoteDataSource extends Mock implements ProductRemoteDataSource {}

class MockLocalDataSource extends Mock implements ProductLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  const tID = '1';
  final tProductModel = ProductModel(id: '1', name: 'test');

  late ProductRepositoryImpl repository;
  late MockRemoteDataSource mockRemoteDataSource;
  late MockLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = ProductRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  group('device is online', () {
    setUp(() {
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    });

    test(
      'should return remote data when the call to remote data source is successful',
      () async {
        // arrange
        when(() => mockRemoteDataSource.getProduct(tID))
            .thenAnswer((_) async => tProductModel);
        // act
        final result = await repository.getProduct(tID);
        // assert
        verify(() => mockRemoteDataSource.getProduct(tID)).calledOnce;
        expect(result, equals(Right(tProductModel)));
      },
    );

    test(
      'should cache the data locally when the call to remote data source is successful',
      () async {
        // arrange
        when(() => mockRemoteDataSource.getProduct(tID))
            .thenAnswer((_) async => tProductModel);
        // act
        await repository.getProduct(tID);
        // assert
        verify(() => mockRemoteDataSource.getProduct(tID)).calledOnce;
        verify(() => mockLocalDataSource.cacheProduct(tProductModel))
            .calledOnce;
      },
    );

    test(
      'should return server failure when the call to remote data source is unsuccessful',
      () async {
        // arrange
        when(() => mockRemoteDataSource.getProduct(tID))
            .thenThrow(ServerException('Unable to reach server'));
        // act
        final result = await repository.getProduct(tID);
        // assert
        verify(() => mockRemoteDataSource.getProduct(tID)).calledOnce;
        verifyZeroInteractions(mockLocalDataSource);
        expect(result, equals(Left(ServerFailure())));
      },
    );
  });

  group('device is offline', () {
    setUp(() {
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);
    });

    test(
      'should return last locally cached data when the cached data is present',
      () async {
        // arrange
        when(() => mockLocalDataSource.getLastProduct())
            .thenAnswer((_) async => tProductModel);
        // act
        final result = await repository.getProduct(tID);
        // assert
        verifyZeroInteractions(mockRemoteDataSource);
        verify(() => mockLocalDataSource.getLastProduct()).calledOnce;
        expect(result, equals(Right(tProductModel)));
      },
    );
  });
}
