class AuthState {

  AuthState({
    this.isLogged = false,
    this.accessToken,
    this.refreshToken,
    this.isLoading = false,
    this.expiresAt,
  });

  final bool isLogged;
  final String? accessToken;
  final String? refreshToken;
  final bool isLoading;
  final String? expiresAt;

  AuthState copyWith({
    bool? isLogged,
    String? accessToken,
    String? refreshToken,
    bool? isLoading,
    String? expiresAt
  }) {
    return AuthState(
      isLogged: isLogged ?? this.isLogged,
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      isLoading: isLoading ?? this.isLoading,
      expiresAt: expiresAt ?? this.expiresAt,
    );
  }
}