using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_tryemail : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Init(object sender, EventArgs e)
    {
        ViewStateUserKey = Session.SessionID;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
     
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        bool check = false;
        var users = Membership.GetAllUsers();
        string uname ="";
        emel.InnerText = Server.HtmlEncode(em.Value.ToLower());
        var userList = new List<MembershipUser>();
        foreach (MembershipUser user in users)
        {
            string email = user.Email;

            if (email == emel.InnerText)
            {
                uname = user.UserName;
                check = true;
            }
           
        }
        if (check == false)
        {
            lblnoti.Visible = true;
            lblnoti.ForeColor = System.Drawing.Color.Red;
            lblnoti.Text = "This email: " + emel.InnerText + " does not exist";
            emel.Visible = false;
            @try.Visible = true;
        }
        else
        {
            try
            {
                con.Open();
                DateTime dt = DateTime.Now;
                int returnValue = -1;

                // define query to be executed
                string query = "insert into recover_pass (UserName, reqdate) values (@UserName, @reqdate);SELECT SCOPE_IDENTITY();";

                // set up SqlCommand in a using block   
                SqlCommand objCMD;
                using (objCMD = new SqlCommand(query, con))
                {
                    // add parameters using regular ".Add()" method 
                    objCMD.Parameters.Add("@UserName", SqlDbType.NVarChar, 256).Value = uname;
                    objCMD.Parameters.Add("@reqdate", SqlDbType.DateTime).Value = dt;

                    // open connection, execute query, close connection
                    object returnObj = objCMD.ExecuteScalar();

                    if (returnObj != null)
                    {
                        int.TryParse(returnObj.ToString(), out returnValue);
                    }

                    con.Close();
                }
                int MID = returnValue;
                
                MailMessage message = new MailMessage();
                message.IsBodyHtml = true;
                message.From = new MailAddress("gisportaltm@gmail.com");
                message.To.Add(new MailAddress(emel.InnerText));
                //message.CC.Add(new MailAddress("ir.rahman95@gmail.com"));
                message.Subject = "Reset Password GIS Portal";
                message.Body = "Hi "+uname+",<br /><br />Looks like you have forgotten the password. Hurry up, the link below will be expired in 24 hours. TQ. <br /><a href=http://localhost:56414/Resetpass.aspx?email=" + emel.InnerText + "&uname=" + uname + "&reqid=" + MID + ">Click here to change your password</a>";
                SmtpClient client = new SmtpClient();
                client.Send(message);

                lblnoti.Visible = true;
                lblnoti.ForeColor = System.Drawing.Color.Black;
                lblnoti.Text = "Reset pasword link has been send to your email and will be expired in 24 hours";


            }
            catch(Exception)
            {
                lblnoti.Visible = true;
                lblnoti.Text = "Error, cannot send email";
            }
        }

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Forgotpass.aspx");
    }
}