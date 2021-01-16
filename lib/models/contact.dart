class Contact{
  final int id;
  final String name;
  final int accountNumber;

  Contact(this.id, this.name, this.accountNumber);


  Map<String, dynamic> toMap(){
    return {
      'name': name,
      'account_number': accountNumber
    };
  }

  @override
  String toString() {
    return 'Contact{id: $id, name: $name, accountNumber: $accountNumber}';
  }
}