using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Resetpass : System.Web.UI.Page
{
    protected void Page_Init(object sender, EventArgs e)
    {
        ViewStateUserKey = Session.SessionID;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["uname"] == null && Request.QueryString["reqid"] == null)
        {
            DetailsView1.Enabled = false;
            Response.Write("<script>alert('Your request has expired');window.location ='default.aspx';</script>");
        }
    }
    protected void DetailsView1_DataBound(object sender, EventArgs e)
    {
        if (DetailsView1.DataItemCount == 0)
        {
            panel1.Visible = false;
            Label1.Visible = true;
            Label1.Text = "Your request ticket does not exist.";
        }
        if (Request.QueryString["uname"] != null && Request.QueryString["reqid"] != null && DetailsView1.DataItemCount > 0)
        {
            Label date = DetailsView1.Rows[2].FindControl("lbldate") as Label;

            DateTime ending = Convert.ToDateTime(date.Text);
            ending = ending.AddHours(24);

            if (DateTime.Now > ending)
            {
                panel1.Visible = false;
                Label1.Visible = true;
            }
        }
    }
protected void Button1_Click(object sender, EventArgs e)
    {
        string username = Request.QueryString["uname"];
        string password = TextBox2.Text;
        MembershipUser mu = Membership.GetUser(username);
        mu.ChangePassword(mu.ResetPassword(), password);
        Response.Write("<script>alert('Your password successfully changed');window.location ='Account/Login.aspx';</script>");
    }
}