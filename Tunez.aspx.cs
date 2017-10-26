using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataLibrary;

namespace F2
{
    public partial class Tunez : System.Web.UI.Page
    {
        DataLibrary.PortalSystemsDBEntities db = new PortalSystemsDBEntities();
        int id = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

            Image img = (Image)fmvContent.FindControl("Image1");
            Image img1 = (Image)fmvContent.FindControl("Image2");
            img.Visible = false;
            img1.Visible = false;
            //if (string.IsNullOrEmpty(img.ImageUrl))
            //{
            //    img.Visible = false;
            //}
            //if (string.IsNullOrEmpty(img1.ImageUrl))
            //{
            //    img1.Visible = false;
            //}

            if (Page.IsPostBack == false)
            {
                //var c = db.CrbtTones.Where(c=>c.)
                var result = (from m in db.CrbtTones where m.CrbtCategoryID == 1 select m).ToList();
                GridView1.DataSource = result;
                GridView1.DataBind();
                var dq = (from n in db.CrbtCategories select n).ToList();
                DdCatTunez.Items.Clear();
                DdCatTunez.DataSource = dq;
                DdCatTunez.DataTextField = "CrbtCategoryName";
                DdCatTunez.DataValueField = "Id";
                DdCatTunez.DataBind();

            }
        }
        protected void status_Click(object sender, EventArgs e)
        {
            LinkButton btnEdit = sender as LinkButton;
            GridViewRow row = (GridViewRow)btnEdit.NamingContainer;
            int id = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Value);
            var qu = (from u in db.CrbtTones where u.ID == id select u).SingleOrDefault();
            string url = qu.DownloadUrl;
            string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=no,height=400,width=420";
            ClientScript.RegisterStartupScript(this.GetType(), "newWindow", String.Format("<script>window.open('{0}','{1}','{2}');</script>", url, "", winFeatures));
            
        }

        protected void DdCatTunez_SelectedIndexChanged(object sender, EventArgs e)
        {
            id = Convert.ToInt32(DdCatTunez.SelectedValue);
            pulldata();
        }
        void pulldata()
        {
            id = Convert.ToInt32(DdCatTunez.SelectedValue);
            var result = (from m in db.CrbtTones where m.CrbtCategoryID == id select m).ToList();
            GridView1.DataSource = result;
            GridView1.DataBind();
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            pulldata();
        }

    }
}