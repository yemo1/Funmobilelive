using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataLibrary;

namespace F2.Controls
{
    public partial class usrTerms : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lsvTerms_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            //HiddenField parentId = (HiddenField)e.Item.FindControl("hdfId");
            string title = Request.QueryString["Title"];
            //ListView ls = (ListView)e.Item.FindControl("lsvProducts");
            using (PortalSystemsDBEntities db = new PortalSystemsDBEntities ())
            {
                var terms = from t in db.SitePageContents
                           where t.Title == title
                           select t;
                fmvContent.DataSource = terms.ToList();
                fmvContent.DataBind();
            }
            
        }

        
    }
}