<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/StyleSheet.css" rel="stylesheet" />
    <script src="Scripts/canvasjs.min.js"></script>
    <script src="Scripts/chartScript.js"></script>
    <title>Revenue Distribution</title>

</head>
<body>

    <div class="container heading">
        <div class="model text-center">

   <h1>Calculating Oil Industry Revenue Distribution / Cash Flow Modelling</h1>
   <h3>Cash Flow Modelling is a tool that assists business decision makers prior to their investiments decision.<br />
    Please enter your respective data according to empty fields below and click the calculate button at the bottom to get the revenue
        distribution shown in a chart alongside your potential profit and costs.
    </h3>            
        </div>
    </div>

    <hr class="top"/>

    <form id="form1" runat="server" class="form-horizontal">
        
    <div class ="container content">

        <br />
        <div class="row">

         <asp:ValidationSummary ID="vs" runat="server" CssClass="alert-danger" HeaderText="Enter only digits in the following fields:" 
                    BorderStyle="Dashed" BorderWidth="5px" BorderColor="DarkBlue" />
          <br />
         
       <div class="col-sm-6">
            <div class ="row"> 
              <div class="col-md-4 col-md-offset-1">
                

                  <asp:Label ID="LabelAnnualProduction" runat="server" class="control-label" Text="Annual Production"></asp:Label>
                  
              </div>
            <div class="col-md-6">
                <asp:TextBox ID="TextBoxAnnualProduction" runat="server" CssClass="form-control txtBox" Width="100px" placeholder="MMbbl"></asp:TextBox>
                <asp:CompareValidator ID="cvAnnualProduction" runat="server" ControlToValidate="TextBoxAnnualProduction" Type="Integer" Operator="DataTypeCheck" Text="*"  ErrorMessage="Annual Production" Display="Static" CssClass="text-danger"></asp:CompareValidator>
            </div>
          </div> 

        <br/>

      <div class ="row">
              <div class="col-md-4 col-md-offset-1">
              

                 <asp:Label ID="LabelOilPrice" runat="server"  class="control-label" Text="Oil Price" ></asp:Label>
               
              </div>
          <div class="col-md-6">
         
              <asp:TextBox ID="TextBoxOilPrice" runat="server" CssClass="form-control txtBox" Width="100px" placeholder="$"></asp:TextBox>
              <asp:CompareValidator ID="cvOilPrice" runat="server" ErrorMessage="Oil Price" ControlToValidate="TextBoxOilPrice" Type="Currency" Operator="DataTypeCheck" Text="*" Display="Static" CssClass="text-danger"></asp:CompareValidator>
          </div>
      </div> 
       
        <br/>
    
     <div class ="row">
           <div class="col-md-4 col-md-offset-1">
              
               <asp:Label ID="LabelRoyalty" runat="server" class="control-label" Text="Royalty"></asp:Label>
            
           </div>
          <div class="col-md-6">
         
              <asp:TextBox ID="TextBoxRoyalty" runat="server" CssClass="form-control txtBox" Width="100px" placeholder="%"></asp:TextBox>
              <asp:CompareValidator ID="cvRoyalty" runat="server" ErrorMessage="Royalty" ControlToValidate="TextBoxRoyalty" Type="Integer" Operator="DataTypeCheck" Text="*" Display="Static" CssClass="text-danger" ></asp:CompareValidator>
          </div>
      </div>  
        
        <br/>

     <div class ="row">
           <div class="col-md-4 col-md-offset-1"> 
               

               <asp:Label ID="LabelOpex" runat="server" class="control-label" Text="OPEX - Operating Cost"></asp:Label>
              
           </div>
        <div class="col-md-6">
         
              <asp:TextBox ID="TextBoxOPex" runat="server" CssClass="form-control txtBox" Width="100px" placeholder="$MM"></asp:TextBox>
            <asp:CompareValidator ID="cvOpex" runat="server" ErrorMessage="Opex - Operating Cost" ControlToValidate="TextBoxOpex" Type="Integer" Operator="DataTypeCheck" Text="*" Display="Static" CssClass="text-danger"></asp:CompareValidator>
        </div>
     </div>
          
        <br/> 
          

     <div class ="row">
           <div class="col-md-4 col-md-offset-1">
              
               <asp:Label ID="LabelCapex" runat="server" class="control-label" Text="Capex - Capital Cost"></asp:Label>
               
           </div>
        <div class="col-md-6">
               <asp:TextBox ID="TextBoxCapex" runat="server" CssClass="form-control txtBox" Width="100px" placeholder="$MM"></asp:TextBox>
            <asp:CompareValidator ID="cvCapex" runat="server" ErrorMessage="Capex - Capital Cost" ControlToValidate="TextBoxCapex" Type="Integer" Operator="DataTypeCheck" Text="*" Display="Static" CssClass="text-danger"></asp:CompareValidator>
        </div>
     </div>
         
        <br/>
     
     <div class ="row">
           <div class="col-md-4 col-md-offset-1"> 
               
               <asp:Label ID="LabelTax" runat="server" class="control-label">Tax</asp:Label>
               
           </div>
        <div class="col-md-6">

               <asp:TextBox ID="TextBoxTax" runat="server" CssClass="form-control txtBox" Width="100px" placeholder="%"></asp:TextBox>
            <asp:CompareValidator ID="cvTax" runat="server" ErrorMessage="Tax" ControlToValidate="TextBoxTax" Type="Integer" Operator="DataTypeCheck" Text="*" Display="Static" CssClass="text-danger"></asp:CompareValidator>
       </div>
    </div>

        <br/>

        <br/>

     <div class ="row">
           <div class="col-md-4 col-md-offset-1"></div> 
              
          
        <div class="col-md-6">
              <asp:Button ID="ButtonCalculate" runat="server" Text="Calculate" CssClass="btn-success" OnClick="Button1_Click"/>
        </div>
    </div>
  </div>  
            <br />        
                <div class="col-md-6">
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <div id="chartContainer" style="height: 400px; width: 100%;">
                                <div id="chartPlaceholder"></div>
                                <div id="noDataPlaceholder" class="h1"></div>
                            </div>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-4 col-md-offset-1">

                            <asp:Label ID="LabelChartType" runat="server" Visible="false" Text="Change chart type" ForeColor="White" Font-Bold="true"></asp:Label>
                       </div>
                   <div class="col-md-6">
                       <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="true"
                           Font-Size="Medium" ForeColor="Black" Visible="False" CausesValidation="True">
                          <asp:ListItem Selected="True" Value="pie">Pie</asp:ListItem>
                          <asp:ListItem Value="doughnut">Doughnut</asp:ListItem>
                          <asp:ListItem Value="column">Column</asp:ListItem>
                          <asp:ListItem Value="bar">Bar</asp:ListItem>
                          </asp:DropDownList>
                   </div>
              </div> 
         </div>
    </div>                                             
 </div> <!--closing container -->


        <br />
                
       
       
          <div class="row">
            <div class="col-md-6">
              
               <div class=" col-md-4  col-md-offset-1"></div>
                <div class="col-md-6">
                  <asp:Label ID="LabelTotalAnnualProduction" runat="server" Text="" ForeColor="Black" Font-Bold="true" ></asp:Label> 
                  <br />
                  <asp:Label ID="LabelNetRevenue" runat="server" Text="" ForeColor="Black" Font-Bold="true"></asp:Label>
                  <br />
                  <asp:Label ID="LabelRecoveryCost" runat="server" Text="" ForeColor="Black" Font-Bold="true"></asp:Label>
         
                  <br />
                  <asp:Label ID="LabelEquatyToBeSplitted" runat="server" Text="" ForeColor="Black" Font-Bold="true"></asp:Label>
                  <br />
                  <asp:Label ID="LabelOilCompanyTaxableIncome" runat="server" Text="" ForeColor="Black" Font-Bold="true"></asp:Label>
                  <br />
                  <asp:Label ID="LabelGovernmentIncome" runat="server" Text="" ForeColor="Black" Font-Bold="true"></asp:Label>
                  <br />

                  <asp:Label ID="LabelTaxx" runat="server" Text="" ForeColor="Black" Font-Bold="true"></asp:Label>
                  <br />
                  <asp:Label ID="LabelRoyaltyToBePaid" runat="server" Text="" ForeColor="Black" Font-Bold="true"></asp:Label>
                  <br />
                  <asp:Label ID="LabelGovernmentTake" runat="server" Text="" ForeColor="Black" Font-Bold="true"></asp:Label>
                  <br />
                  <asp:Label ID="LabelOilCompanyTake" runat="server" Text="" ForeColor="Black" Font-Bold="true"></asp:Label>

                 <asp:Label ID="LabelGovernmentTakePercentage" runat="server" Text="" ForeColor="Black" Font-Bold="true"></asp:Label>
                 <br />
                 <asp:Label ID="LabelOilCompanyTakePercentage" runat="server" Text="" ForeColor="Black" Font-Bold="true"></asp:Label>
                 <br />
                 <asp:Label ID="LabelRecoveryCostPercentage" runat="server" Text="" ForeColor="Black" Font-Bold="true"></asp:Label>
                 <br />
                 </div>
               </div> 
             </div>
           
        

        <div id="A"></div>
       
</form>
</body>
</html>
