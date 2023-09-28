<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mobileotp.aspx.cs" Inherits="Project1.Mobileotp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:Panel ID="pnl1" runat="server">
  <table>
    <tr>
      <td>Enter Your Mobile Number:</td>
      <td>
        <asp:TextBox ID="txtmobileNo" runat="server"></asp:TextBox>
      </td>
    </tr>
    <tr>
      <td></td>
      <td>
        <asp:Button ID="btnsendOtp" runat="server" Text="Send OTP" OnClick="btnsendOtp_Click" />
      </td>
    </tr>
  </table>
</asp:Panel>
<asp:Panel ID="pnl2" runat="server" Visible="false">
  <table>
    <tr>
      <td>Enter Your OTP:</td>
      <td>
        <asp:TextBox ID="txtverifyMobileNO" runat="server"></asp:TextBox>
      </td>
    </tr>
    <tr>
      <td></td>
      <td>
        <asp:Button ID="btnverify" runat="server" Text="Verify" OnClick="btnverify_Click" />
      </td>
    </tr>
  </table>
</asp:Panel>
    </form>
</body>
</html>
