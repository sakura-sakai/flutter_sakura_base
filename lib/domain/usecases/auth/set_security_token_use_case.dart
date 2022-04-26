// import 'package:equatable/equatable.dart';
// import 'package:flutter_sakura_base/domain/repositories/auth/auth_repository.dart';
// import 'package:flutter_sakura_base/domain/usecases/use_case.dart';
//
// import '../../entities/refresh_token.dart';
// import '../../entities/token.dart';
//
// class SetSecurityTokenUseCase implements UseCase<void, SecurityTokenParam> {
//   SetSecurityTokenUseCase(this.authRepository);
//
//   final AuthRepository authRepository;
//
//   @override
//   Future<void> call({required SecurityTokenParam params}) async {
//     await authRepository.setSecurityToken(
//       token: params.token,
//       refreshToken: params.refreshToken,
//     );
//   }
// }
//
// class SecurityTokenParam extends Equatable {
//   const SecurityTokenParam({
//     required this.token,
//     required this.refreshToken,
//   });
//
//   final Token token;
//   final RefreshToken refreshToken;
//
//   @override
//   List<Object?> get props => [token, refreshToken];
// }
