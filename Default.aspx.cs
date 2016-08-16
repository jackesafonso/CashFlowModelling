using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    int DevidedByTwo = 0;
    decimal EquatyToBeSplitted = 0;
    decimal OilCompanyTaxableIncome = 0;
    decimal LabelProduction = 0;
    decimal AnnualProduction = 0;
    decimal RecoveryCost = 0;
    decimal GovernmentIncome = 0;
    decimal Tax = 0;
    int DevidedByHundred = 0;
    decimal RoyaltyCost = 0;
    decimal GovernmentTake = 0;
    decimal OilCompanyTake = 0;
    decimal calculate;
    decimal Total;
    decimal CalculateOilCompany = 0;
    decimal CostRecovery = 0;

    //decimal PercentageOfGovernmentTake = 0;
    //decimal PercentageOfCompanyTake = 0;
    //decimal PercentageOfRecoveryCost = 0;

    // decimal labelNetRevenue = 0m;

    double annualProduction;
    decimal OilPrice;
    decimal Royalty;
    decimal OperatingCost;
    decimal CapitalCost;
    
    ////double GrossRevenue;



    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        LabelChartType.Visible = true;
        DropDownList1.Visible = true;
        
        drawChart(getChartType());
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        switch (DropDownList1.SelectedValue)
        {
            case "pie":
                drawChart("pie");
                break;
            case "doughnut":
                drawChart("doughnut");
                break;
            case "column":
                drawChart("column");
                break;
            case "bar":
                drawChart("bar");
                break;
        }
    }

   
        
    public void drawChart(string chartType)
    {

        AnnualProduction = getData(TextBoxAnnualProduction);
        OilPrice = getData(TextBoxOilPrice);
        Royalty = getData(TextBoxRoyalty);
        OperatingCost = getData(TextBoxOPex);
        CapitalCost = getData(TextBoxCapex);
        Tax = getData(TextBoxTax);


        DevidedByHundred = 100;
        DevidedByTwo = 2;

        AnnualProduction = Convert.ToDecimal(TextBoxAnnualProduction.Text);

        LabelTotalAnnualProduction.Text = "The Gross Revenue is $" + (AnnualProduction * Convert.ToDecimal(TextBoxOilPrice.Text)).ToString();
        LabelProduction = AnnualProduction * Convert.ToDecimal(TextBoxOilPrice.Text);
        LabelNetRevenue.Text = "The Net Revenue is $" + ((LabelProduction * Convert.ToDecimal(TextBoxRoyalty.Text)) / DevidedByHundred).ToString();

        RecoveryCost = Convert.ToDecimal(TextBoxOPex.Text);
        CostRecovery = (RecoveryCost + Convert.ToDecimal(TextBoxCapex.Text));
        LabelRecoveryCost.Text = "The Recovery Cost is $" + CostRecovery.ToString();

        EquatyToBeSplitted = (LabelProduction * Convert.ToDecimal(TextBoxRoyalty.Text) / DevidedByHundred);
        LabelEquatyToBeSplitted.Text = "Equaty to be splitted between government and oil company is $" + (EquatyToBeSplitted - (RecoveryCost + Convert.ToDecimal(TextBoxCapex.Text))).ToString();

        //DevidedByTwo = 2;
        OilCompanyTaxableIncome = EquatyToBeSplitted - (RecoveryCost + Convert.ToDecimal(TextBoxCapex.Text));
        LabelOilCompanyTaxableIncome.Text = "Oil comapany equaty of equaty to be splitted is $" + (OilCompanyTaxableIncome / Convert.ToDecimal(DevidedByTwo)).ToString();

        GovernmentIncome = EquatyToBeSplitted - (RecoveryCost + Convert.ToDecimal(TextBoxCapex.Text));
        LabelGovernmentIncome.Text = "The government equaty of equaty to be splitted is $" + (GovernmentIncome / Convert.ToDecimal(DevidedByTwo)).ToString();

        //DevidedByHundred = 100;
        Tax = EquatyToBeSplitted - (RecoveryCost + Convert.ToDecimal(TextBoxCapex.Text));
        LabelTaxx.Text = "The total amount of tax that oil company pays to government is $" + ((Tax * Convert.ToDecimal(TextBoxTax.Text)) / DevidedByHundred).ToString();

        RoyaltyCost = EquatyToBeSplitted;
        LabelRoyaltyToBePaid.Text = "The amount of royalty to be paid to government is $" + ((RoyaltyCost * Convert.ToDecimal(TextBoxRoyalty.Text)) / DevidedByHundred).ToString();


        GovernmentTake = (GovernmentIncome / Convert.ToDecimal(DevidedByTwo));
        calculate = (GovernmentTake + (((Tax * Convert.ToDecimal(TextBoxTax.Text)) / DevidedByHundred)) + ((RoyaltyCost * Convert.ToDecimal(TextBoxRoyalty.Text)) / DevidedByHundred));
        LabelGovernmentTake.Text = "The total amount of government benifits/government take is $" + calculate.ToString();

        OilCompanyTake = (OilCompanyTaxableIncome / Convert.ToDecimal(DevidedByTwo));
        CalculateOilCompany = (GovernmentTake - ((Tax * Convert.ToDecimal(TextBoxTax.Text)) / DevidedByHundred));

        LabelOilCompanyTake.Text = "The total amount that oil company benifits/oil company take is $" + CalculateOilCompany.ToString();



        //Total = (PercentageOfGovernmentTake / (PercentageOfGovernmentTake + (GovernmentTake - ((Tax * Convert.ToDecimal(TextBoxTax.Text)) / DevidedByHundred)))) + (PercentageOfCompanyTake / (PercentageOfCompanyTake + (GovernmentTake + (((Tax * Convert.ToDecimal(TextBoxTax.Text)) / DevidedByHundred)) + ((RoyaltyCost * Convert.ToDecimal(TextBoxRoyalty.Text)) / DevidedByHundred)))) + (PercentageOfRecoveryCost + (GovernmentTake + (((Tax * Convert.ToDecimal(TextBoxTax.Text)) / DevidedByHundred)) + ((RoyaltyCost * Convert.ToDecimal(TextBoxRoyalty.Text)) / DevidedByHundred)) + (GovernmentTake - ((Tax * Convert.ToDecimal(TextBoxTax.Text)) / DevidedByHundred)));
        //LabelGovernmentTakePercentage.Text = (Total * (GovernmentTake + (((Tax * Convert.ToDecimal(TextBoxTax.Text)) / DevidedByHundred)) + ((RoyaltyCost * Convert.ToDecimal(TextBoxRoyalty.Text)) / DevidedByHundred)) / DevidedByHundred).ToString();
        //Total = (calculate + (GovernmentTake - ((Tax * Convert.ToDecimal(TextBoxTax.Text)) / DevidedByHundred))
        ClientScript.RegisterStartupScript(GetType(), "draw", "draw('" + chartType + "','" + CostRecovery + "','" + calculate + "','" + CalculateOilCompany + "','" + LabelAnnualProduction + "');", true);


        ////AnnualProduction = getData(TextBoxAnnualProduction);
        ////oilPrice = getData(TextBoxOilPrice);
        ////royalty = getData(TextBoxRoyalty);
        ////operatingCost = getData(TextBoxOPex);
        ////capitalCost = getData(TextBoxCapex);
        ////tax = getData(TextBoxTax);

        ////GrossRevenue = annualProduction * oilPrice;
        ////double NetRevenue = GrossRevenue * royalty;
        ////double RecoveryCost = operatingCost + capitalCost;
        ////double EquatyToBeSplitted = NetRevenue - RecoveryCost;
        ////double Tax = EquatyToBeSplitted * tax;
        ////double GovernmentTake = EquatyToBeSplitted + tax + royalty;
        ////double OilCompanyTake = EquatyToBeSplitted - tax;

        ////ClientScript.RegisterStartupScript(GetType(), "draw", "draw('" + chartType + "','" + NetRevenue + "','" + RecoveryCost + "','" +
        ////    EquatyToBeSplitted + "','" + Tax + "','" + GovernmentTake + "' + '" + OilCompanyTake + "');", true);


    }


    private decimal getData(TextBox txtBoxValue)
    {
        if (!string.IsNullOrWhiteSpace(txtBoxValue.Text))
        {
            return decimal.Parse(txtBoxValue.Text);
        }
        else
        {
            txtBoxValue.Text = "0";
            return 0;

        }

    }

    public string getChartType()
    {
    return DropDownList1.SelectedValue;
    }
}

