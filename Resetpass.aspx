<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Resetpass.aspx.cs" Inherits="Resetpass" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
         
        .hidden
        {
           display:none;
        }
        .auto-style1 {
            height: 32px;
        }
        .auto-style2 {
            height: 127px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></cc1:ToolkitScriptManager>
    <div class="main">
    <h3>Reset Password</h3>
    <asp:Panel ID="panel1" runat="server" Height="400px">
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="failureNotification" DisplayMode="BulletList" ShowMessageBox="True" ShowSummary="False" />
        <p>Use the form below to reset your password.</p>
        <p>New passwords are required to be a minimum of 6 characters in length.</p>
        <br />
    <table class="auto-style2"><tr><td>
      New Password:</td><td> <asp:TextBox ID="TextBox1" runat="server" TextMode="Password"></asp:TextBox>
          <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="TextBox1" CssClass="failureNotification" ErrorMessage="Password is required." >*</asp:RequiredFieldValidator>
          <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage='Password length must be 6 characters or above' ControlToValidate="TextBox1" CssClass="failureNotification" ValidationExpression='^[\s\S]{6,}$' Text="*"></asp:RegularExpressionValidator>                                 
          <cc1:PasswordStrength ID="NewPassword_PasswordStrength" runat="server" Enabled="True" PreferredPasswordLength="16" TargetControlID="TextBox1">
          </cc1:PasswordStrength>
                        </td></tr>
      <tr><td class="auto-style1">Confirm New Password:</td> <td class="auto-style1"><asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
          <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="TextBox2" CssClass="failureNotification" ErrorMessage="Confirm Password is required." >*</asp:RequiredFieldValidator>
          <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="TextBox1" ControlToValidate="TextBox2" CssClass="failureNotification" ErrorMessage="The Password and Confirmation Password must match.">*</asp:CompareValidator>
          </td></tr>
        <tr><td colspan="2"><div class="center">
            <asp:Button ID="Button1" runat="server" Text="Change" OnClick="Button1_Click" /></div></td>
        </tr>
    </table>
    </asp:Panel>
    <asp:Label ID="Label1" runat="server" Text="Your reset password request has expired." Visible="False"></asp:Label>
    <div class="hidden">
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="400px" AutoGenerateRows="False" DataKeyNames="Id" 
        DataSourceID="SqlDataSource1" EmptyDataText="Your request ticket does not exist." CellPadding="4" 
        ForeColor="#333333" GridLines="None" OnDataBound="DetailsView1_DataBound" >
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
            <asp:TemplateField HeaderText="reqdate" SortExpression="reqdate">
                <ItemTemplate>
                    <asp:Label ID="lbldate" runat="server" Text='<%# Bind("reqdate") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [recover_pass] WHERE (([Id] = @Id) AND ([UserName] = @UserName))">
        <SelectParameters>
            <asp:QueryStringParameter Name="Id" QueryStringField="reqid" Type="Int32" />
            <asp:QueryStringParameter Name="UserName" QueryStringField="uname" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
     </div>
    </div>
</asp:Content>

