<%@page import="igm.genic.object.Gene"%>
<%@page import="java.util.ArrayList"%>


<div>
    <%
        String query = (String) request.getAttribute("query");
        ArrayList<String> invalidGeneList = (ArrayList<String>) request.getAttribute("invalidGenes");
        ArrayList<Gene> geneList = (ArrayList<Gene>) request.getAttribute("geneList");

        if (geneList != null) {
            String url = (String) request.getAttribute("url");
    %>

    <div class="row">
        <div class="col-md-10">
            <h4>
                <mark><%="Search query: " + query%></mark>
            </h4>
        </div>

        <div class="col-md-2" >
            <a style="float: right" href="<%=url%>" >
                <button type="button" class="btn btn-primary" data-toggle="tooltip" 
                        title="Download gene intolerance score information with additional fields">
                    Download</button>
            </a>
        </div>
    </div>

    <table class="table table-striped">
        <thead>
            <tr>
                <th class="text-center">
                    <a class="black" data-toggle="tooltip" 
                       title="......">
                        GENE
                    </a>
                </th>

                <th class="text-center">
                    <a class="black" data-toggle="tooltip" 
                       title="......">
                        ALL_0.1%
                    </a>
                </th>

                <th class="text-center">
                    <a class="black" data-toggle="tooltip" 
                       title="......">
                        PP2_ALL_0.1%
                    </a>
                </th>

                <th class="text-center">
                    <a class="black" data-toggle="tooltip" 
                       title="......">
                        EA_0.1%
                    </a>
                </th>

                <th class="text-center">
                    <a class="black" data-toggle="tooltip" 
                       title="......">
                        AA_0.1%
                    </a>
                </th>

                <th class="text-center">
                    <a class="black" data-toggle="tooltip" 
                       title="......">
                        %OEratio
                    </a>
                </th>

                <th class="text-center">
                    <a class="black" data-toggle="tooltip" 
                       title="......">
                        %ExAC_0.05%popn
                    </a>
                </th>
            </tr> 
        </thead>

        <tbody>
            <%
                for (Gene gene : geneList) {
            %>
            <tr class="text-center">    
                <td>
                    <%=gene.getGene()%>
                </td>
                <td>
                    <%=gene.getALL_01()%>
                </td>
                <td>
                    <%=gene.getPP2_ALL_01()%>
                </td>
                <td>
                    <%=gene.getEA_01()%>
                </td>
                <td>
                    <%=gene.getAA_01()%>
                </td>
                <td>
                    <%=gene.getOEratio()%>
                </td>
                <td>
                    <%=gene.getExAC_005_Popn()%>
                </td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
        
    <script type="text/javascript">
        $(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>    

    <%
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