<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="search.aspx.cs" Inherits="F2.search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <%--  <section id="hero" style="background: url(images/dummy/hero-plain.jpg) center no-repeat;">
		<h1>Funchat Service</h1>
	</section>--%>
    <div id="main" class="row" role="main">
        <div class="twelve columns">
            <div class="row">
                <article class="entry twelve columns">
                    <div class="container shd">

                        <asp:ListView ID="ListView1" runat="server" OnDataBound="ListView1_DataBound">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink1" runat="server" Text='<%#Eval("Title") %>' NavigateUrl='<%#Eval("PageUrl") %>' Font-Bold="true" ForeColor="Blue" />
                                <br />
                                <asp:Label ID="display" runat="server" Text='<%#Eval("DisplayContent") %>' />
                                <asp:Label ID="displaypageurl" runat="server" Text='<%#Eval("PageUrl") %>' Visible="false" />
                                <br /><br />
                            </ItemTemplate>
                            <EmptyDataTemplate>
                                <asp:Label ID="Label1" runat="server" Text="No data found" Font-Names ="verdana"/>
                            </EmptyDataTemplate>
                        </asp:ListView>
                        <br />
                        <asp:DataPager ID="DataPager1" runat="server" PagedControlID ="ListView1" PageSize="5" >
                            <Fields>
                                <asp:NextPreviousPagerField FirstPageText="" ShowNextPageButton="False" />
                                <asp:NumericPagerField  />
                                <asp:NextPreviousPagerField LastPageText="Next" ShowPreviousPageButton="False" />
                            </Fields>
                        </asp:DataPager>
                        <br />
                        <asp:Label ID="Label1" runat="server" Text="" Font-Names ="verdana"></asp:Label>
                    </div>
                </article>
            </div>
        </div>
    </div>
</asp:Content>
