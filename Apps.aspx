<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Apps.aspx.cs" Inherits="F2.Apps" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <section id="hero" style="background: url(images/dummy/hero-plain.jpg) center no-repeat;">
		<h1>Apps</h1>
	</section>
	<div id="main" class="row" role="main">
		<div class="twelve columns">
			<div class="row">
				<article class="entry twelve columns">
					<div class="container shd">
						<asp:FormView ID="fmvContent" runat="server" DataSourceID="edsChat">
							<ItemTemplate>
								<div style="margin:0 0 0 -3em">
									<asp:Image ID="Image1" runat="server" ImageUrl='<%#"~/Upload/" + Eval("LabelPic1")%>' CssClass="Image1"  />
									<span class="myContents">
										<%#Eval("DisplayContent") %>
									</span>
									<asp:Image ID="Image2" runat="server"  ImageUrl='<%#"~/Upload/" + Eval("LabelPic2") %>' CssClass="Image2"/>
								</div>
							</ItemTemplate>
						</asp:FormView>
					</div>
				</article>
				<!-- #sidebar -->
			</div>
		</div>
	</div>
	<ef:EntityDataSource ID="edsChat" runat="server" 
			 EnableFlattening="false" ContextTypeName="DataLibrary.PortalSystemsDBEntities"
			EntitySetName="SitePageContents" Where="it.PageUrl='Apps.aspx'" >
	</ef:EntityDataSource>
</asp:Content>
