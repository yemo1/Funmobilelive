<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Dating.aspx.cs" Inherits="F2.Dating" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <section id="hero" style="background: url(images/dummy/hero-plain.jpg) center no-repeat;">
		<h1>Dating Service</h1>
	</section>
	<div id="main" class="row" role="main">
		<div class="twelve columns">
			<div class="row">
				<article class="entry twelve columns">
					<div class="container shd">
						<asp:FormView ID="fmvContent" runat="server" DataSourceID="edsChat">
							<ItemTemplate>
								<div style="margin:1em 0 0 -3em">
									<asp:Image ID="Image1" runat="server" CssClass="Image1" ImageUrl='<%#Eval("LabelPic1")!=null?"~/Upload/" + Eval("LabelPic1"):"" %>'  />
									<span class="myContents">
										<%#Eval("DisplayContent") %>
									</span>
									<asp:Image ID="Image2" runat="server"  CssClass="Image2" ImageUrl='<%#Eval("LabelPic2")!=null?"~/Upload/" + Eval("LabelPic2"):"" %>'/>
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
			EntitySetName="SitePageContents" Where="it.PageUrl='Dating.aspx'" >
	</ef:EntityDataSource>
</asp:Content>
