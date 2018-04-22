<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="About.aspx.cs" Inherits="About" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">

    <script language="javascript" type="text/javascript">
        function printDiv(divID) {
            //Get the HTML of div
            var divElements = document.getElementById(divID).innerHTML;
            //Get the HTML of whole page
            var oldPage = document.body.innerHTML;

            //Reset the page's HTML with div's HTML only
            document.body.innerHTML = "<html><head><title></title></head><body>" + divElements + "</body>";

            //Print Page
            window.print();

            //Restore orignal HTML
            document.body.innerHTML = oldPage;

            //disable postback on print button
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="main">
        <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></cc1:ToolkitScriptManager>
    <h3>
        About Us
    </h3><hr /><div class ="right">
         <input type="button" value="Print" onclick="javascript:printDiv('print')" />
            &nbsp<asp:Button ID="Button1" OnClick="btnCreatePDF_Click" runat="server" Text="PDF" />
</div><br />
    <div id="print"> 
        <div class="center">
            <h4>Organization Structure</h4>
            <asp:Panel ID="Panel6" runat="server" > 
            <br /><br /><br /><br />
            <asp:ImageButton ID="ImageButton1" Width="80%" runat="server" ImageUrl="~/img/gis.png" BorderColor="#FF6600" BorderStyle="Solid" BorderWidth="2px" />
            <cc1:PopupControlExtender ID="PopupControlExtender1" runat="server" TargetControlID="ImageButton1" PopupControlID="Panel1" Position="Center"></cc1:PopupControlExtender>
            <div class="main">
            <asp:Panel ID="Panel1" Width="100%" runat="server" BackColor="White">
                <asp:Image ID="Image1" runat="server" Width="75%" ImageUrl="~/img/gis.png" />
            </asp:Panel>
            </div>
            <br /><br /><br /><br /><br />
            <asp:ImageButton ID="ImageButton2" Width="80%" runat="server" ImageUrl="~/img/gis-bis.png" BorderColor="#FF6600" BorderStyle="Solid" BorderWidth="2px" PostBackUrl="~/img/gis-bis.png" />
            <cc1:PopupControlExtender ID="PopupControlExtender2" runat="server" TargetControlID="ImageButton2" PopupControlID="Panel2" Position="Center"></cc1:PopupControlExtender>
            <div class="main">
            <asp:Panel ID="Panel2" Width="100%" runat="server" BackColor="White">
                <asp:Image ID="Image2" runat="server" Width="75%" ImageUrl="~/img/gis-bis.png" />
            </asp:Panel>
            </div>
            <br /><br /><br /><br /><br />
            <asp:ImageButton ID="ImageButton3" Width="80%" runat="server" ImageUrl="~/img/gis-sg.png" BorderColor="#FF6600" BorderStyle="Solid" BorderWidth="2px" PostBackUrl="~/img/gis-sg.png" />
            <cc1:PopupControlExtender ID="PopupControlExtender3" runat="server" TargetControlID="ImageButton3" PopupControlID="Panel3" Position="Center"></cc1:PopupControlExtender>
            <div class="main">
            <asp:Panel ID="Panel3" Width="100%" runat="server" BackColor="White">
                <asp:Image ID="Image3" Width="75%" runat="server" ImageUrl="~/img/gis-sg.png" />
            </asp:Panel>
            </div>
            <br /><br /><br /><br /><br />
            <asp:ImageButton ID="ImageButton4" Width="80%" runat="server" ImageUrl="~/img/gis-dtm.png" BorderColor="#FF6600" BorderStyle="Solid" BorderWidth="2px" PostBackUrl="~/img/gis-dtm.png" />
            <cc1:PopupControlExtender ID="PopupControlExtender4" runat="server" TargetControlID="ImageButton4" PopupControlID="Panel4" Position="Center"></cc1:PopupControlExtender>
            <div class="main">
            <asp:Panel ID="Panel4" Width="100%" runat="server" BackColor="White">
                <asp:Image ID="Image4" Width="75%" runat="server" ImageUrl="~/img/gis-dtm.png" />
            </asp:Panel>
            </div>
            <br /><br /><br /><br /><br />
            <asp:ImageButton ID="ImageButton5" Width="90%" runat="server" ImageUrl="~/img/gis-op.png" BorderColor="#FF6600" BorderStyle="Solid" BorderWidth="2px" PostBackUrl="~/img/gis-op.png" />
            <cc1:PopupControlExtender ID="PopupControlExtender5" runat="server" TargetControlID="ImageButton5" PopupControlID="Panel5" Position="Center"></cc1:PopupControlExtender>
             <div class="main">
                <asp:Panel ID="Panel5" runat="server" Width="100%" BackColor="White">
                    <asp:Image ID="Image5" Width="75%" runat="server"  ImageUrl="~/img/gis-op.png" />     
                </asp:Panel>
           </div>
           </asp:Panel>
        </div>
     </div>
    
   </div>
</asp:Content>
