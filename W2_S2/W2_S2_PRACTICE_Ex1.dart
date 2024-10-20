

//define the 3 values

enum Skill { FLUTTER, DART, OTHER }

//address class: street, city, zip

class Address {

  String street, city, zipCode;
  Address(this.street, this.city, this.zipCode);

}

//employee class: mname, baseSalary, skill, address, yearofexperience
class Employee {

  String _name;
  double _baseSalary;
  List<Skill> _skills;
  Address _address;
  int _yoe;  // yoe = YearOfExperience 

//The constructor

  Employee(this._name, this._baseSalary, this._skills, this._address, this._yoe);

//Constructor for create developer amployee

  Employee.mobileDeveloper(String name, Address address, int yoe)
  
      : this._skills = [Skill.FLUTTER, Skill.DART],
        this._name =name,
        this._baseSalary = 40000,
        this._address = address,
        this._yoe= yoe;

//method

  void printDetails() {

    print('Employee: $_name, Base Salary: \$$_baseSalary');

  }

  // Getter methods 

  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills =>_skills;
  Address get address => _address;
  int get yoe => _yoe;

//calculation

  double computeSalary() {

    double salary = _baseSalary + (_yoe * 2000);

    for (var skill in _skills) {
      
      if (skill == Skill.FLUTTER) salary += 5000;
      if (skill == Skill.DART) salary += 3000;
      if (skill == Skill.OTHER) salary += 1000;

    }

    return salary;

  }


}

//output

void main() {

  var address = Address('123 Main St', 'City', '12345');
  var emp1 = Employee('Sokea', 40000, [Skill.FLUTTER, Skill.OTHER], address, 5);

  emp1.printDetails();
  print('Total Salary: ${emp1.computeSalary()}');

  var emp2 = Employee.mobileDeveloper('Ronan', address, 3);
  
  emp2.printDetails();
  print('Total Salary: ${emp2.computeSalary()}');

  
}
