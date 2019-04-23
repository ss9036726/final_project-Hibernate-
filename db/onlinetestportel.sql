-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 14, 2019 at 08:35 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlinetestportel`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` bigint(20) NOT NULL,
  `username` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE `answer` (
  `id` bigint(20) NOT NULL,
  `WrongorRight` varchar(255) DEFAULT NULL,
  `answer_date` varchar(255) DEFAULT NULL,
  `answer_text` varchar(255) DEFAULT NULL,
  `question_question_id` bigint(20) DEFAULT NULL,
  `student_s_id` bigint(20) DEFAULT NULL,
  `subjectid_sub_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`id`, `WrongorRight`, `answer_date`, `answer_text`, `question_question_id`, `student_s_id`, `subjectid_sub_id`) VALUES
(2, 'Right', 'Sun Apr 14 10:55:11 IST 2019', '1, 3 and 4', 50, 2, 4),
(3, 'Right', 'Sun Apr 14 10:55:23 IST 2019', 'which communicates through Java sockets', 51, 2, 4),
(4, 'Wrong', 'Sun Apr 14 10:55:44 IST 2019', 'Declaring as Abstract class using virtual keyword', 52, 2, 4),
(5, 'Wrong', 'Sun Apr 14 10:56:03 IST 2019', 'Declaring it abstract using the virtual keyword', 53, 2, 4),
(6, 'Right', 'Sun Apr 14 10:56:13 IST 2019', '1, 2, 3 and 4', 54, 2, 4),
(7, 'Right', 'Sun Apr 14 10:56:25 IST 2019', 'Only (b) is TRUE.', 58, 2, 4),
(8, 'Wrong', 'Sun Apr 14 10:56:48 IST 2019', 'inside static block a = 4 inside constructor a = 5', 55, 2, 4),
(9, 'Right', 'Sun Apr 14 10:56:55 IST 2019', 'compiler error', 56, 2, 4),
(10, 'Right', 'Sun Apr 14 10:57:01 IST 2019', 'Compiler error', 57, 2, 4),
(11, 'Right', 'Sun Apr 14 11:17:31 IST 2019', 'A class can inherit from multiple abstract classes.', 49, 2, 4),
(12, 'Right', 'Sun Apr 14 11:21:27 IST 2019', 'All of the above', 39, 1, 5),
(13, 'Right', 'Sun Apr 14 11:21:39 IST 2019', 'All of the above', 40, 1, 5),
(14, 'Right', 'Sun Apr 14 11:22:19 IST 2019', '10 10', 41, 1, 5),
(15, 'Right', 'Sun Apr 14 11:22:37 IST 2019', 'Empty', 42, 1, 5),
(16, 'Right', 'Sun Apr 14 11:22:49 IST 2019', 'Hello from Test() Main Started', 43, 1, 5),
(17, 'Wrong', 'Sun Apr 14 11:23:09 IST 2019', 'Garbage value', 44, 1, 5),
(18, 'Right', 'Sun Apr 14 11:23:23 IST 2019', 'All of the above', 45, 1, 5),
(19, 'Right', 'Sun Apr 14 11:23:39 IST 2019', 'Only 1 and 3', 46, 1, 5),
(20, 'Right', 'Sun Apr 14 11:24:04 IST 2019', 'Members of a class are private by default and members of struct are public by default. When deriving a struct from a class/struct, default access-specifier for a base class/struct is public and when deriving a class, default access specifier is private.', 47, 1, 5),
(21, 'Wrong', 'Sun Apr 14 11:24:17 IST 2019', 'Compiler Error', 48, 1, 5),
(22, 'Right', 'Sun Apr 14 11:26:24 IST 2019', 'type \'type\'', 59, 1, 7),
(23, 'Right', 'Sun Apr 14 11:45:42 IST 2019', 'abcd', 60, 1, 7),
(24, 'Right', 'Sun Apr 14 11:45:50 IST 2019', 'A', 62, 1, 7),
(25, 'Right', 'Sun Apr 14 11:45:57 IST 2019', '48', 63, 1, 7),
(26, 'Right', 'Sun Apr 14 11:46:04 IST 2019', 'Method', 64, 1, 7),
(27, 'Wrong', 'Sun Apr 14 11:47:14 IST 2019', 'Prints alternate nodes in reverse order', 70, 1, 11),
(28, 'Right', 'Sun Apr 14 11:47:41 IST 2019', 'All of the above', 71, 1, 11),
(29, 'Right', 'Sun Apr 14 11:47:50 IST 2019', 'Merge Sort', 72, 1, 11),
(30, 'Right', 'Sun Apr 14 11:47:56 IST 2019', '1 3 5 5 3 1', 73, 1, 11),
(31, 'Wrong', 'Sun Apr 14 11:48:29 IST 2019', 'n/2', 74, 1, 11),
(32, 'Right', 'Sun Apr 14 11:48:38 IST 2019', 'All of the above', 75, 1, 11),
(33, 'Wrong', 'Sun Apr 14 11:48:56 IST 2019', 'Both of the above', 76, 1, 11);

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `question_id` bigint(20) NOT NULL,
  `answer_text` text NOT NULL,
  `marks` tinyint(4) NOT NULL,
  `question_text` text NOT NULL,
  `question_type` varchar(255) DEFAULT NULL,
  `subject_sub_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`question_id`, `answer_text`, `marks`, `question_text`, `question_type`, `subject_sub_id`) VALUES
(39, 'All of the above', 10, 'Which of the followings is/are automatically added to every class, if we do not write our own.', 'optional', 5),
(40, 'All of the above', 10, 'When a copy constructor may be called?', 'optional', 5),
(41, '10 10', 10, '#include<iostream> using namespace std;   class X  { public:     int x; };   int main() {     X a = {10};     X b = a;     cout << a.x << \" \" << b.x;     return 0; }', 'optional', 5),
(42, 'Empty', 10, '#include<iostream> #include<stdlib.h> using namespace std;   class Test { public:    Test()    { cout << \"Constructor called\"; } };   int main() {     Test *t = (Test *) malloc(sizeof(Test));     return 0; }', 'optional', 5),
(43, 'Hello from Test() Main Started', 10, '#include <iostream> using namespace std;   class Test { public:       Test() { cout << \"Hello from Test() \"; } } a;   int main() {     cout << \"Main Started \";     return 0; }', 'optional', 5),
(44, 'Compiler Error: p must be passed by reference', 10, '#include<iostream> using namespace std; class Point {     int x; public:     Point(int x) { this->x = x; }     Point(const Point p) { x = p.x;}     int getX() { return x; } };   int main() {    Point p1(10);    Point p2 = p1;    cout << p2.getX();    return 0; }', 'optional', 5),
(45, 'All of the above', 10, 'We must use initializer list in a constructor when', 'optional', 5),
(46, 'Only 1 and 3', 10, 'Which of the following is true about constructors. 1) They cannot be virtual. 2) They cannot be private. 3) They are automatically called by new operator.', 'optional', 5),
(47, 'Members of a class are private by default and members of struct are public by default. When deriving a struct from a class/struct, default access-specifier for a base class/struct is public and when deriving a class, default access specifier is private.', 10, 'What is the difference between struct and class in C++?', 'optional', 5),
(48, 'A non-zero value', 10, '#include<iostream> using namespace std;    class Empty {};    int main() {   cout << sizeof(Empty);   return 0; }', 'optional', 5),
(49, 'A class can inherit from multiple abstract classes.', 10, 'Which of the following is FALSE about abstract classes in Java', 'optional', 4),
(50, '1, 3 and 4', 10, '1) An interface can contain following type of members. ....public, static, final fields (i.e., constants)  ....default and static methods with bodies  2) An instance of interface can be created.  3) A class can implement multiple interfaces.  4) Many classes can implement the same interface.', 'optional', 4),
(51, 'which communicates through Java sockets', 10, 'Type IV JDBC driver is a driver', 'optional', 4),
(52, 'Making atleast one member function as pure virtual function', 10, 'Which of the following is used to make an Abstract class?', 'optional', 4),
(53, 'Making at least one member function as pure virtual function', 10, 'We can make a class abstract by', 'optional', 4),
(54, '1, 2, 3 and 4', 10, 'Which of the following is/are true about constructors in Java?  1) Constructor name should be same as class name. 2) If you don\'t define a constructor for a class,      a default parameterless constructor is automatically     created by the compiler.  3) The default constructor calls super() and initializes all     instance variables to default value like 0, null. 4) If we want to parent class constructor, it must be called in     first line of constructor.', 'optional', 4),
(55, 'inside static block a = 4 inside constructor a = 11', 10, 'class Test {     static int a;           static     {         a = 4;         System.out.println (\"inside static blockn\");         System.out.println (\"a = \" + a);     }           Test()     {         System.out.println (\"ninside constructorn\");         a = 10;     }           public static void func()     {         a = a + 1;         System.out.println (\"a = \" + a);     }           public static void main(String[] args)     {           Test obj = new Test();         obj.func();       } }', 'optional', 4),
(56, 'compiler error', 10, 'class Main {       public static void main(String args[]) {                int t;                System.out.println(t);      }    }', 'optional', 4),
(57, 'Compiler error', 10, 'Predict the output of following Java program. class Test {      public static void main(String[] args) {        for(int i = 0; 0; i++)        {            System.out.println(\"Hello\");            break;        }      }  } ', 'optional', 4),
(58, 'Only (b) is TRUE.', 10, 'Which of the following statements is/are TRUE regarding JAVA ? (a) Constants that cannot be changed are declared using the â??staticâ?? keyword. (b) A class can only inherit one class but can implement multiple interfaces.', 'optional', 4),
(59, 'type \'type\'', 10, 'print type(type(int))', 'optional', 7),
(60, 'abcd', 10, 'What is the output of the following code : L = [\'a\',\'b\',\'c\',\'d\'] print \"\".join(L)', 'optional', 7),
(62, 'A', 10, 'What is the output of the following segment : chr(ord(\'A\'))', 'optional', 7),
(63, '48', 10, 'What is the output of the following program : y = 8 z = lambda x : x * y print z(6)', 'optional', 7),
(64, 'Method', 10, 'What is called when a function is defined inside a class?', 'optional', 7),
(65, '1', 10, 'Predict the output of following program? #include \"stdio.h\" int main() {     char arr[100];     printf(\"%d\", scanf(\"%s\", arr));     /* Suppose that input value given         for above scanf is \"GeeksQuiz\" */     return 1; }', 'optional', 6),
(66, 'Depends on terminal configuration', 10, 'Predict output of the following program #include <stdio.h> int main() {    printf(\"new_c_questionby\");    printf(\"rgeeksforgeeks\");     getchar();    return 0; }', 'optional', 6),
(67, 'GEEKS %% FOR %% GEEKS', 10, '#include <stdio.h>   int main()  {    printf(\" \"GEEKS %% FOR %% GEEKS\"\");    getchar();    return 0;  }', 'optional', 6),
(68, 'Compiler Dependent', 10, 'Output of following program? #include <stdio.h> int main() {     int i = 5;     printf(\"%d %d %d\", i++, i++, i++);     return 0; }', 'optional', 6),
(69, 'Compiler Dependent', 10, 'Output of following program? #include <stdio.h> int main() {     int i = 5;     printf(\"%d %d %d\", i++, i++, i++);     return 0; }', 'optional', 6),
(70, 'Prints all nodes of linked list in reverse order', 10, 'What does the following function do for a given Linked List with first node as head? void fun1(struct node* head) {   if(head == NULL)     return;      fun1(head->next);   printf(\"%d  \", head->data); }', 'optional', 11),
(71, 'All of the above', 10, 'Which of the following points is/are true about Linked List data structure when it is compared with array', 'optional', 11),
(72, 'Merge Sort', 10, 'Which of the following sorting algorithms can be used to sort a random linked list with minimum time complexity?', 'optional', 11),
(73, '1 3 5 5 3 1', 10, 'What is the output of following function for start pointing to first node of following linked list? 1->2->3->4->5->6 void fun(struct node* start) {   if(start == NULL)     return;   printf(\"%d  \", start->data);       if(start->next != NULL )     fun(start->next->next);   printf(\"%d  \", start->data); }', 'optional', 11),
(74, 'n', 10, 'In the worst case, the number of comparisons needed to search a singly linked list of length n for a given element is ', 'optional', 11),
(75, 'All of the above', 10, 'Which one of the following is an application of Stack Data Structure?', 'optional', 11),
(76, 'None of the above', 10, 'Which of the following is true about linked list implementation of stack?', 'optional', 11);

-- --------------------------------------------------------

--
-- Table structure for table `questions_option`
--

CREATE TABLE `questions_option` (
  `option_id` bigint(20) NOT NULL,
  `option1` text NOT NULL,
  `option2` text NOT NULL,
  `option3` text NOT NULL,
  `option4` text NOT NULL,
  `question_no_question_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions_option`
--

INSERT INTO `questions_option` (`option_id`, `option1`, `option2`, `option3`, `option4`, `question_no_question_id`) VALUES
(37, 'Copy Constructor', 'Assignment Operator', 'A constructor without any parameter', 'All of the above', 39),
(38, 'When an object of the class is returned by value.', 'When an object of the class is passed (to a function) by value as an argument.', 'When an object is constructed based on another object of the same class', 'All of the above', 40),
(39, 'Compiler Error', '10 followed by Garbage Value', '10 10', '10 0', 41),
(40, 'Constructor called', 'Empty', 'Compiler Error', 'Runtime error', 42),
(41, 'Main Started', 'Main Started Hello from Test()', 'Hello from Test() Main Started', 'Compiler Error: Global objects are not allowed', 43),
(42, '10', 'Compiler Error: p must be passed by reference', 'Garbage value', 'None of the above', 44),
(43, 'There is a reference variable in class', 'There is a constant variable in class', 'There is an object of another class. And the other class doesn\'t have default constructor.', 'All of the above', 45),
(44, 'All 1, 2, and 3', 'Only 1 and 3', 'Only 1 and 2', 'Only 2 and 3', 46),
(45, 'All members of a structure are public and structures don\'t have constructors and destructors', 'Members of a class are private by default and members of struct are public by default. When deriving a struct from a class/struct, default access-specifier for a base class/struct is public and when deriving a class, default access specifier is private.', 'All members of a structure are public and structures don\'t have virtual functions', 'All of the above', 47),
(46, 'A non-zero value', '0', 'Compiler Error', 'Runtime Error', 48),
(47, 'If we derive an abstract class and do not implement all the abstract methods, then the derived class should also be marked as abstract using \'abstract\' keyword', 'Abstract classes can have constructors', 'A class can be made abstract without any abstract method', 'A class can inherit from multiple abstract classes.', 49),
(48, '1, 3 and 4', '1, 2 and 4', '2, 3 and 4', '1, 2, 3 and 4', 50),
(49, 'which is written in C++', 'which requires an intermediate layer', 'which communicates through Java sockets', 'which translates JDBC function calls into API not native to DBMS', 51),
(50, 'Making atleast one member function as pure virtual function', 'Making atleast one member function as virtual function', 'Declaring as Abstract class using virtual keyword', 'Declaring as Abstract class using static keyword', 52),
(51, 'Declaring it abstract using the virtual keyword', 'Making at least one member function as virtual function', 'Making at least one member function as pure virtual function', 'Making all member function const', 53),
(52, '1', '1, 2', '1, 2 and 3', '1, 2, 3 and 4', 54),
(53, 'inside static block a = 4 inside constructor a = 11', 'Run Time Error', 'inside static block a = 4 inside constructor a = 5', 'Compiler Error', 55),
(54, '0', 'garbage value', 'compiler error', 'runtime error', 56),
(55, 'Hello', 'Empty Output', 'Compiler error', 'Runtime error', 57),
(56, 'Only (a) is TRUE.', 'Only (b) is TRUE.', 'Both (a) and (b) are TRUE.', 'Neither (a) nor (b) are TRUE.', 58),
(57, 'type \'int\'', 'type \'type\'', 'Error', '0', 59),
(58, 'Error', 'None', 'abcd', '[â??aâ??,â??bâ??,â??câ??,â??dâ??]', 60),
(60, 'A', 'B', 'a', 'Error', 62),
(61, '48', '14', '64', 'None of the above', 63),
(62, 'Module', 'Class', 'Another Function', 'Method', 64),
(63, '9', '1', '10', '100', 65),
(64, 'ew_c_question geeksforgeeks', 'new_c_ques geeksforgeeks', ' geeksforgeeks', 'Depends on terminal configuration', 66),
(65, 'â??GEEKS % FOR % GEEKSâ??', 'GEEKS % FOR % GEEKS', '\\\"GEEKS %% FOR %% GEEKS\\\"', 'GEEKS %% FOR %% GEEKS', 67),
(66, '7 6 5', '5 6 7', '7 7 7', 'Compiler Dependent', 68),
(67, '7 6 5', '5 6 7', '7 7 7', 'Compiler Dependent', 69),
(68, 'Prints all nodes of linked lists', 'Prints all nodes of linked list in reverse order', 'Prints alternate nodes of Linked List', 'Prints alternate nodes in reverse order', 70),
(69, 'Arrays have better cache locality that can make them better in terms of performance.', 'Random access is not allowed in a typical implementation of Linked Lists', 'The size of array has to be pre-decided, linked lists can change their size any time', 'All of the above', 71),
(70, 'Insertion Sort', 'Quick Sort', 'Heap Sort', 'Merge Sort', 72),
(71, '1 4 6 6 4 1', '1 3 5 1 3 5', '1 2 3 5', '1 3 5 5 3 1', 73),
(72, 'log 2 n', 'n/2', 'log 2 n â?? 1', 'n', 74),
(73, 'Managing function calls', 'The stock span problem', 'Arithmetic expression evaluation', 'All of the above', 75),
(74, 'In push operation, if new nodes are inserted at the beginning of linked list, then in pop operation, nodes must be removed from end.', 'In push operation, if new nodes are inserted at the end, then in pop operation, nodes must be removed from the beginning.', 'Both of the above', 'None of the above', 76);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `s_id` bigint(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `admission_date` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `course` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fees` double NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`s_id`, `address`, `admission_date`, `contact`, `course`, `email`, `fees`, `name`, `password`, `username`) VALUES
(1, 'MANDI H.P.', '2016-10-02', '7807033173', 'Full Stack', 'gshubhams911@gmail.com', 50000, 'SHUBHAM SHARMA', 'Shubham', 'Shubh_01'),
(2, 'Chamba Hp', '2016-10-02', '7018255413', 'Full Stack', 'raghav@gmail.com', 50000, 'Raghav Thakur', 'Raghav', 'Raghav');

-- --------------------------------------------------------

--
-- Table structure for table `studentexaminfo`
--

CREATE TABLE `studentexaminfo` (
  `id` bigint(20) NOT NULL,
  `date` varchar(255) DEFAULT NULL,
  `examstatus` varchar(255) DEFAULT NULL,
  `st_s_id` bigint(20) DEFAULT NULL,
  `sub_sub_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `studentexaminfo`
--

INSERT INTO `studentexaminfo` (`id`, `date`, `examstatus`, `st_s_id`, `sub_sub_id`) VALUES
(1, 'Fri Apr 12 09:47:55 IST 2019', 'Passed', 1, 4),
(2, 'Fri Apr 12 10:51:06 IST 2019', 'Passed', 1, 4),
(3, 'Fri Apr 12 11:15:55 IST 2019', 'Passed', 1, 4),
(4, 'Fri Apr 12 14:12:27 IST 2019', 'Passed', 1, 5),
(5, 'Fri Apr 12 14:37:23 IST 2019', 'Fail', 1, 4),
(6, 'Sun Apr 14 10:56:26 IST 2019', 'Fail', 2, 4),
(7, 'Sun Apr 14 10:57:03 IST 2019', 'Fail', 2, 4),
(8, 'Sun Apr 14 11:17:32 IST 2019', 'Passed', 2, 4),
(9, 'Sun Apr 14 11:24:18 IST 2019', 'Passed', 1, 5),
(10, 'Sun Apr 14 11:46:05 IST 2019', 'Passed', 1, 7),
(11, 'Sun Apr 14 11:48:57 IST 2019', 'Passed', 1, 11);

-- --------------------------------------------------------

--
-- Table structure for table `student_subject`
--

CREATE TABLE `student_subject` (
  `Student_s_id` bigint(20) NOT NULL,
  `subjectList_sub_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_subject`
--

INSERT INTO `student_subject` (`Student_s_id`, `subjectList_sub_id`) VALUES
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 11),
(2, 4),
(2, 6);

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `sub_id` bigint(20) NOT NULL,
  `sub_duration` int(11) NOT NULL,
  `sub_fees` int(11) NOT NULL,
  `sub_max_marks` int(11) NOT NULL,
  `sub_name` varchar(255) NOT NULL,
  `sub_offers` int(11) NOT NULL,
  `sub_passing_marks` int(11) NOT NULL,
  `sub_total_questions` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`sub_id`, `sub_duration`, `sub_fees`, `sub_max_marks`, `sub_name`, `sub_offers`, `sub_passing_marks`, `sub_total_questions`) VALUES
(1, 45, 25000, 100, 'React Js', 11, 40, 50),
(2, 45, 25000, 100, 'Angular Js', 10, 40, 50),
(3, 45, 25000, 100, 'Android', 10, 40, 50),
(4, 45, 25000, 100, 'Java', 10, 40, 50),
(5, 45, 25000, 100, 'C++', 10, 40, 50),
(6, 45, 25000, 100, 'C', 10, 40, 50),
(7, 45, 25000, 100, 'Python', 10, 40, 50),
(8, 45, 25000, 100, 'Sass', 10, 40, 50),
(9, 45, 25000, 100, 'Node JS', 10, 40, 50),
(10, 45, 25000, 100, 'SQL', 10, 40, 50),
(11, 45, 25000, 100, 'DataStructure', 10, 40, 50);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_ljqm891ywk3128u2dyfkmc69d` (`question_question_id`),
  ADD KEY `FK_oamnp04lw28qr5hikfg8cmfx` (`student_s_id`),
  ADD KEY `FK_doq64u9gfg0fqq13wmacwhcch` (`subjectid_sub_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`question_id`),
  ADD KEY `FK_7i8fc24i9wqpchc73eyxf1y4t` (`subject_sub_id`);

--
-- Indexes for table `questions_option`
--
ALTER TABLE `questions_option`
  ADD PRIMARY KEY (`option_id`),
  ADD KEY `FK_rk5bajgog1ekt97gxyimaf21v` (`question_no_question_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`s_id`),
  ADD UNIQUE KEY `UK_bx5vwmhlct693d8ihgpsc1c5` (`username`);

--
-- Indexes for table `studentexaminfo`
--
ALTER TABLE `studentexaminfo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_cvi9cg0t8l9frsenw6qhvv22e` (`st_s_id`),
  ADD KEY `FK_8u1duuaugabhnxao3uu1veqy1` (`sub_sub_id`);

--
-- Indexes for table `student_subject`
--
ALTER TABLE `student_subject`
  ADD PRIMARY KEY (`Student_s_id`,`subjectList_sub_id`),
  ADD KEY `FK_go2fnvl41cikjqqrvmyg0dk74` (`subjectList_sub_id`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`sub_id`),
  ADD UNIQUE KEY `UK_dx8l9v8yxqjgu8ohwffd8ewaa` (`sub_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `answer`
--
ALTER TABLE `answer`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `question_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `questions_option`
--
ALTER TABLE `questions_option`
  MODIFY `option_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `s_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `studentexaminfo`
--
ALTER TABLE `studentexaminfo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `sub_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answer`
--
ALTER TABLE `answer`
  ADD CONSTRAINT `FK_doq64u9gfg0fqq13wmacwhcch` FOREIGN KEY (`subjectid_sub_id`) REFERENCES `subject` (`sub_id`),
  ADD CONSTRAINT `FK_ljqm891ywk3128u2dyfkmc69d` FOREIGN KEY (`question_question_id`) REFERENCES `questions` (`question_id`),
  ADD CONSTRAINT `FK_oamnp04lw28qr5hikfg8cmfx` FOREIGN KEY (`student_s_id`) REFERENCES `student` (`s_id`);

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `FK_7i8fc24i9wqpchc73eyxf1y4t` FOREIGN KEY (`subject_sub_id`) REFERENCES `subject` (`sub_id`);

--
-- Constraints for table `questions_option`
--
ALTER TABLE `questions_option`
  ADD CONSTRAINT `FK_rk5bajgog1ekt97gxyimaf21v` FOREIGN KEY (`question_no_question_id`) REFERENCES `questions` (`question_id`);

--
-- Constraints for table `studentexaminfo`
--
ALTER TABLE `studentexaminfo`
  ADD CONSTRAINT `FK_8u1duuaugabhnxao3uu1veqy1` FOREIGN KEY (`sub_sub_id`) REFERENCES `subject` (`sub_id`),
  ADD CONSTRAINT `FK_cvi9cg0t8l9frsenw6qhvv22e` FOREIGN KEY (`st_s_id`) REFERENCES `student` (`s_id`);

--
-- Constraints for table `student_subject`
--
ALTER TABLE `student_subject`
  ADD CONSTRAINT `FK_go2fnvl41cikjqqrvmyg0dk74` FOREIGN KEY (`subjectList_sub_id`) REFERENCES `subject` (`sub_id`),
  ADD CONSTRAINT `FK_sf3nuauqpjs762khwcowayajx` FOREIGN KEY (`Student_s_id`) REFERENCES `student` (`s_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
