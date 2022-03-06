/**
 * 
  There are small company their are (Managers and Employees)
  They share
  - Name
  - Age
  - Phone
  - Salary
  - Section
  - Record their attendance (With bool variable “isAttend”)
    Manager have
  - Number of employees.
  - List of employees
  - Add task to specific employee.
  - Show all employees he manages (All details , tasks , deliver or not).
    Employee
  - List of Tasks and their state (deliver or not)
  - Show tasks
  - Deliver task (with change state of task)
 */

class Person {
  final String? name;
  final int? age;
  final String? phone;
  final double? salary;
  final String? section;
  final bool? isAttend;
  Person({this.name, this.age, this.phone, this.salary, this.isAttend, this.section});
}

class Manager extends Person{ 
  int numberOfEmployees = 0;
  List <Employee> employees = [];
  Manager({String? name, int? age, String? phone, double? salary, bool? isAttend, String? section}):
  super(age: age, isAttend: isAttend, name: name, phone: phone, salary: salary, section: section);
  
  bool search(Employee emp){
    for (Employee employee in employees) {
      if(emp == employee){
        return true;
      }
    }
    return false;
  }

  void addEmployee(Employee employee){
    if (!search(employee)){
      employees.add(employee);
      numberOfEmployees++;
    } 
    else {
      print("The Employee: ${employee.name} is already existed");    
    }
  }

  void addTask(Task task , Employee employee){
    search(employee)? employee.tasks.add(task):print("The Employee: ${employee.name} isn't exist in your employees list");    
  }
}
class Employee extends Person{
  List <Task> tasks = [];
  Employee({name, age, phone, salary, isAttend, section}):
  super(age: age, isAttend: isAttend, name: name, phone: phone, salary: salary, section: section);

  void showTasks(){
    int i = 0;
    tasks.forEach((element) { print("Task #${++i}: ${element.name}\nStatus: ${element.isDelivered? "Delivered":"Not delivered"}");});
  }

  void deliver(Task task){
    for(Task t in tasks){
      if (t.name == task.name) {
        t.isDelivered = true;
        return;
      }
    }
    print("Task isn't existed");
  }
}

class Task {
  String name;
  bool isDelivered = false;
  Task({required this.name , this.isDelivered = false});
}

// void main() {
//   Manager w1 = Manager(name: "Ahmed Abd El Aziz", age: 10);
//   Manager w2 = Manager(name: "Ahmed Abd El Aziz", age: 10);
//   Employee emp1 = Employee(name: "Mostafa", age:  20);
//   Employee emp2 = Employee(name: "fawzy", age:  22);
//   Task t1 = Task(name: "Watching  الرجل العناب");
//   Task t2 = Task(name: "Eat Kofta");
//   w1.addEmployee(emp1);
//   w1.addEmployee(emp2);
//   w1.addTask(t1,emp1);
  
//   // print(w1.employees.first);
//   w1.employees.forEach((element) {print(element.name);});
//   print(w1.search(emp2));
//   w2.addEmployee(emp2);
//   w2.addTask(t2, emp2);
//   w1.addEmployee(emp2);
//   emp1.deliver(t2);
//   w1.addTask(t2, emp1);
//   emp1.showTasks();
//   emp1.deliver(t1);
//   emp1.showTasks();
// }