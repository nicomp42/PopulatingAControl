<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="PopulatingAControl._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
 <style type="text/css">
        .ListBoxCssClass
        {
            color:GhostWhite;
            background-color:DarkOliveGreen;
            font-family:Courier New;
            font-size:large;
            font-style:italic;
            }
    </style>
            <script type="text/javascript">
            function handleListBoxDoubleClick(listBox) {
                // Check if an item is actually selected
                if (listBox.selectedIndex >= 0) {
                    // Get the value of the selected item
                    var selectedValue = listBox.options[listBox.selectedIndex].value;
                    // Trigger a postback using __doPostBack
                    // The first argument is the UniqueID of the control causing the postback (can be the listbox itself)
                    // The second argument is a string containing event information (e.g., "DoubleClick:" + value)
                    __doPostBack(lbNames.id, 'DoubleClick:' + selectedValue);
                }
            }
            </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ListBox ondblclick="handleListBoxDoubleClick(this);" 
                CssClass="ListBoxCssClass" ID="lbNames" runat="server" OnSelectedIndexChanged="lbNames_SelectedIndexChanged">
                <asp:ListItem>Avocado</asp:ListItem>
                <asp:ListItem>Peach</asp:ListItem>
                <asp:ListItem>Plum</asp:ListItem>
                <asp:ListItem>Orange</asp:ListItem>
                <asp:ListItem>Guava</asp:ListItem>
            </asp:ListBox>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
        <br/>
            <asp:TextBox ID="txtNewItem" runat="server"></asp:TextBox>
            <asp:Button ID="cmdAdd" runat="server" Text="Button" OnClick="cmdAdd_Click" />
        </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    </form>
</body>
</html>
