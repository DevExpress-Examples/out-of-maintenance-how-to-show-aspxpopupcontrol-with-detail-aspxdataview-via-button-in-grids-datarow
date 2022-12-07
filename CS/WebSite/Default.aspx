<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>





<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script type="text/javascript" language="javascript">
        var keyValue = -1;

        function OnGotFocusEventHander(s, e, rowKeyValue) {
            keyValue = rowKeyValue;
            popup.Show();
        }

        function OnShownEventHander(s, e) {
            cp.PerformCallback(keyValue);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" ClientInstanceName="grid" AutoGenerateColumns="False"
            DataSourceID="AccessDataSource1" KeyFieldName="CategoryID">
            <Templates>
                <DataRow>
                    ID = <dx:ASPxLabel ID="ASPxLabel1" runat="server" Value='<%#Eval("CategoryID")%>'></dx:ASPxLabel><br />
                    Name = <dx:ASPxLabel ID="ASPxLabel2" runat="server" Value='<%#Eval("CategoryName")%>'></dx:ASPxLabel><br />
                    Description = <dx:ASPxLabel ID="ASPxLabel3" runat="server" Value='<%#Eval("Description")%>'></dx:ASPxLabel><br />
                    <dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="false" 
                        Text="Show Products" OnInit="ASPxButton1_Init">
                    </dx:ASPxButton>
                </DataRow>
            </Templates>
            <Columns>
                <dx:GridViewDataTextColumn FieldName="CategoryID" ReadOnly="True" VisibleIndex="0">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CategoryName" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Description" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsPager PageSize="1">
            </SettingsPager>
        </dx:ASPxGridView>
        <br />
        <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" 
            ClientInstanceName="popup" CloseAction="CloseButton" Modal="True" 
            PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
            <ClientSideEvents Shown="OnShownEventHander" />
            <ContentCollection>
                <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                    <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" 
                        ClientInstanceName="cp" OnCallback="ASPxCallbackPanel1_Callback">
                        <PanelCollection>
                            <dx:PanelContent ID="PanelContent1" runat="server">
                                <dx:ASPxDataView ID="ASPxDataView1" runat="server" ClientInstanceName="view" 
                                    DataSourceID="AccessDataSource2" RowPerPage="1" ColumnCount="6">
                                    <ItemTemplate>
                                        <b>ProductID</b>:
                                        <asp:Label ID="ProductIDLabel" runat="server" Text='<%# Eval("ProductID") %>' />
                                        <br />
                                        <b>ProductName</b>:
                                        <asp:Label ID="ProductNameLabel" runat="server" 
                                            Text='<%# Eval("ProductName") %>' />
                                        <br />
                                        <b>UnitPrice</b>:
                                        <asp:Label ID="UnitPriceLabel" runat="server" Text='<%# Eval("UnitPrice") %>' />
                                        <br />
                                        <b>ReorderLevel</b>:
                                        <asp:Label ID="ReorderLevelLabel" runat="server" 
                                            Text='<%# Eval("ReorderLevel") %>' />
                                        <br />
                                        <b>Discontinued</b>:
                                        <asp:Label ID="DiscontinuedLabel" runat="server" 
                                            Text='<%# Eval("Discontinued") %>' />
                                        <br />
                                    </ItemTemplate>
                                </dx:ASPxDataView>
                            </dx:PanelContent>
                        </PanelCollection>
                    </dx:ASPxCallbackPanel>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
    </div>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
        SelectCommand="SELECT [CategoryID], [CategoryName], [Description] FROM [Categories]">
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="AccessDataSource2" runat="server" 
        DataFile="~/App_Data/nwind.mdb" 
        SelectCommand="SELECT [ProductID], [ProductName], [UnitPrice], [ReorderLevel], [Discontinued] FROM [Products] WHERE ([CategoryID] = ?)">
        <SelectParameters>
            <asp:SessionParameter Name="CategoryID" SessionField="CategoryID" 
                Type="Int32" />
        </SelectParameters>
    </asp:AccessDataSource>
    </form>
</body>
</html>