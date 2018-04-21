<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Forgotpass.aspx.cs" Inherits="Account_tryemail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="main">
    <h3>Forgot Password</h3>
    <asp:Panel runat="server" Height="400px">
    <p>Please enter your email address</p>
        <p><asp:Label ID="lblnoti" runat="server" Text="" Visible="False"></asp:Label></p>
              <asp:ValidationSummary ID="val1" runat="server" CssClass="failureNotification" ShowMessageBox="True" ShowSummary="False"/>
         
    <span id="emel"  onresize="false" contenteditable="false" runat="server">Email: <input type="text" id="em" name="email" runat="server" onresize="false" onresizestart="false" contenteditable="false" style="width: 200px" />
        <asp:Button ID="Button1" runat="server" Text="Send" OnClick="Button1_Click" />
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="em" CssClass="failureNotification" ErrorMessage="Please enter a valid email address" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" >*</asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="em" CssClass="failureNotification" ErrorMessage="E-mail is required." >*</asp:RequiredFieldValidator>
    </span>
    <span id="try" runat="server" visible="false">
        <asp:Button ID="Button2" runat="server" Text="Try again" OnClick="Button2_Click" />
    </span> 
    </asp:Panel>
    </div>                       
</asp:Content>

