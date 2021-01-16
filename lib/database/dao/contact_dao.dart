
import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/models/contact.dart';
import 'package:sqflite/sqflite.dart';

class ContactDao{

  static const String sqlTable = 'CREATE TABLE $_tableName ('
  '$_id INTEGER PRIMARY KEY, '
  '$_name TEXT, '
  '$_accountNumber INTEGER)';

  static const String _tableName = "contacts";
  static const String _id = "id";
  static const String _name = "name";
  static const String _accountNumber = "account_number";

   Future<int> save(Contact contact) async{
     final Database db = await getDataBase();
     return db.insert(_tableName, contact.toMap());
     // refatorando
     // return getDataBase().then((db) {
     //   return db.insert('contacts', contact.toMap());
     // });
   }

   Future<List<Contact>> findAll() async{
     final Database db = await getDataBase();
     final List<Map<String, dynamic>> result = await db.query(_tableName);
     final List<Contact> contacts = List();
     for (Map<String, dynamic> row in result) {
       final Contact contact = Contact(
         row[_id],
         row[_name],
         row[_accountNumber],
       );
       contacts.add(contact);
     }
     return contacts;
     //Refatorando
     // return getDataBase().then((db) {
     //   return db.query('contacts').then((maps) {
     //     final List<Contact> contacts = List();
     //     for (Map<String, dynamic> map in maps) {
     //       final Contact contact = Contact(
     //         map['id'],
     //         map['name'],
     //         map['account_number'],
     //       );
     //       contacts.add(contact);
     //     }
     //     return contacts;
     //   });
     // });
   }
}
