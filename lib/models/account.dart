class Account {
  final int accountId;
  final String accountEmail;
  final String accountFullname;
  final String accountPhoneNumber;

  Account({
    required this.accountId,
    required this.accountEmail,
    required this.accountFullname,
    required this.accountPhoneNumber,
  });

  factory Account.fromMap(Map<String, dynamic> map) {
    int accountId = map['account_id'] as int;
    String accountEmail = map['account_email'] as String;
    String accountFullname = map['account_fullname'] as String;
    String accountPhoneNumber = map['account_phone_number'] as String;

    return Account(
      accountId: accountId,
      accountEmail: accountEmail,
      accountFullname: accountFullname,
      accountPhoneNumber: accountPhoneNumber,
    );
  }
}
