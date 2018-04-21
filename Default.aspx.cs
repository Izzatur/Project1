using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Init(object sender, EventArgs e)
    {
        ViewStateUserKey = Session.SessionID;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            ModalPopupExtender1.Show();
        }
    }
    protected void R1_ItemDataBound(Object Sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Label lbl = (Label)e.Item.FindControl("Lblno");
            Label lbl2 = (Label)e.Item.FindControl("Label4");
            int i = Repeater1.Items.Count + 1;
            lbl.Text = i.ToString();

        }


    }
    protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        //if(ListView1.Items.Count >= 0)
        //Label1.Text = ListView1.Items.Count.ToString();
    }
}
