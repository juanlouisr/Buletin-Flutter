class Account {
  final int accountId;
  final String accountEmail;
  final String accountFullname;

  Account({
    required this.accountId,
    required this.accountEmail,
    required this.accountFullname,
  });

  factory Account.fromMap(Map<String, dynamic> map) {
    int accountId = map['account_id'] as int;
    String accountEmail = map['account_email'] as String;
    String accountFullname = map['account_fullname'] as String;

    return Account(
      accountId: accountId,
      accountEmail: accountEmail,
      accountFullname: accountFullname,
    );
  }
}
