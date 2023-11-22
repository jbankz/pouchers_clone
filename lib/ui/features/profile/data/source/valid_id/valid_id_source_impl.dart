import 'package:Pouchers/app/config/app_config.dart';
import 'package:Pouchers/ui/features/profile/domain/enum/id_enum.dart';
import 'package:Pouchers/ui/features/profile/domain/model/idenitification_type.dart';

import 'valid_id_source.dart';

class ValidIdSourceImpl implements ValidIdSource {
  @override
  List<IdentificationType> validIds() => [
        IdentificationType(
            key: 'Driver\'s license',
            value: 'drivers_license',
            idTypes: IdTypes.driver,
            dojahKey: AppConfig.dojahDriverLicense),
        IdentificationType(
            key: 'NIN',
            value: 'nin',
            idTypes: IdTypes.nin,
            dojahKey: AppConfig.dojahNin),
        IdentificationType(
            key: 'Voter\'s card',
            value: 'voters_card',
            idTypes: IdTypes.voters,
            dojahKey: AppConfig.dojahVotersCard),
        IdentificationType(
            key: 'Virtual NIN',
            value: 'vnin',
            idTypes: IdTypes.vnin,
            dojahKey: AppConfig.dojahVnin),
        IdentificationType(
            key: 'International Passport',
            value: 'passport',
            idTypes: IdTypes.passport,
            dojahKey: AppConfig.dojahInternationalPassport),
      ];
}
