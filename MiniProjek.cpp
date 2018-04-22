//Mini Projek (HANDPHONE SIMULATION)
//Muhamad Izzatur Rahman
//Mior Muhammad Lutfi
//Firdaus 
//Nur Syuhaidah
#include <iostream>
#include <iomanip>
#include <fstream>
#include <conio.h>  //for getch()
#include <string>
#include <cstdlib>
using namespace std;


class Node{
	public:
		string name, email, phoneNo, namelog, time, date, name2, email2, phoneNo2;
		Node* next;
		Node* next2;
		Node* next3;
};

class Contacts{
	private:
		Node* first;
		Node* head; 
		Node* backPtr;
		Node* head2; 
	public:
		Contacts() {head = NULL; backPtr=NULL; head2 = NULL;}
		~Contacts();
		bool isEmpty() { return head == NULL ;}//&& backPtr == NULL; }
		bool isEmpty2() { return first == NULL ; backPtr == NULL;}
		void insertContact(string, string, string);
		void readFile();
		void contactTop();
		void print(); //print contact 
		void contSearch(int); //search contact
		void Admin(); 
		void Guest();
		void incNameSort();
		void decNameSort();
		void popContact(); //delete top of contact
		void deleteContact(int);
		void editContact(int);
		void sendMsg();
		void retrieveMsg();
		void callLog(); //read the call log text file
		void insertLog(string, string, string);
		void printLog();
		void insert(string, string, string);
		void BackSort();
};

//-------------------------------------------------DESTRUCTOR CONTACT------------------------------------------------------------------------------------------------------

Contacts :: ~Contacts()
{	Node* temp2 = backPtr;
	Node* temp = head;
	while (temp)
	{
		head = head->next;
		delete temp;
		temp = head;
	}
	while (temp2)
	{
		backPtr = backPtr->next;
		delete temp2;
		temp2 = backPtr;
	}
}

//-------------------------------------------------INSERT CONTACT------------------------------------------------------------------------------------------------------

void Contacts :: insertContact(string a, string b, string c)
{
	Node* newNode = new Node;
	newNode->name = a;
	newNode->email = b;
	newNode->phoneNo = c;
	if(isEmpty())
	//	{
		newNode->next = NULL;
	//	backPtr = newNode;
	//	}
	else
	//	{
		newNode->next = head;
	//	backPtr = newNode->next;
	//	backPtr->next2 = newNode;
	//	}
	head = newNode;
}
//-----------------------------------------------------------
/*void Contacts :: insert(string x, string y, string z)
{
	Node* newNode = new Node;
	newNode->name2 = x;
	newNode->email2 = y;
	newNode->phoneNo2 = z;
	Node *currNode = first;
	if(isEmpty2())
	{
		newNode->next2 = first;
		first = newNode;
	}
	else
	{
	    //newNode->next2 = backPtr;
	    currNode->next= newNode;
		newNode->next=NULL;
	}
	currNode=currNode->next;
	//backPtr=newNode;
}
*/
//--------------------------------------------------READ CONTACT TEXT FILE-----------------------------------------------------------------------------------------------------

void Contacts :: readFile()
{
	string a, b, c;
	ifstream fin;
	fin.open("contacts.txt");
	
	while(!fin.eof())
	{
		fin>>a>>b>>c;
	//	fin.ignore();			// To ignore unwanted character
		insertContact(a, b, c);	
	//	insert(a,b,c);
	}
	fin.close();
}

//----------------------------------------------------TOP CONTACT---------------------------------------------------------------------------------------------------

void Contacts :: contactTop()
{
	if (isEmpty())
		cout <<"Sorry, Contact is still empty!"<<endl;
	else
	{
		cout<<"\n\t---- VIEW TOP OF CONTACT LIST ----\n";
		cout<<left<<setw(12)<<"NAME"<<setw(25)<<"E-MAIL"<<setw(15)<<"PHONE NO."<<endl;				
		cout<<"--------------------------------------------------------"<<endl;	
		cout<<left<<setw(12)<<head->name<<setw(25)<<head->email<<setw(15)<<head->phoneNo<<endl;
		cout<<"--------------------------------------------------------\n"<<endl;
	}
}

//----------------------------------------------------PRINT CONTACT---------------------------------------------------------------------------------------------------

void Contacts :: print()
{
	Node* currNode = head;
	int num = 0;
	cout<<left<<"NO. "<<setw(12)<<"NAME"<<setw(25)<<"E-MAIL"<<setw(15)<<"PHONE NO."<<endl;				
	cout<<"--------------------------------------------------------"<<endl;
	while(true)
	{
		num++;
		cout<<left<<"("<<num<<") "<<setw(12)<<currNode->name<<setw(25)<<currNode->email<<setw(15)<<currNode->phoneNo<<endl;
		if(currNode->next == NULL) break;
		currNode = currNode->next;
	}
	cout<<"--------------------------------------------------------\n"<<endl;
}

//----------------------------------------------------SORT CONTACT NAME A-Z---------------------------------------------------------------------------------------------------

void Contacts :: incNameSort ()
{	
	Node * curr = head;
    Node * next;
    string temp;

    while (curr && curr->next)
    {
        Node * next = curr->next;
        while (next)
        {
            if (curr->name > next->name)
            {
                temp = curr->name;
                curr->name = next->name;
                next->name = temp;
                temp = curr->email;
                curr->email = next->email;
                next->email = temp;
                temp = curr->phoneNo;
                curr->phoneNo = next->phoneNo;
                next->phoneNo = temp;
            }
            next = next->next;
        }
        curr = curr->next;
    }
}

//------------------------------------------------------SORT CONTACT NAME Z-A-------------------------------------------------------------------------------------------------

void Contacts :: decNameSort()
{	
	Node * curr = head;
    Node * next;
    string temp;

    while (curr && curr->next)
    {
        Node * next = curr->next;
        while (next)
        {
            if (curr->name < next->name)
            {
                temp = curr->name;
                curr->name = next->name;
                next->name = temp;
                temp = curr->email;
                curr->email = next->email;
                next->email = temp;
                temp = curr->phoneNo;
                curr->phoneNo = next->phoneNo;
                next->phoneNo = temp;
            }
            next = next->next;
        }
        curr = curr->next;
    }
}

//-----------------------------------------------BACK SORT--------------------------------------------------------------------------------------------------------------

void Contacts :: BackSort()
{	
	Node * curr = head;
    Node * next;
    string temp;

    while (curr && curr->next)
    {
        Node * next = curr->next;
        while (next)
        {
            if (next->next == NULL) break;
            {
                temp = curr->name;
                curr->name = next->name;
                next->name = temp;
                temp = curr->email;
                curr->email = next->email;
                next->email = temp;
                temp = curr->phoneNo;
                curr->phoneNo = next->phoneNo;
                next->phoneNo = temp;
            }
            next = next->next;
        }
        curr = curr->next;
    }
}


//-----------------------------------------------------SEARCH CONTACT--------------------------------------------------------------------------------------------------

void Contacts :: contSearch(int num)
{
	Node* currNode = head;
	cout << endl;

	switch(num)
	{
		case 1:		// Search case for name
			{
				string nama;
				cout << "\tSearch by Name -> ";
				cin >> nama;
				cout<<left<<setw(12)<<"NAME"<<setw(25)<<"E-MAIL"<<setw(15)<<"PHONE NO."<<endl;
				cout<<"--------------------------------------------------------"<<endl;
				while(true)
					{
						if(currNode->name == nama)
						cout<<left<<setw(12)<<currNode->name<<setw(25)<<currNode->email<<setw(15)<<currNode->phoneNo<<setw(15)<<endl;
						if(currNode->next == NULL) break;
						currNode = currNode->next;
					}
					break;
			}

		case 2:		// Search case for email
			{
				string emel;
				cout << "\n\tSearch by e-mail -> ";
				cin >> emel;
				cout<<left<<setw(12)<<"NAME"<<setw(25)<<"E-MAIL"<<setw(15)<<"PHONE NO."<<endl;
				cout<<"--------------------------------------------------------"<<endl;
				while(true)
					{
						if(currNode->email == emel)		
						cout<<left<<setw(12)<<currNode->name<<setw(25)<<currNode->email<<setw(15)<<currNode->phoneNo<<setw(15)<<endl;
						if(currNode->next == NULL) break;
						currNode = currNode->next;
					}					
					break;
			}

		case 3:		// Search case for phone number
			{
				string pNo;
				cout << "\n\tSearch by Phone Number -> ";
				cin >> pNo;
				cout<<left<<setw(12)<<"NAME"<<setw(25)<<"E-MAIL"<<setw(15)<<"PHONE NO."<<endl;
				cout<<"--------------------------------------------------------"<<endl;
					while(true)
					{
						if(currNode->phoneNo == pNo)
						cout<<left<<setw(12)<<currNode->name<<setw(25)<<currNode->email<<setw(15)<<currNode->phoneNo<<setw(15)<<endl;
						if(currNode->next == NULL) break;
						currNode = currNode->next;
					}					
					break;
			}
			
		default:
			cout<<"\n\tYou Entered Wrong Code Number Try Again!\n"<<endl;
	}
	
	cout<<"--------------------------------------------------------"<<endl<<endl;
}

//-----------------------------------------------------POP CONTACT--------------------------------------------------------------------------------------------------

void Contacts :: popContact()
{ 
	Node *delnode;
	if (isEmpty())
		cout <<"\nSorry, Cannot pop item from stack.Stack is still empty!" <<endl;
	else
	{ 
		delnode = head;
		cout << "\n\tContact to be popped from stack is: \n"<<endl;
		cout << left << setw(12) << "NAME" <<setw(25) << "E-MAIL" << setw(15) << "PHONE NO." << endl;				
		cout << "--------------------------------------------------------" << endl;
		cout << left << setw(12) << head->name << setw(25) << head->email <<setw(15) << head->phoneNo << endl;
		cout << "--------------------------------------------------------" << endl;
		head = delnode->next;
		delete(delnode);
	}// end else
} // end pop


//-----------------------------------------------------DELETE CONTACT--------------------------------------------------------------------------------------------------

void Contacts :: deleteContact(int x)
{
	Node* nextNode = NULL; 
	Node* currNode = head; 
	int currIndex = 1;
	while(currIndex != x) 
	{ 
	nextNode = currNode; 
	currNode = currNode->next; 
	currIndex++; 
	}
	 
	if (currNode) 
	{ 
	  if (nextNode) 
	 { 
	  nextNode->next = currNode->next; 
	  delete currNode;
	 }
	  else 
	 { 
	  head = currNode->next; 
	  delete currNode;
	 }

	} 
		
}

//-----------------------------------------------------EDIT CONTACT--------------------------------------------------------------------------------------------------

void Contacts :: editContact(int y)
{
	Node* nextNode = NULL; 
	Node* currNode = head;
	string a,b,c; 
	int currIndex = 1;
	
	while(currIndex != y)  
	{ 
	nextNode = currNode; 
	currNode = currNode->next; 
	currIndex++; 
	}
	
	cout<<"\t\tEnter Name: ";
	cin>>a;
	cout<<"\t\tEnter Email: ";
	cin>>b;
	cout<<"\t\tEnter Phone No.: ";
	cin>>c;
	cout<<endl;
	
	currNode->name=a;
	currNode->email=b;
	currNode->phoneNo=c; 			
}

//-----------------------------------------------------SEND MESSAGE--------------------------------------------------------------------------------------------------

void Contacts :: sendMsg()
{
	ofstream fout;
	char add;
	string x,y;
	Node* currNode = head;

	print();
	cout<<"\t\tEnter Contact Name: ";
	cin.ignore(256, '\n');
	getline(cin,x);
					while(true)
					{
						if(currNode->name == x)
						{
							fout.open (x.c_str());
							cout<<"\t~~~~~~~~ Type A Message Below ~~~~~~~~~~~\n\t";
							getline(cin,y);
							fout<<y;
							cout<<"\n\t~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n";
							cout<<"\t\t\tMessage Sent\n";
							fout.close();
							break;
						}
						if(currNode->next == NULL) break;
						currNode = currNode->next;

					} //break;
	//currNode = head;
	if(currNode->name != x)
	{
	cout<<"\n\t-- Cannot Find That Contact Name!\n";
	cout<<"\t-- Do You Want to Add The Contact first?\n";
	cout<<"\t-- Add(A\a) or Press Any Key If Not -> ";
	cin>>add;
	if(add == 'A' || add == 'a')
	{
		string a,b,c;
		cout<<"\tEnter Name : ";
		cin>>a;
		cout<<"\tEnter E-mail : ";
		cin>>b;
		cout<<"\tEnter Phone Number : ";
		cin>>c;
		insertContact(a,b,c);
		cout<<"\n\t---- CONTACT ADDED ----\n";
		cin.ignore();
		fout.open (a.c_str());
		cout<<"\t~~~~~~~~ Type A Message Below ~~~~~~~~~~~\n\t";
		getline(cin,y);
		fout<<y;
		cout<<"\n\t~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n";
		cout<<"\tMessage Sent\n";
		fout.close();		
	} 	
	}
}

//-----------------------------------------------------RETRIEVE MESSAGE--------------------------------------------------------------------------------------------------

void Contacts :: retrieveMsg()
{
  string line,x;
  cout<<"\n\tContact Name: ";
  cin.ignore();
  getline(cin,x);
  ifstream myfile (x.c_str());
  if (myfile.is_open())
  {
    while ( getline (myfile,line) )
    {
      cout <<"\n\tNAME: "<<x<<endl;
      cout<<"\t~~~~~~~~ Content of Message Below ~~~~~~~~~~\n\t";
	  cout << line << '\n';
 	  cout<<"\n\t~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n";
	 }
  }
  else cout << "\tNO MESSAGE FROM THAT CONTACT"; 
    
	myfile.close();
}

//-----------------------------------------------------READ CALL LOG TEXT FILE--------------------------------------------------------------------------------------------------

void Contacts :: callLog()
{ head2=NULL;
  int log, n=0;
  string a, b, c;
  
  cout<<"\n\t\t--- Choose ---\n\n";
  cout<<"\t\t1.MISSED CALLS\n\t\t2.RECEIVED CALLS\n\t\t3.DIALLED NUMBERS\n\t\t-> ";
  cin>>log;
  
  if(log == 1)
  {
  	ifstream myfile1 ("MISSED CALLS.txt");
	  	while(!myfile1.eof())  
   {
   	  n++;
   	  myfile1>>a>>b>>c; 
   	  insertLog(a,b,c);
   }
	myfile1.close();
   	printLog();
  }
  
  else if(log == 2)
  {
  	ifstream myfile2 ("RECEIVED CALLS.txt");
  	while(!myfile2.eof())  
   {
   	  n++;
   	  myfile2>>a>>b>>c; 
   	  insertLog(a,b,c);  
   }
	myfile2.close();
	printLog();
  }
  
  else if(log == 3)
  {
  	ifstream myfile3 ("DIALLED NUMBERS.txt");
  	while(!myfile3.eof())  
   {
   	  n++;
   	  myfile3>>a>>b>>c; 
   	  insertLog(a,b,c);
   }
	myfile3.close();	
  	printLog();
  }
  
  else cout << "\t\tWrong Choose of Code\n"; 
}

//-----------------------------------------------------INSERT LOG--------------------------------------------------------------------------------------------------

void Contacts :: insertLog(string a, string b, string c)
{
	Node* newNode = new Node;
	newNode->namelog = a;
	newNode->time = b;
	newNode->date = c;
	
	if(isEmpty())
		newNode->next = NULL;
	else
		newNode->next = head2;

	head2 = newNode;
}

//-----------------------------------------------------PRINT LOG--------------------------------------------------------------------------------------------------

void Contacts :: printLog()
{
	Node* currNode = head2;
	int num = 0;
	cout<<left<<"N0. "<<setw(12)<<"NAME"<<setw(25)<<"TIME"<<setw(15)<<"DATE"<<endl;				
	cout<<"--------------------------------------------------------"<<endl;
	while(true)
	{
		num++;
		cout << left << "("<<num<<") " << setw(12) << currNode->namelog <<setw(25) <<currNode->time /*<< setw(15)*/ << currNode->date << endl;
		if(currNode->next == NULL) break;
		currNode = currNode->next;
	}
	cout<<"--------------------------------------------------------\n"<<endl;
}

//-----------------------------------------------------ADMIN MENU--------------------------------------------------------------------------------------------------

void Contacts :: Admin(){
	char back;
	int menu, code, code2;
	bool flag = false;
		do
		{	
			cout<<"\n\t\t-- Menu --"<<endl<<endl;
			cout<<"\t\t1. Contacts\n";
			cout<<"\t\t2. Messages\n";
			cout<<"\t\t3. View Log\n";
			cout<<"\n\tEnter '1', '2', or '3' : ";
			cin>>menu;
			if(menu==1)
			{	
				cout<<"\n\t--Choose the following options--\n\n";
				cout<<"\t1) View the unsorted Contacts\n";
				cout<<"\t2) View the sorted Contacts Names from A-Z\n";
				cout<<"\t3) View the sorted Contacts Names from Z-A\n";
				cout<<"\t4) Searching Contacts by Name/e-mail/Phone Number\n";
				cout<<"\t5) Add the Contacts\n";
				cout<<"\t6) Delete the Contacts\n";
				cout<<"\t7) Edit the Contacts\n";
				cout<<"\t8) Display Recently Added Contacts\n\n";
				cout<<"\n\tEnter your options code : ";
				cin>>code;
				cout<<endl;
			
				switch(code)
				{
					case 1:
						{
							cout<<"\t--DISPLAY UNSORTED CONTACTS--\n";
							flag = true;
							break;
						}

					case 2:
						{
							incNameSort();
							cout<<"  --DISPLAY THE CONTACTS NAME SORTED FROM A-Z--\n";
							flag = true;
							break;
						}
			
					case 3:
						{
							decNameSort();
							cout<<"  --DISPLAY THE CONTACTS NAME SORTED FROM Z-A--\n";
							flag = true;
							break;
						}
			
					case 4:
						{
							int number;
							cout<<"\tEnter the following number to choose for searching: "<<endl<<endl;
							cout<<"\t1 -	Search by Name"<<endl;
							cout<<"\t2 -	Search by e-mail"<<endl;
							cout<<"\t3 -	Search by Phone Number\n"<<endl;
							cout<<"\n\tEnter code : ";
							cin >> number;
							contSearch(number);
							flag = false;
							break;
						}
					case 5:
						{
							ofstream fout;
							fout.open("contacts.txt");
							string a,b,c;
							cout<<"\tEnter Name : ";
							cin>>a;
							cout<<"\tEnter E-mail : ";
							cin>>b;
							cout<<"\tEnter Phone Number : ";
							cin>>c;
							insertContact(a,b,c);
							print();
							cout<<"\n\t   ---- CONTACT ADDED ----\n";
							BackSort();
							Node* currNode = head;
							while(true)
							
							{				
								fout<<currNode->name<<" "<<currNode->email<<" "<<currNode->phoneNo<<endl;
								if(currNode->next == NULL) break;
								currNode = currNode->next;
							}
							fout.close();
							flag = false;
							break;
						} 
					case 6:
						{
							int a,no;
							cout<<"\t---- Choose ----\n";
							cout<<"\t1. Delete Recently added contact\n";
							cout<<"\t2. Delete a contact by choose it manually\n\t-> ";
							cin>>a;
							print();
							
							if (a==1)
								popContact();
							
							else
							{
								cout<<"\tEnter No. of Contact You Want to DELETE\n";
								cout<<"\tNo.-> ";
								cin>>no;
								cout<<endl;
								deleteContact(no);
							}
							flag = true;
							cout<<"\n\t   ---- CONTACT DELETED ----\n";							
							break;
									
						} 
					case 7:
						{
							int no;
							print();
							cout<<"\tEnter No. of Contact You Want to EDIT\n";
							cout<<"\tNo.-> ";
							cin>>no;
							cout<<endl;
							editContact(no);
							cout<<"\t---- CONTACT UPDATED ----\n";
							flag = true;
							break;
						}  	
					case 8:
					 	{
					 		contactTop();
					 		flag = false;
					 		break;
					 	}
						 	
					default:
						cout<<"\t-- You entered the wrong code number --"<<endl;
				}
	
				if(flag == true) //condition to print 
				{
					print();				
				}
		
			}
			else if(menu==2)
			{
				cout<<"\n\t\t-- Choose the following options --\n\n";
				cout<<"\t\t1) Send The Message\n";
				cout<<"\t\t2) Retrieve The Message\n";						
				cout<<"\n\t\tEnter your options code : ";
				cin>>code2;
								
				if (code2 == 1)
				{					
					sendMsg();					
				}
				else if(code2 == 2)
				{
					retrieveMsg();
				}
				else
					cout<<"\t\t-- You entered the wrong code number --"<<endl;
			}
			else if(menu == 3)
			{
				callLog();				
			}
			else
				cout<<"\t\tWRONG SELECTION FROM MENU\n";
	
		cout<<"\n\tPress BACKSPACE to go Back From Main Menu -> "; //user enter to loop or not
		back = getch();
		cout<<endl;
		system("cls");
		}
		while (back == '\b'); 
	
}

//---------------------------------------------------GUEST MENU----------------------------------------------------------------------------------------------------

void Contacts :: Guest(){
	char back;
	int menu, code, code2;
	bool flag = false;
		do
		{
			cout<<"\n\t\t-- Menu --"<<endl<<endl;
			cout<<"\t\t1. Contacts\n";
			cout<<"\t\t2. Messages\n";
			cout<<"\t\t3. View Log\n";
			cout<<"\n\tEnter '1', '2', or '3' : ";
			cin>>menu;
			if(menu==1)
			{	
				cout<<"\n\t-- Choose the following options --\n\n";
				cout<<"\t1) View the unsorted Contacts\n";
				cout<<"\t2) View the sorted Contacts Names from A-Z\n";
				cout<<"\t3) View the sorted Contacts Names from Z-A\n";
				cout<<"\t4) Searching Contacts by Name/e-mail/Phone Number\n";
				cout<<"\t5) Display Recently Added Contacts\n\n";

				cout<<"\n\tEnter your options code : ";
				cin>>code;
				cout<<endl;
			
				switch(code)
				{
					case 1:
						{
							cout<<"\t--DISPLAY UNSORTED CONTACTS--\n";
							flag = true;
							break;
						}

					case 2:
						{
							incNameSort();
							cout<<"  --DISPLAY THE CONTACTS NAME SORTED FROM A-Z--\n";
							flag = true;
							break;
						}
			
					case 3:
						{
							decNameSort();
							cout<<"  --DISPLAY THE CONTACTS NAME SORTED FROM Z-A--\n";
							flag = true;
							break;
						}
			
					case 4:
						{
							int number;
							cout<<"\tEnter the following number to choose for searching: "<<endl<<endl;
							cout<<"\t1 -	Search by Name"<<endl;
							cout<<"\t2 -	Search by e-mail"<<endl;
							cout<<"\t3 -	Search by Phone Number\n"<<endl;
							cout<<"\n\tEnter code : ";
							cin >> number;
							contSearch(number);
							flag = false;
							break;
						}
						case 5:
					 	{
					 		contactTop();
					 		flag = false;
					 		break;
					 	}
					 	
						default:
							cout<<"\t-- You entered the wrong number --"<<endl;
				}
	
				if(flag == true) //condition to print sorted & unsorted contacts
				{
			
					print();
	
				}
		
			}
			else if(menu==2)
			{
				cout<<"\n\t\t1) Retrieve The Message\n";			
				cout<<"\n\t\tEnter your options code : ";
				cin>>code2;				
				if(code2 == 1)
				{
					retrieveMsg();
				}
				else
					cout<<"\t-- You entered the wrong code number --"<<endl;		
			}
			
			else if(menu == 3)
			{
				callLog();				
			}			
			
			else
				cout<<"t\tWRONG SELECTION FROM MENU\n";
	
		cout<<"\n\tPress BACKSPACE to go Back From Main Menu -> "; //user enter to loop or not
		back = getch();
		cout<<endl;
		system("cls");
		}
		while (back == '\b'); 
}

//-------------------------------------------------------------------------------------------------------------------------------------------------------

int main()
{
	char loop, user, x[6];
	Contacts list;

	cout<<"=============================================\n";
	cout<<"\tHANDPHONE SIMULATION SYSTEM\n";
	cout<<"=============================================\n\n";	
	
	list.readFile();
	
	do	
	{
	cout<<"\t\t-- CHOOSE USER --\n\n\t\tA) Admin\n\t\tG) Guest\t\n\t\tEnter code: ";
	cin>>user;
	if(user=='a' || user== 'A')
	 {	
	  cout<<"\tEnter The Admin Password -> ";
	  int i = 0;
	  while (true)
	  {
        x[i]=getch();
        cout<<"*";
		
        if(x[i]=='\r') //check if enter key is pressed
            break;

        else if(x[i]=='\b')
		{

            if(i==0)
                cout<<"\b"<<" "<<"\b";
            else if(i>=1)
			{
                x[i-1]='\0';//make the previous byte null if backspase is pressed
                i=i-2;
                cout<<"\b"<<" "<<"\b\b"<<" "<<"\b";
            }

        }
        i++;
      }
    
	 	if (x[0]=='1'&&x[1]=='2'&&x[2]=='3'&&x[3]=='4')
		{
			cout<<"\n\n\t\t-- WELCOME ADMIN --\n";
			list.Admin();
		}
		else
			cout<<"\n\t\tWrong Password Try Again..\n";
	 }	
	else if (user=='g' || user=='G')
	{
		cout<<"\n\t\t-- WELCOME GUEST --\n";
		list.Guest();
	}
	else 
		cout<<"\n\t\t--WRONG USER CODE--";
		
	cout<<"\n\n\t-- PRESS 'ENTER' TO CONTINUE -OR- PRESS ANY KEY TO EXIT -> \n\n";
	loop = getch();
	} while(loop=='\r');
	
	return 0;
}

