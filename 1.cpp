#include <iostream>
#include <conio.h>
#include <string.h>

using namespace std;
class date
{ int day, year;
 char month[15];
 public:
 // constructor with default argumen
 // constructor must have the same name as class neme
 date(int a=1, char b[]="January", int c=2008);
 void print();
};
// constructor implementation
date::date(int a, char b[], int c)
{ day = a;
 strcpy (month,b);
 year = c;
}
void date::print()
{ cout << "\nThe date is : " << day << "-" << month << "-" << year;
}
main()
{
 date birthDate; // date instance use default argument
 birthDate.print();
 getch();
} 
