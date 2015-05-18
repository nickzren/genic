<%@page import="java.util.ArrayList"%>

<div>
    <%
        String title = (String) request.getAttribute("title");
        String geneName = (String) request.getAttribute("geneName");
        ArrayList<String> invalidGeneList = (ArrayList<String>) request.getAttribute("invalidGenes");

        if (title != null) {
            ArrayList<String> values = (ArrayList<String>) request.getAttribute("values");

            if (!values.isEmpty()) {
                String url = (String) request.getAttribute("download");
    %>

    <div class="row">
        <div class="col-md-10">
            <h4>
                <mark><%="Search query: " + geneName%></mark>
            </h4>
        </div>

        <div class="col-md-2" >
            <a style="float: right" href="<%=url%>" >
                <button type="button" class="btn btn-primary" data-toggle="tooltip" 
                        title="Download variant information with additional fields">
                    Download</button>
            </a>
        </div>
    </div>

    <table class="table table-striped">
        <tr>
            <%
                for (String str : title.split(",")) {
            %>
            <th class="text-center">
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
    </table>
    <%
        }
    } else {
    %>
    <br/>
    <%
        }

        if (invalidGeneList != null
                && !invalidGeneList.isEmpty()) {%>
    <br/> 
    <p class="lead">
        <span class="label label-warning">
            Genes: 
            <%
                out.print(invalidGeneList.toString());
            %>
            cannot be found. We currently only support HGNC gene names.
        </span>  
    </p> 
    <%
        }
    %>