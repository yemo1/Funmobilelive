<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="usrTerms.ascx.cs" Inherits="F2.Controls.usrTerms" %>
<div style="float: left">
    <asp:ListView runat="server" ID="lsvTerms" DataKeyNames="Id" DataSourceID="edsTerms" OnItemDataBound="lsvTerms_ItemDataBound">
        <EmptyDataTemplate>No Menu</EmptyDataTemplate>
        <ItemTemplate>
            <ul class="terms">
                <li>
                    <asp:HyperLink ID="lnkCategories" NavigateUrl='<%#"../Terms?Title="+Eval("Title")%>'
                        Text='<%#Eval("Title")%>'
                        runat="server">
                    </asp:HyperLink>
                </li>
            </ul>
            <asp:HiddenField ID="hdfId" runat="server" Value='<%#Eval("Id")%>' />
        </ItemTemplate>
    </asp:ListView>
</div>
<%--<div style="float:left;width:70%" runat="server" id="FunTerms">
    <h2>Terms & Conditions</h2>
    This Statement of Rights and Responsibilities (“Statement,” “Terms,” or “SRR”) derives from the Funmobile principles , and is our terms of service that governs our relationship with users. Feel free to contact us at Funmobile Limited
</div>--%>
<div style="width: 100%">
    <asp:FormView ID="fmvContent" runat="server">
        <EmptyDataTemplate>
            <h2>Terms & Conditions</h2>
    This Statement of Rights and Responsibilities (“Statement,” “Terms,” or “SRR”) derives from the Funmobile principles , and is our terms of service that governs our relationship with users. Feel free to contact us at Funmobile Limited
        </EmptyDataTemplate>
        <ItemTemplate>
            <div style="margin: 0 0 0 -3em">
                <%#Eval("DisplayContent") %>
            </div>
        </ItemTemplate>
    </asp:FormView>
</div>
<ef:EntityDataSource ID="edsTerms" runat="server"
    EnableFlattening="false" ContextTypeName="DataLibrary.PortalSystemsDBEntities"
    EntitySetName="SitePageContents" Where="it.[Group]='Terms'">
</ef:EntityDataSource>
