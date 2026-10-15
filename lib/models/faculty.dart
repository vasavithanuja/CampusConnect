class Faculty {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String department;
  final String designation;
  final String qualification;
  final String experience;

  final int mentees;
  final int leaveBalance;

  final String salaryStatus;
  final String joiningDate;

  Faculty({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.department,
    required this.designation,
    required this.qualification,
    required this.experience,
    required this.mentees,
    required this.leaveBalance,
    required this.salaryStatus,
    required this.joiningDate,
  });
}
