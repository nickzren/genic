<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>result</title>
    </head>
    <body>

        <div>
            <%
                String title = (String) request.getAttribute("title");
                ArrayList<String> invalidGeneList = (ArrayList<String>) request.getAttribute("invalidGenes");

                if (title != null) {
                    ArrayList<String> values = (ArrayList<String>) request.getAttribute("values");

                    if (!values.isEmpty()) {
            %>

            <br/>

            <p style="border-top: 1px solid #bbb;"></p>

            <br/>

            <table id="tablestyle">
                <tr>
                    <%
                        for (String str : title.split(",")) {
                    %>
                    <th align='center'>
                        <%=str%> 
                    </th>
                    <%
                        }
                    %>
                </tr>
                <%
                    for (String line : values) {
                %>
                <tr>    
                    <%
                        for (String str : line.split(",")) {
                    %>
                    <td align='center'>
                        <%=str%>
                    </td>
                    <%
                        }
                    %>
                </tr>
                <%
                    }
                %>
                <%
                    String url = (String) request.getAttribute("download");
                %>

                <tr align='right'>
                    <%
                        for (int i = 0; i < title.split(",").length - 1; i++) {
                    %>
                    <td></td>
                    <%}%>

                    <td>
                        <a class="blueButton" <%
                            out.print("href='" + url + "'");
                           %>>Download</a>
                    </td>
                </tr>
            </table>
            <%
                    }
                }
            %>

            <%
                if (invalidGeneList != null
                        && !invalidGeneList.isEmpty()) {%>
            <br/> 
            <br/>
            <span style="background-color: red; color:white; font-weight:bold; font-size: 14px">
                Genes: 
                <%
                    out.print(invalidGeneList.toString());
                %>
                cannot be found. We currently only support HGNC gene names.
            </span>   
            <%
                }
            %>

        </div>
    </body>
</html>
