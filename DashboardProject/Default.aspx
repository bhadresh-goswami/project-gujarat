<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DashboardProject.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></scr>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>



    <script src="/lib/d3/d3.min.js"></script>
    <script src="/lib/jquery/dist/jquery.min.js"></script>
    <script src="/src/jquery.ntkPieChart.js"></script>
    <script src="/lib/chance.min.js"></script>
</head>
<body>
    <div class="container">
        <form id="form1" runat="server">

            <div class="row">
                <div class="col-md-12">
                    <h1 class="jumbotron">Get Details
                    </h1>
                </div>

            </div>
            <div class="row">
                    <div class="col-md-8">

                        <table class="table table-bordered">
                            <tr>
                                <td>Select District
                                </td>
                                <td>Select Taluka
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="-1">Select District</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlTaluka" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="-1">Select State</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>

                        <img src="images/Gujarat.jpg" class="img-fluid" />
                    </div>
                    <div class="col-md-4">

                        <script>
                            $(document).ready(function () {
                                //Lets generate some data:

                                var maxLabels = 5
                                minValue = 1,
                                    maxValue = 5;
                                maxTicks = 10;

                                var data = [];

                                var addValue = function (values) {
                                    values.push({
                                        label: chance.word(),
                                        value: chance.integer({ min: minValue, max: maxValue }),
                                        color: chance.color({ format: 'hex' })
                                    });
                                };

                                var changeValues = function (values) {
                                    values.forEach(function (val) {
                                        val.label = chance.word();
                                        val.value = chance.integer({ min: minValue, max: maxValue });
                                        val.color = chance.color({ format: 'hex' });
                                    })
                                }

                                addValue(data);

                                var piechart = $('#piechart').ntkPieChart({
                                    data: data
                                });

                                var currentTick = 0;

                                setInterval(function () {
                                    if (currentTick < maxTicks) {
                                        if (currentTick < maxLabels) {
                                            addValue(data);
                                        } else {
                                            changeValues(data);
                                        }
                                        currentTick++;
                                        changeValues(data);
                                        piechart.ntkPieChart('redraw');
                                    } else {
                                        data = [];
                                        piechart.ntkPieChart('setData', data);
                                        currentTick = 0;
                                        piechart.ntkPieChart('redraw');
                                    }
                                }, 2000);


                            });
  </script>

                        <div style="width: 50%; padding-bottom: 100%">
                            <div id="piechart" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;">
                            </div>
                        </div>
                    </div>
            </div>

        </form>
    </div>

</body>
</html>
