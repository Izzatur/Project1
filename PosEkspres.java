import java.io.*;
import java.util.*;
import javax.swing.JOptionPane;

public class PosEkspres
{
	private int id;
	private String region;
	private Envelop envelop;
	private Payment payment;
	private DeliveryStatus status;
	private ArrayList<String> list = new ArrayList<>();

	public PosEkspres(){}

	public PosEkspres(int a, String b, Envelop c, Payment d, DeliveryStatus e)
	{
		id = a;
		region = b;
		envelop = c;
		payment = d;
		status = e;
	}

	public void setId(int id)
	{
		this.id=id;
	}

	public void setRegion(String region)
	{
		this.region=region;
	}

	public int getId()
	{
		return id;
	}

	public String getRegion()
	{
		return region;
	}

	public void displayEnvelop()
	{
		envelop.readData();
	}
	public double getTotal()
	{
		return payment.getTotalPayment();
	}

	public void print()
	{
		System.out.println("ID: "+id);
		System.out.println("Region: "+region);
		System.out.println("Your Tracking Number: " +status.getTrackNo());
	}

	public void retrieveFile1() throws IOException
			{

				BufferedReader reader = new BufferedReader(new FileReader("PosEkspresStatus.txt"));
				while (true){
					String line = reader.readLine();
					if (line == null)
					{break;}
					list.add(line);
				}
				reader.close();
				for(int z=0;z<list.size();z++)
				{
					System.out.println(list.get(z));
				}
			}

	public void setFile1()throws IOException
		{
			retrieveFile1();
			Scanner cin = new Scanner(System.in);
			System.out.print("posekspres ID.:");
			int no = cin.nextInt();
			int start=0;
			int last;
			if(no==1)
			{
			 	start=no-1;
			 	last=start+5;
			}
			else
			{
				start=(no-1)*6;
				last=start+5;
			}

			int z=last;
			while(z>=start)
			{
				System.out.print(z);
				if(z==last)
				{
					System.out.print("Total Payment => RM ");
					double p = cin.nextDouble();
					list.set(z,"Total Payment : RM " +p);
				}

				else if(z==last-1)
				{
					System.out.print("Quantity of Item => ");
					int q = cin.nextInt();
					list.set(z,"Quantity of Item : " +q);
				}
				else if(z==last-2)
				{
					System.out.print("Price of Envelop => RM ");
					double pre = cin.nextDouble();
					list.set(z,"Price of Envelop : RM " +pre);
				}

				else if(z==last-3)
				{
					System.out.print("Tracking No. => ");
					int tr = cin.nextInt();
					list.set(z,"Tracking No. : " +tr);
				}
				else if(z==last-4)
				{
					System.out.print("Item ID => ");
					int item = cin.nextInt();
					list.set(z,"Item ID : " +item);
				}
				z--;
			}
			PrintWriter write = new PrintWriter(new FileWriter("PosEkspresStatus.txt"));
			for(int i=0;i<list.size();i++)
			{
				write.println(list.get(i));
			}
			write.close();

		}

		public void deleteFile1()throws IOException
		{
			retrieveFile1();
			Scanner cin = new Scanner(System.in);
			System.out.print("posekspres ID.:");
			int no = cin.nextInt();
			int start=0;
			int last;
			if(no==1)
			{
			 	start=no-1;
			 	last=start+5;
			}
			else
			{
				start=(no-1)*6;
				last=start+5;
			}

			int z=last;
			while(z>=start)
			{
				System.out.print(z);
				list.remove(z);
				z--;
			}
			PrintWriter write = new PrintWriter(new FileWriter("PosEkspresStatus.txt"));
			for(int i=0;i<list.size();i++)
			{
				write.println(list.get(i));
			}
			write.close();

		}
		public void printFile()throws IOException
		{
			retrieveFile1();
			PrintWriter write = new PrintWriter(new FileWriter("PosEkspresStatus.txt"));

			list.add("Item ID : " +getId());
			list.add("Tracking No. : " +status.getTrackNo());
			list.add("Region : " +getRegion());
			list.add("Price of Envelop : RM " +payment.getPrice());
			list.add("Quantity of Item : " +payment.getQuantity());
			list.add("Total Payment : RM " +payment.getTotalPayment());

			for(int i=0;i<list.size();i++)
			{
				write.println(list.get(i));
			}
			write.close();
		}
}

class Payment
{
	private double price;
	private int quantity;

	public Payment(){}

	public Payment(double a, int b)
	{
		price = a;
		quantity = b;
	}

	public void setPrice(double price)
	{
		this.price=price;
	}

	public void getQuantity(int quantity)
	{
		this.quantity=quantity;
	}

	public double getPrice()
	{
		return price;
	}

	public int getQuantity()
	{
		return quantity;
	}

	public double getTotalPayment()
	{
		return price*quantity;
	}
}

class Envelop
{
	private int type;
	private int noOfEnvelop;

	public Envelop(){}

	public Envelop(int a, int b)
	{
		type = a;
		noOfEnvelop = b;
	}

	public void setType(int type)
	{
		this.type=type;
	}

	public void setNoOfEnvelop(int noOfEnvelop)
	{
		this.noOfEnvelop=noOfEnvelop;
	}

	public int getType()
	{
		return type;
	}

	public int getNoOfEnvelop()
	{
		return noOfEnvelop;
	}

	public static void readData()
	{
		String fileName = "Ukuran.txt";

		String line = null;

		try {

			FileReader fileReader = new FileReader(fileName);

		    BufferedReader bufferedReader = new BufferedReader(fileReader);

			int i=0;
			System.out.println("Below is the informations of Envelop's Size.");
			System.out.println("Code, Size, Max.Weight(gram), Max.Thickness(mm), price(RM)\n");

		    while((line = bufferedReader.readLine()) != null)
		    {
				if(i>=2)
				{
					System.out.printf((i-1)+ ": ");
				}
				i++;
		        System.out.println(line);
		    }
			System.out.println();
		    bufferedReader.close();
		    }

		    catch(FileNotFoundException ex)
		    {
		    	System.out.println("Unable to open file '" + fileName + "'");
		    }
		    catch(IOException ex)
		    {
		        System.out.println("Error reading file '" + fileName + "'");
        	}
	}
}

class DeliveryStatus
{
	private int trackNo;

	public DeliveryStatus()
	{
		//trackNo=a;
	}

	public void setTrackNo(int trackNo)
	{
		this.trackNo=trackNo;
	}

	public int getTrackNo()
	{
			final int minimum = 10000000;
			final int maximum = 99999999;
			trackNo = minimum + (int)(Math.random() * maximum);
			return trackNo;
	}
}