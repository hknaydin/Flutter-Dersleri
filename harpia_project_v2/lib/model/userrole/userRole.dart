enum UserRole {
  ADMIN(roleId: 1, roleName: "ADMIN"),
  DOCTOR(roleId: 2, roleName: "DOCTOR"),
  PATIENT(roleId: 3, roleName: "PATIENT");

  final int roleId;
  final String roleName;
  const UserRole({required this.roleId, required this.roleName});

  static String getRoleName(int roleId) {
    switch (roleId) {
      case 1:
        return UserRole.ADMIN.roleName;
      case 2:
        return UserRole.DOCTOR.roleName;
      case 3:
        return UserRole.PATIENT.roleName;
      default:
        throw ArgumentError("Invalid roleId");
    }
  }
}
