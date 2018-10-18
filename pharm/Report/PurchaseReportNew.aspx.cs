using System;
using System.Collections.Generic;
using System.Linq;
using pharm.Models;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pharm.Report
{
    public partial class PurchaseReportNew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CrystalReportViewer1.ToolPanelView = CrystalDecisions.Web.ToolPanelViewType.None;
            PurchaseReport crystalReport = new PurchaseReport();
            pharmEntities entities = new pharmEntities();
            crystalReport.SetDataSource(from customer in entities.Purchases.Take(10)
                                        select customer);
            CrystalReportViewer1.ReportSource = crystalReport;
            CrystalReportViewer1.RefreshReport();
        }
    }
}