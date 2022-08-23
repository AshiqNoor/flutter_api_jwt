library sign_up;

import 'dart:convert';
import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_jwt/app/config/routes/routes_library.dart';
import 'package:flutter_api_jwt/app/constants/constants_library.dart';
import 'package:flutter_api_jwt/app/share_components/shared_library.dart';

import 'package:flutter_api_jwt/app/ui/ui_library.dart';
import 'package:flutter_api_jwt/app/utils/helper/helper_library.dart';
import 'package:flutter_api_jwt/app/utils/mixins/mixins_library.dart';
import 'package:flutter_api_jwt/app/utils/provider/provider_library.dart';
import 'package:flutter_api_jwt/app/utils/services/service_library.dart';
import 'package:provider/provider.dart';

part '../sign_up/view_model/sign_up_provider.dart';
part '../sign_up/views/component/term_condition_button.dart';
part '../sign_up/model/sign_up_req_model.dart';
part '../sign_up/model/sign_up_res_model.dart';
part '../sign_up/views/screens/sign_up_screen.dart';
part '../sign_up/repository/sign_up_repo.dart';
