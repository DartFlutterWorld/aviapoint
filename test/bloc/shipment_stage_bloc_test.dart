import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
// import 'package:aviapoint/src/data/data.dart';
// import 'package:aviapoint/src/domain/domain.dart';
// import 'package:aviapoint/src/presentation/blocs/blocs.dart';

@GenerateMocks([Dio, HttpClientAdapter])
void main() {
  //late Dio mockDio;
  // late ShipmentStageBloc shipmentStageBloc;
  // late ApiDatasource apiDatasource;
  // late ShipmentRepository shipmentRepository;
  //late HttpClientAdapter mockHttpClientAdapter;

  // List<ShipmentStageModel> tStages = [
  //   ShipmentStageModel(
  //     type: "string",
  //     datetime: DateTime.parse("2021-01-01T08:00:00.717Z"),
  //     value: "string",
  //     subtype: "string",
  //     status: false,
  //     title: "string",
  //   ),
  // ];

  // setUp(() {
  //   mockDio = MockDio();
  //   mockHttpClientAdapter = MockHttpClientAdapter();
  //   when(mockDio.options).thenReturn(
  //     BaseOptions(
  //       baseUrl: "https://cp.c025prts.one/api",
  //       connectTimeout: 5000,
  //       receiveTimeout: 5000,
  //       headers: {'Connection-Type': 'application/json; charset=UTF-8'},
  //     ),
  //   );

  //   when(mockDio.httpClientAdapter).thenReturn(mockHttpClientAdapter);

  //   apiDatasource = ApiDatasourceDio(dio: mockDio, baseUrl: 'https://cp.c025prts.one/api');
  //   shipmentRepository = ShipmentRepositoryImpl(apiDatasource: apiDatasource);
  //   shipmentStageBloc = ShipmentStageBloc(shipmentRepository: shipmentRepository);
  // });

  // blocTest<ShipmentStageBloc, ShipmentStageState>(
  //   'initial state',
  //   build: () => shipmentStageBloc,
  //   expect: () => const <ShipmentStageState>[],
  // );

  // group('GET shipment stage', () {
  //   const String tId = "1";
  //   const String tOrderId = "1";

  //   setUp(() {
  //     when(
  //       mockDio.get<List<dynamic>>(
  //         '/steps/$tOrderId/step4/day/$tId/',
  //         options: anyNamed('options'),
  //         queryParameters: anyNamed('queryParameters'),
  //         cancelToken: anyNamed('cancelToken'),
  //         onReceiveProgress: anyNamed('onReceiveProgress'),
  //       ),
  //     ).thenAnswer(
  //       (_) async => Response(
  //         data: json.decode(fixture('shipment_stages.json')),
  //         statusCode: 200,
  //         requestOptions: RequestOptions(
  //           method: 'GET',
  //           path: '/steps/$tOrderId/step4/day/$tId/',
  //         ),
  //       ),
  //     );
  //   });

  //   blocTest<ShipmentStageBloc, ShipmentStageState>(
  //     'GET',
  //     build: () => shipmentStageBloc,
  //     act: (bloc) => bloc.add(
  //       const GetShipmentStageEvent(
  //         orderId: tId,
  //         id: tId,
  //       ),
  //     ),
  //     expect: () => [
  //       const LoadingShipmentStageState(),
  //       SuccessShipmentStageState(tStages),
  //     ],
  //   );
  // });
}
