<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Tunez.aspx.cs" Inherits="F2.Tunez" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .grselect {
            margin-left: -3em;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="hero" style="background: url(images/dummy/hero-plain.jpg) center no-repeat;">
		<h1>Caller Tunez </h1>
	</section>
    <div id="main" class="row" role="main">
        <div class="twelve columns">
            <div class="row">
                <article class="entry twelve columns">
					<div class="container shd">
						<asp:FormView ID="fmvContent" runat="server" DataSourceID="edsChat">
							<ItemTemplate>
								<div style="margin:1em 0 0 -3em">
									<asp:Image ID="Image1" runat="server" ImageUrl='<%#"~/Upload/" + Eval("LabelPic1")%>' CssClass="Image1"  />
									<span class="myContents">
										<%#Eval("DisplayContent") %>
									</span>
									<asp:Image ID="Image2" runat="server"  ImageUrl='<%#"~/Upload/" + Eval("LabelPic2") %>' CssClass="Image2"/>
								</div>
							</ItemTemplate>
						</asp:FormView>
						<p><span style="font-weight :bold;font-size:1.6em; margin-left:-1em">FunMobile CallerTunez</span></p>
						<p><span style ="float:left;margin-right:1%">Select Category :  </span> <asp:DropDownList ID="DdCatTunez" runat="server" Width ="150px" AutoPostBack="True" OnSelectedIndexChanged="DdCatTunez_SelectedIndexChanged"></asp:DropDownList> </p>

						 <asp:GridView ID="GridView1" runat="server" CssClass ="grselect" CellPadding="4" ForeColor="#333333" GridLines="Vertical" AutoGenerateColumns="False" Width="60%" DataKeyNames ="ID" OnPageIndexChanging="GridView1_PageIndexChanging" AllowPaging="True" Font-Names="Verdana" Font-Size="10px" Font-Bold="False">
							<AlternatingRowStyle BackColor="White" ForeColor="Black" Font-Names="Verdana" Font-Size="9px" />
							<Columns>
								<asp:BoundField DataField="CrbtCategoryID" HeaderText="CrbtCategoryID" Visible="False" />
								<%--<asp:BoundField DataField="Code" HeaderText="Code" />--%> 
								<asp:BoundField DataField="Name" HeaderText="Name" >
								<ItemStyle Font-Names="Verdana" Font-Size="12px" />
								</asp:BoundField>
								<asp:BoundField DataField="Artist" HeaderText="Artist" >
								<ItemStyle Font-Names="Verdana" Font-Size="12px" />
								</asp:BoundField>
								<asp:BoundField DataField="BuyBySMS" HeaderText="Subscribe By SMS" HtmlEncode ="false" >
								  <ItemStyle Font-Names="Verdana" Font-Size="12px" />
								</asp:BoundField>
								  <asp:TemplateField HeaderText="Buy(MTN Only)">
								<ItemTemplate>
                                    <%--<asp:HyperLink runat="server" Target="_blank"></asp:HyperLink>--%>
									<asp:LinkButton ID="status" runat="server" Text="Buy(MTN)" OnClick="status_Click" Font-Names="verdana" Font-Size="11px" ForeColor="Maroon" Font-Bold="True" />
								</ItemTemplate>
							</asp:TemplateField>
							</Columns>
							<EditRowStyle BackColor="#999999" />
							<FooterStyle BackColor="#0069A6" Font-Bold="True" ForeColor="White" />
							<HeaderStyle BackColor="#0069A6" Font-Bold="True" ForeColor="White" Font-Names="Verdana" Font-Size="1em" Wrap="True" />
							<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
							<RowStyle BackColor="#F5F3DB" ForeColor="#333333" Font-Names="Verdana" Font-Size="9px" HorizontalAlign="Center" />
							<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
							<SortedAscendingCellStyle BackColor="#E9E7E2" />
							<SortedAscendingHeaderStyle BackColor="#506C8C" />
							<SortedDescendingCellStyle BackColor="#FFFDF8" />
							<SortedDescendingHeaderStyle BackColor="#6F8DAE" />
						</asp:GridView>
						
						<ef:EntityDataSource ID="EntityDataSource1" runat="server" 
						EnableFlattening="false" ContextTypeName="DataLibrary.PortalSystemsDBEntities"
						EntitySetName="SitePageContents" Where="it.ContentHeader='Test'" >
						</ef:EntityDataSource>
					</div>
				</article>
                <!-- #sidebar -->
            </div>
        </div>
    </div>
    <ef:EntityDataSource ID="edsChat" runat="server"
        EnableFlattening="false" ContextTypeName="DataLibrary.PortalSystemsDBEntities"
        EntitySetName="SitePageContents" Where="it.ContentHeader='CallerTunes'">
    </ef:EntityDataSource>
</asp:Content>
