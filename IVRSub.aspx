<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="IVRSub.aspx.cs" Inherits="F2.IVRSub" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
										<div class="serviceHeader">
											Funchat Service Description
										</div>
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
			EntitySetName="SitePageContents" Where="it.ContentHeader='Test'" >
	</ef:EntityDataSource>
</asp:Content>
