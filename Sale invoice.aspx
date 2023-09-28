<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sale invoice.aspx.cs" Inherits="Project1.Sale_invoice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sale invoice</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script>
        function calculate() {
            if (document.getElementById('quantity').value == "") {
                document.getElementById('quantity').value = "1";
            }
            
            if (document.getElementById('rate').value == "") {
                document.getElementById('rate').value = "0";
            }
            if (document.getElementById('amount').value == "") {
                document.getElementById('amount').value = "0";
            } 
                var my1 = document.getElementById('rate').value;
                var my2 = document.getElementById('quantity').value;
                var result = document.getElementById('amount');
                var myResult = parseFloat(my1) * parseFloat(my2);
                amount.value = myResult.toFixed(2);
            
        } 
    </script>
    <style>
     .menuH
    {
    margin: 0; 
    width: 45%; 
    float:none;
    behavior: url("/horizontal/menuh/cssmenu.htc");
    height: 36px;
    background: #D4D4D4 url(bg.gif) repeat-x 0 0;
    border: 1px solid #BBB;
    position:relative;
    z-index:4;
    font-family: Arial, Helvetica, sans-serif;
    list-style: none;
    padding: 0;
    border-radius:5px;
}

.menuH li
{
    padding: 0;
    
    float: left;
    height: 36px;
    position: relative;
}
.menuH li:hover, .menuH li.onhover
{
    background: white url(bg.gif) repeat-x 0 -48px;
}

ul.menuH a
{
    padding: 0 20px;
    line-height: 36px; 
    font-size: 12px;
    font-weight: bold;
    color: black;
    display: block;
    outline: 0;
    text-decoration: none;
    cursor: pointer;
}
.menuH a:hover
{
    color: red;

}
        
ul.menuH ul
{
    width:210px;
    position: absolute;
    left: -9999px;
    border: 1px solid #DDD;
    border-top: 0; 
    background: #FFF;    
    text-align: left;
    list-style: none; margin: 0;  
    padding: 10px 0;
    box-sizing:content-box;
}

.menuH li li
{
    float: none;
    white-space:nowrap;
    height: 26px;
}
.menuH li li:hover, .menuH li li.onhover
{
    background:#f7f7f7;
}
.menuH ul a
{
    padding: 0 20px;
    line-height: 30px;
    font-size: 0.9em;
    font-weight: normal;
    color: #0066CC;
    text-align: left;
}

.menuH ul a:hover
{
    color: red;
}

.menuH li:hover ul, .menuH li.onhover ul
{
    left: -1px;
    top: auto;
}


.menuH ul ul
{
    border-top: 1px solid #DDD;
}
.content{
    margin-top:10px;
    margin-left:183px;
    color:red;
    font-weight:bold;
    
}
.content #login1{
    margin-left: 385px;
}
.content #logout{
    margin-left:385px;
}
.content #logout:hover{
    text-decoration:underline;
}
.container{
    background-color:green;
    padding:3px;
    margin-top:10px;
    width:100%;
    margin-left:-8px;
    
}
.container1{
    background-color:green;
    padding:1px;
    margin-top:10px;
    width:100%;
    margin-left:-8px;
    
}
.save1{
            background-color: #393d3d;
            color: white;
            border-radius: 9px;
            
            font-size: 15px;
            padding-right:15px;
            padding-left:15px;
            cursor:pointer;
            
            
            
        }
        .save1:hover{
            background-color: black;
            transition: .5s;
            
        }
        .refresh1 {
             background-color: #393d3d;
            color: white;
            border-radius: 9px;
            font-size: 15px;
            padding-right: 15px;
            padding-left: 15px;
            cursor: pointer;
        }
           .refresh1:hover{
            background-color: black;
            transition: .5s;
            
        } 
            
            



        .add {
            background-color: #393d3d;
            color: white;
            border-radius: 9px;
            margin-left: 10px;
            font-size: 15px;
            padding-right:15px;
            padding-left:15px;
            cursor:pointer;
            
        }
        .add:hover{
            background-color: black;
            transition: .5s;
            
        }
        .button-search{
            background-color: #393d3d;
            color: white;
            border-radius: 9px;
            margin-left: 10px;
            font-size: 15px;
            padding-right:15px;
            padding-left:15px;
            cursor:pointer;
        }
        .button-search:hover{
            background-color: black;
            transition: .5s;
        }
        
        .refresh:hover{
            background-color: black;
            transition: .5s;
            
        }
        .refresh {
            background-color: #393d3d;
            color: white;
            border-radius: 9px;
            margin-left: 10px;
            font-size: 15px;
            padding-right:15px;
            padding-left:15px;
            cursor:pointer;
        }
        
#table1{
    margin-left:37px;
    margin-top:30px;
}
.tamount1{
    margin-left:15px;
    background-color: #efefef;
}
.Rtamount1{
    margin-left:25px;
    background-color: #efefef;
}
.Rtamount{
    margin-left:25px;
}
body{
    background-color:whitesmoke;
}
#DropDownList1{
    margin-left:6px;
    padding-left:10px;
}

#rate{
    margin-left:6px;
}

#GridView1{
    margin:auto;
    margin-top:13px;
    text-align:center;
    box-shadow:0 0.5rem 1rem rgba(0, 0, 0, 0.15) !important;
   border:1px solid black;
}
#GridView1 tbody tr td{
    border:none;
}
#GridView1 tbody tr th{
    border:none;
}

#GridView1 tbody tr:nth-of-type(odd){
    background-color:white;
}
#GridView1 tbody tr:hover{
    background-color:lightgoldenrodyellow;
}

#GridView2 tbody tr td{
    border:none;
}
#GridView2 tbody tr th{
    border:none;
}

#GridView2 tbody tr:nth-of-type(odd){
    background-color:white;
}
#GridView2 tbody tr:hover{
    background-color:lightgoldenrodyellow;
}
#Invoicenumber,#Invoicedate,#Customername,#Mobileno,#quantity,#rate,#amount,#DropDownList1,#tamount1,#Rtamount1,.text-search{
    border: 1px solid green;
    border-radius: 3px;
}

#Invoicenumber,#Invoicedate,#rate,#tamount1,#Rtamount1:hover{
    cursor:not-allowed;
}
#tablesearch{
    margin-left:740px;
    margin-top:20px;
}
    .pager span 
    { 
       background: #26B;
       color: #fff;
       border: solid 1px #AAE
     }
.delete i:hover{
    font-weight:bold;
}
    </style>
</head>
<body onClick="calculate()">
    <form id="form1" runat="server">
    <table >
            <ul class="menuH decor1">
        <li style="margin-left:70px;"><a class="arrow">Masters <i class="fa fa-caret-down"></i></a>
            <ul>
                <li><a href="Item Master.aspx" class="arrow">Item Master</a></li>
                <li><a href="#" class="arrow">Item Group Master</a></li>
                <li><a href="#" class="arrow">Item Company Master</a></li>
                <li><a href="#" class="arrow">Customer Master</a></li>
                <li><a href="#" class="arrow">Supplier Master</a></li>
                <li><a href="#" class="arrow">Godown\Shop Master</a></li>
            </ul>
        </li>
        <li style="margin-left:24px;"><a class="arrow">Inventory <i class="fa fa-caret-down"></i></a>
            <ul>
                <li><a href="Sale invoice.aspx" class="arrow">Sale Invoice</a></li>
                <li><a href="#" class="arrow">Purchase Invoice</a></li>
                <li><a href="#" class="arrow">Purchase Return</a></li>
                <li><a href="#" class="arrow">Sale Return</a></li>
                <li><a href="#" class="arrow">Stock Transfer</a></li>
            </ul>
        </li>
        <li style="margin-left:24px;"><a class="arrow">Accounts</a></li>
        <li style="margin-left:24px;"><a class="arrow">MIS</a></li>
        <li style="margin-left:24px;"><a class="arrow">GST Return</a></li>
       </ul>
    </table>
        <div class="container">
        </div>
        <div class="content">
        <asp:Label ID="home" runat="server" Text="Home"><i class="fa fa-home"></i> <a href="Home.aspx" style="text-decoration:none;color:red;">Home</a></asp:Label>
        <asp:Label ID="login1" runat="server" Text="Home"> Login By:
            <asp:Label ID="login" runat="server" Text="Home"></asp:Label>
        </asp:Label>
        <asp:Label ID="logout" runat="server" Text="Home"><a href="Login.aspx" style="text-decoration:none;color:red;">Logout</a><i class="fa fa-sign-out"></i></asp:Label>
        </div>
        <div class="container1">
        </div>


        <div class="up" style="padding:0.25rem !important;margin-top:0.25rem !important; width:88%;padding-right:15px;padding-left:15px;margin-right:auto;margin-left:auto;margin-bottom:0.5rem;font-weight:normal">
            <div class="container2" style="margin:0">
            <div class="container3" style="color:#fff;padding:10px;box-shadow:0 0.5rem 1rem rgba(0, 0, 0, 0.15) !important;background-color:#28a745">
                Sale Item Details
            </div>
            <div class="container4" style="padding:0.25rem;margin-top:0.25rem;border:1px solid #dee2e6;position:relative;flex-direction:column;display:flexbox;margin:0;word-wrap:break-word;background-color:#fff;background-clip:border-box;border-radius:0.25rem;margin-top:10px;box-shadow:0 0.5rem 1rem rgba(0, 0, 0, 0.15) !important;padding-bottom:20px">
                <div class="cardbody" style="padding:0.35rem 1rem 0.35rem 1rem">
                    <div class="row" style="display:flexbox;flex-wrap:wrap;margin-right:-15px;margin-left:-15px;">
                        <table style="border-collapse:separate;border-spacing:15px">   
                <tr style="font-family:Calibri">
                    <td><asp:Label ID="Label5" runat="server" Visible="false" Text="">Id</asp:Label></td><td><asp:textbox id="Id1" runat="server" Visible="false" AutoCompleteType="Disabled"></asp:textbox></td>
                     <td><asp:Label ID="Label1" runat="server" Text="">Invoice No.</asp:Label></td><td> <asp:textbox id="Invoicenumber" runat="server" Enabled="false" AutoCompleteType="Disabled" style="margin-left:5px;background-color: #efefef;"></asp:textbox></td>
                    <td><asp:Label ID="Label2" runat="server" Text="">Invoice Date</asp:Label></td><td> <asp:textbox id="Invoicedate" runat="server" style="margin-left:5px;background-color: #efefef" Enabled="false"   OnTextChanged="TextBoxStartDate_TextChanged"></asp:textbox></td> 
                    <td><asp:Label ID="Label3" runat="server" Text="">Customer Name</asp:Label></td><td> <asp:textbox id="Customername" AutoCompleteType="Disabled" runat="server"></asp:textbox></td>
                     <td><asp:Label ID="Label4" runat="server" Text=""></asp:Label>Mobile No.</td><td> <asp:textbox id="Mobileno" AutoCompleteType="Disabled" runat="server"></asp:textbox></td>     
                </tr>
                            
            </table>
                        <table id="table1" style="border-spacing:10px">
                <tr style="font-family:Calibri">
                    <td>Item Name</td><td>
                        <asp:DropDownList ID="DropDownList1" OnSelectedIndexChanged="gv_SelectedIndexChanged" runat="server" AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                    <td style="visibility:hidden">Id</td><td><asp:textbox id="Id" runat="server" Visible="false" AutoCompleteType="Disabled"></asp:textbox></td>
                    <td class="quantity">Quantity<td> <td><asp:textbox id="quantity" runat="server" AutoCompleteType="Disabled"></asp:textbox></td>
                    <td>Rate</td><td><asp:textbox id="rate" runat="server" Enabled="false" style="background-color: #efefef" AutoCompleteType="Disabled"></asp:textbox></td>
                    <td>Amount</td><td><asp:textbox id="amount" runat="server" AutoCompleteType="Disabled"></asp:textbox></td>
               
                    
                    <td><asp:Button ID="add" runat="server" Text="Add" onClick="add_click" CssClass="add"/></td>
                    <td><asp:Button ID="refresh" runat="server" Text="Refresh" Visible="false" onClick="refresh_click" CssClass="refresh"/></td>
                 </tr>                      
            </table>

                 <asp:GridView ID="GridView1" runat="server" ShowHeaderWhenEmpty="True" EmptyDataText="No records Found" ShowFooter="true" onrowdatabound="GridView1_RowDataBound"  AutoGenerateColumns="False" BorderWidth="3px" CellPadding="4" CellSpacing="2" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid"  ForeColor="Black" OnRowDeleting="GridView1_RowDeleting" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" style="width:81.90%;padding:10px;margin:auto;margin-top:30px;text-align:center">
                <Columns>
                <asp:Commandfield ShowSelectButton="true" ControlStyle-CssClass="delete" ControlStyle-ForeColor="Red" SelectText="<i class='fa fa-pencil' aria-hidden='true'></i>" ShowDeleteButton="True"  DeleteText="<i class='fa fa-trash-o' aria-hidden='true'></i>"/>
              
                <asp:TemplateField HeaderText="Id" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="Id" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Itemname">
                    <ItemTemplate>
                        <asp:Label ID="Itemname" runat="server" Text='<%# Eval("Itemname") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Quantity">
                    <ItemTemplate>
                        <asp:Label ID="Quantity" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Rate">
                    <ItemTemplate>
                        <asp:Label ID="Rate" runat="server" Text='<%# Eval("Rate") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Amount" > 
                    <ItemTemplate >
                        <asp:Label ID="Amount" runat="server" Text='<%# Eval("Amount") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>  
               <asp:TemplateField HeaderText="Total" SortExpression="total">
               <%-- <EditItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                </EditItemTemplate>--%>
                <FooterTemplate>
                    <asp:Label ID="lbltotal" runat="server" Text="Label"></asp:Label>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="total" runat="server"></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="100px" />
            </asp:TemplateField> 
            
            </Columns>
             <HeaderStyle BackColor="Gray" ForeColor="White" />
            <PagerStyle BackColor="#929580" ForeColor="Black" HorizontalAlign="Left" />
            <RowStyle />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView> 

            <table style="margin-left:20px;padding:30px;margin-top:10px">
            <tr style="font-family:Calibri">      
        <td><asp:Label ID="tamount" runat="server" Text="Total Amount:"></asp:Label><asp:TextBox ID="tamount1" runat="server" Enabled="false" CssClass="tamount1"></asp:TextBox></td> 
        <td><asp:Label ID="Rtamount" runat="server" Text="Net Amount:" CssClass="Rtamount"></asp:Label><asp:TextBox ID="Rtamount1" runat="server" Enabled="false" CssClass="Rtamount1"></asp:TextBox></td>
            </tr>
             </table>
             <table style="margin-left:auto;margin-right:auto">
            <tr>
                <td><asp:Button ID="save" runat="server" Text="Save" OnClick="save_click" CssClass="save1"/></td>
                <td><asp:Button ID="refresh1" runat="server" Text="Refresh" onClick="refresh1_click" CssClass="refresh1"/></td>
            </tr>
        </table>

        <table id="tablesearch">
            <tr>
           <td><p style="color:red;font-size:17px;">Search by any Name:</p></td> <td><asp:TextBox ID="TextBoxSearch" runat="server"
                CssClass="text-search"
                Text=""
                Width="200" AutoCompleteType="Disabled" /></td>
            <td><asp:Button ID="ButtonSearch" runat="server"
                CssClass="button-search"
                Text="Search"
                OnClick="ButtonSearch_Click" /></td>
                </tr>
        </table>

                 <asp:GridView ID="GridView2" CssClass="table3" AllowPaging="true" PageSize="5" AllowSorting="true" OnPageIndexChanging="GridView1_PageIndexChanging" ShowHeaderWhenEmpty="True" EmptyDataText="No records Found" runat="server"  AutoGenerateColumns="False" BorderWidth="3px" CellPadding="4" CellSpacing="2" BorderColor="#999999" BorderStyle="Solid"  ForeColor="Black" OnRowDeleting="GridView2_RowDeleting" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" style="width:81.90%;padding:10px;margin:auto;margin-top:1px;text-align:center;background-color:lightgray">
                <PagerStyle CssClass="pager"  />
                <Columns>
                <%--<asp:CommandField HeaderText="Update" ShowSelectButton="True" />--%>
                <asp:CommandField ControlStyle-ForeColor="Red" ShowDeleteButton="True" DeleteText="<i class='fa fa-trash-o' aria-hidden='true'></i>" ControlStyle-CssClass="delete"/>
                <asp:TemplateField HeaderText="Id" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="Id" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Inv.No.">
                    <ItemTemplate>
                        <asp:Label ID="Invoicenumber" runat="server" Text='<%# Eval("Invoicenumber") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Inv.Date">
                    <ItemTemplate>
                        <asp:Label ID="Date" runat="server" Text='<%# Eval("Date") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Customer Name">
                    <ItemTemplate>
                        <asp:Label ID="CustomerDetails" runat="server" Text='<%# Eval("CustomerDetails") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField> 
                <asp:TemplateField HeaderText="Mobilenumber" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="Mobilenumber" runat="server" Text='<%# Eval("Mobilenumber") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="InvoiceAmt">
                    <ItemTemplate>
                        <asp:Label ID="Netamount" runat="server" Text='<%# Eval("Netamount") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField> 
            </Columns>
             <HeaderStyle BackColor="Gray" ForeColor="White" />
            <PagerStyle BackColor="#929580" ForeColor="Black" HorizontalAlign="Left" />
            <RowStyle />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView> 
        <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="" ForeColor="Red" ClientValidationFunction="CheckDuplicates"></asp:CustomValidator>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
