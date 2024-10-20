
//not_complete code

//bank class

class Bankacc {

  //acc = acc
  //bal = Balance

  int accId;
  String accOwner;  
  double _bal;

  // Constructor
  Bankacc(this.accId, this.accOwner, [this._bal = 0]);

  // Method get balance

  double balance() {
    return _bal;

  }

  // Mwithrawd method

  void withdraw(double amount) {
    if (amount > _bal) {

    }

    _bal -= amount;

  }

  // credit method 

  void credit(double amount) {

    _bal += amount;

  }

}

class Bank {

  List<Bankacc> accs = [];

  // new bank method

  Bankacc createacc(int accId, String accOwner) {

    // Check if unique acc

    for (var acc in accs) {
      if (acc.accId == accId) {
        throw Exception('acc ID already exists.');

      }
      
    }

    // Create a new acc 

    Bankacc newacc = Bankacc(accId, accOwner);
    accs.add(newacc);
    return newacc;

  }


}
