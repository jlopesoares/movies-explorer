import 'package:duflix/api/gen/watchmode_api.enums.swagger.dart';
import 'package:duflix/feature/details/bloc/details_cubit.dart';
import 'package:duflix/feature/details/data/details_datasource.dart';
import 'package:duflix/feature/details/data/details_repository.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DetailsCubit', () {
    test(
      'it should be a mock',
      () {
        final cubit = DetailsCubit(
          MockSuccessDetailsRepository(
            MockSuccessDetailsDatasource(),
          ),
          '1',
        );

        expect(cubit.isMock, true);
      },
    );

    test(
      'initial state should be loading',
      () {
        final cubit = DetailsCubit(
          MockSuccessDetailsRepository(
            MockSuccessDetailsDatasource(),
          ),
          '1',
        );

        expect(cubit.state, DetailsPageState.loading);
      },
    );

    test(
      'after loading state should be loaded',
      () async {
        final cubit = DetailsCubit(
          MockSuccessDetailsRepository(
            MockSuccessDetailsDatasource(),
          ),
          '1',
        );

        expect(cubit.state, DetailsPageState.loading);

        await cubit.loadDetails();

        expect(cubit.state, DetailsPageState.loaded);
      },
    );

    test(
      'the retrieved detail is correct',
      () async {
        final cubit = DetailsCubit(
          MockSuccessDetailsRepository(
            MockSuccessDetailsDatasource(),
          ),
          '1',
        );

        await cubit.loadDetails();

        expect(cubit.details, isNotNull);
        expect(cubit.details?.title, 'Mufasa');
        expect(cubit.details?.type, TitleType.movie);
        expect(cubit.details?.genreNames, ['Action', 'Adventure']);
        expect(cubit.details?.poster, 'assets/images/mufasa_poster.jpg');
        expect(cubit.details?.backdrop, 'assets/images/mufasa_backdrop.jpg');
        expect(
          cubit.details?.plotOverview,
          "Mufasa is a lion, the king of the jungle. He has a son, Simba, who will one day take his place as king. Mufasa's brother, Scar, plots to betray Mufasa and take over the throne. Simba is exiled and must return to take his rightful place as king.",
        );
      },
    );

    test(
      'after fetching the details, the image should be the correct one',
      () async {
        final cubit = DetailsCubit(
          MockSuccessDetailsRepository(
            MockSuccessDetailsDatasource(),
          ),
          '1',
        );

        expect(cubit.state, DetailsPageState.loading);

        await cubit.loadDetails();

        // Após chamar fetchItems, o status deve ser loading
        expect(cubit.state, DetailsPageState.loaded);
        expect(cubit.detailImage, 'assets/images/mufasa_backdrop.jpg');
      },
    );
  });
}
