using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace F2
{

    //public static class StringExtension
    //{
    //    public static string GetLast(this string source, int tail_length)
    //    {
    //        if (tail_length >= source.Length)
    //            return source;
    //        return source.Substring(source.Length - tail_length);
    //    }
    //}
    public partial class search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(Request.QueryString["q"]))
                {
                    Label1.Text = "You did not specify search Criteria";
                    Label1.Visible = true;
                    return;
                }
                //string query = Request.QueryString["q"];
                //query = query.Replace("+", "").Trim();
                //query = query.Replace(".", "").Trim();
                //query = query.Replace("'", "").Trim();
                //query = query.Replace(",", "").Trim();
                //query = query.Replace(";", "").Trim();
                //DataLibrary.PortalSystemsDBEntities ent = new DataLibrary.PortalSystemsDBEntities();
                //var qr = (from m in ent.SitePageContents
                //          where m.DisplayContent.Contains(query)
                //              || m.Title.Contains(query) || m.ContentHeader.Contains(query)
                //          select m).Distinct().OrderBy(m=>m.Title).ToList();
                //ListView1.DataSource = qr;
                //ListView1.DataBind();
                //Label1.Visible = false;
                //if (qr.Count == 0)
                //{
                //    DataPager1.Visible = false;
                //}
                BindView();
            }
            catch (Exception exp)
            {
                Response.Write("Oop:Something went wrong with your search.Try later");
            }
        }

        protected void BindView()
        {
            string query = Request.QueryString["q"];
            query = query.Replace("+", "").Trim();
            query = query.Replace(".", "").Trim();
            query = query.Replace("'", "").Trim();
            query = query.Replace(",", "").Trim();
            query = query.Replace(";", "").Trim();
            DataLibrary.PortalSystemsDBEntities ent = new DataLibrary.PortalSystemsDBEntities();
            var qr = (from m in ent.SitePageContents
                      where m.DisplayContent.Contains(query)
                          || m.Title.Contains(query) || m.ContentHeader.Contains(query)
                      select m).Distinct().OrderBy(m => m.Title).ToList();
            ListView1.DataSource = qr;
            ListView1.DataBind();
            Label1.Visible = false;
        }
        protected void ListView1_DataBound(object sender, EventArgs e)
        {
            foreach (var item in ListView1.Items)
            {
                HyperLink link = (HyperLink)item.FindControl("HyperLink1");
                Label content = (Label)item.FindControl("display");
                Label pgurl = (Label)item.FindControl("displaypageurl");
                if(string.IsNullOrEmpty(pgurl.Text))
                {
                    link.NavigateUrl = "Terms?Title=" + link.Text;
                }
                if (string.IsNullOrEmpty(content.Text))
                {
                    content.Text = "No content for preview.";
                }
                else
                {
                    int leng = content.Text.Length;
                    string noHTML = Regex.Replace(content.Text, @"<[^>]+>|&nbsp;", "");
                    string noHTMLNormalised = Regex.Replace(noHTML, @"\s{2,}", " ");
                    if (leng >= 150)
                    {
                        //string result = noHTML.GetLast(150);
                        //content.Text = "..." + result;
                        content.Text = noHTMLNormalised.Substring(0, noHTMLNormalised.IndexOf('.')).Trim() + "...";
                        //content.Text.Substring(0, content.Text.IndexOf('.')) + "";
                        //content.Text = content.Text.Substring(0, content.Text.IndexOf('.')) + "...";
                        //content.Text = HttpUtility.HtmlDecode(content.Text);
                    }
                    else
                    {
                        content.Text = "No content for preview.";
                    }
                }
            }
            DataPager1.Visible = DataPager1.PageSize < DataPager1.TotalRowCount;
        }

        protected void ListView1_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            DataPager1.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            BindView();
        }
    }
}