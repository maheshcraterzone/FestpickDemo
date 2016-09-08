using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace FestPicks
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {
            String fullOrigionalpath = Request.Url.ToString();
            String[] sElements = fullOrigionalpath.Split('/');
            String[] sFilePath = sElements[sElements.Length - 1].Split('.');
            String[] queryString = sElements[sElements.Length - 1].Split('?');

            if (!fullOrigionalpath.Contains(".aspx") && sFilePath.Length == 1)
            {
                if (!string.IsNullOrEmpty(sFilePath[0].Trim()))
                {
                    if (queryString.Length == 1)
                    {
                        Context.RewritePath(sFilePath[0] + ".aspx");
                    }
                    else
                    {
                        Context.RewritePath(queryString[0] + ".aspx?" + queryString[1]);
                    }

                }
            }
        }
    }
}