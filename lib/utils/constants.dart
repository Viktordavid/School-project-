//Navigation Routes

import 'package:school_project/models/models.dart';

const SplashScreenViewRoute = '/splash-screen';
const LoginViewRoute = '/login';
const SignUpViewRoute = '/sign-up';
const DashboardViewRoute = '/dashboard';
const ChipRegistrationViewRoute = '/register-chip';
const AnimalDetailsViewRoute = '/animal-details';
const MicroChipsViewRoute = '/micro-chips';
const RegistrationHistoryViewRoute = '/history';
const SearchViewRoute = '/micro-chip-search';
const AuthBridgeViewRoute = '/auth-bridge';
const SupportViewRoute = '/support';

const defaultAnimalDetails = AnimalDetail(
    chipImplantationDate: '',
    chipNo: '',
    colour: '',
    conditions: '',
    dob: '',
    gender: '',
    name: '',
    type: '',
    userId: '');
