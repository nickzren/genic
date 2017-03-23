<%@page import="object.Gene"%>
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
                       title="HGNC Gene name">
                        GENE
                    </a>
                </th>

                <th class="text-center">
                    <a class="black" data-toggle="tooltip" 
                       title="Residual Variation Intolerance Score">
                        RVIS
                    </a>
                </th>

                <th class="text-center">
                    <a class="black" data-toggle="tooltip" 
                       title="RVIS v2, constructed on the ExAC data release">
                        %ExAC RVIS
                    </a>
                </th>

                <th class="text-center">
                    <a class="black" data-toggle="tooltip" 
                       title="FDR adjusted p-value reflects the significance of the departure from the expected rate of LoF variants">
                        ExAC LoF FDR
                    </a>
                </th>

                <th class="text-center">
                    <a class="black" data-toggle="tooltip" 
                       title="RVIS v3, constructed on the ExAC v2 data release">
                        %ExAC v2 RVIS
                    </a>
                </th>

                <th class="text-center">
                    <a class="black" data-toggle="tooltip" 
                       title="RVIS v3, constructed on the ExAC v2 data release">
                        Edge Case (%OE-ratio)
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
                    <%=gene.getExAC_005_Popn_Percent()%>
                </td>
                <td>
                    <%=gene.getLoF_FDR_ExAC()%>
                </td>
                <td>
                    <%=gene.getExAC_v2_005_Popn()%>
                </td>
                <td>
                    <%=gene.getEdge_Case_OERatio_percentile_ExAC_v2()%>
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