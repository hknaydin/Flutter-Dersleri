enum UserRole {
  ADMIN(roleId: 1, roleName: "ADMIN"),
  DOCTOR(roleId: 2, roleName: "DOCTOR"),
  PATIENT(roleId: 3, roleName: "PATIENT"),
  NO_ROLE(roleId: 4, roleName: "NO_ROLE");

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
      case 4:
        return UserRole.NO_ROLE.roleName;
      default:
        throw ArgumentError("Invalid roleId");
    }
  }
}
