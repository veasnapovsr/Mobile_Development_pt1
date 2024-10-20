
class BankAccount {
  int accountId;
  String accountOwner;
  double _balance;

  // Constructor
  BankAccount(this.accountId, this.accountOwner, [this._balance = 0]);

  // Method to get the current balance
  double balance() {
    return _balance;
  }

  // Method to withdraw money from the account
  void withdraw(double amount) {
    if (amount > _balance) {
      throw Exception('Insufficient funds');
    }
    _balance -= amount;
  }

  // Method to credit money to the account
  void credit(double amount) {
    _balance += amount;
  }
}

class Bank {
  List<BankAccount> accounts = [];

  // Method to create a new bank account
  BankAccount createAccount(int accountId, String accountOwner) {
    // Check if the accountId is unique
    for (var account in accounts) {
      if (account.accountId == accountId) {
        throw Exception('Account ID already exists.');
      }
    }

    // Create a new account 

    BankAccount newAccount = BankAccount(accountId, accountOwner);
    accounts.add(newAccount);
    return newAccount;

  }


}
