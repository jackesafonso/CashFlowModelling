draw = function (chartType, CostRecovery, calculate, CalculateOilCompany) {

    if (CostRecovery === "0" && calculate === "0" && CalculateOilCompany === "0") {
        document.getElementById("LabelChartType").style.display = "none";
        document.getElementById("DropDownList1").style.display = "none";
        document.getElementById("chartPlaceholder").style.display = "none";
        document.getElementById("noDataPlaceholder").textContent = "Not enough data to draw chart";

    } else {


        var chart = new CanvasJS.Chart("chartContainer", {

            backgroundColor: "rgba(160, 32, 240, 0)", 
            title: {
                fontColor: "black",
                text: "Revenue Distribution",
                


            },

            animationEnabled: true, //disable here

            data: [
            {
                // Change type to "doughnut", "line", "splineArea", etc.
                type: chartType,
                dataPoints: [

                    { label: "Recovery Cost is $" + CostRecovery, y: parseFloat(CostRecovery), indexLabelFontColor: "black" },
                    { label: "Government Take $" + calculate, y: parseFloat(calculate), indexLabelFontColor: "black" },
                    { label: "Oil Company Take $" + CalculateOilCompany, y: parseFloat(CalculateOilCompany), indexLabelFontColor: "black" },

                ]
            }
            ]
        });
        chart.render();
    }
}


