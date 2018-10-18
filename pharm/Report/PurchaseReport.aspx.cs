using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Entity;
using pharm.Models;

namespace pharm.Report
{
    
    public partial class PurchaseReport1 : System.Web.UI.Page
    {
      
        protected void Page_Load(object sender, EventArgs e)
        {
            CrystalReportViewer1.ToolPanelView = CrystalDecisions.Web.ToolPanelViewType.None;
            PurchaseReport  crystalReport = new PurchaseReport();
            pharmEntities entities = new pharmEntities();
            crystalReport.SetDataSource(from ta in entities.Purchases.Take(10)
                                        select ta);
            CrystalReportViewer1.ReportSource = crystalReport;
            CrystalReportViewer1.RefreshReport();
        }


    }
}