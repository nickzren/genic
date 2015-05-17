<%@page import="java.util.HashSet"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>    
    <%@include file="base/head.jsp" %>

    <body>
        <div class="container">

            <%@include file="base/header.jsp" %>

            <div class="container-main">                
                <div class="row equal">
                    <div class="col-xs-6 col-md-6">
                        <p class="lead">
                            <a class="none cursor" href="about.jsp">
                                <span class="label label-default">About</span>
                            </a> 
                            <small style="color: black">RVIS (Residual Variation Intolerance Score) is 
                                a gene-based score intended to help in the interpretation of human sequence data.</small>
                        </p>
                    </div>
                    <div class="col-xs-6 col-md-6">
                        <p class="lead" style="color: black">
                            <span class="label label-default">News</span>
                            <small>We now provide a revised RVIS (unpublished) based on the recently released ExAC 
                                sequencing data. The ExAC data can be found at 
                                (<a href="http://exac.broadinstitute.org/about">http://exac.broadinstitute.org/about</a>).</small>
                        </p>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-6 col-md-6">
                        <form class="form-search" action="Controller">
                            <div class="input-group">
                                <input name="geneName" class="form-control input-lg tt-input"
                                       type="text" placeholder="Search for a gene" >
                                <div class="input-group-btn">
                                    <button class="btn btn-default input-lg tt-input" 
                                            type="submit">
                                        <i class="glyphicon glyphicon-search"></i></button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <p class="text-muted" style="margin-left: 10px">
                    Examples - 
                    Gene: <a href="Controller?geneName=SCN1A">SCN1A</a>             
                </p>

                <%@include file="result.jsp" %>

                <div class="row">
                    <div class="col-xs-6 col-md-4">
                        <div class="panel panel-default">
                            <div class="panel-heading"></div>
                            <div class="panel-body">
                                <a href="data/RVIS_PLoSGen_EVS_May2013.txt">Click Here</a> 
                                to download the full list of CCDS Release 9 RVIS scores. 
                                As published in <a href="http://www.plosgenetics.org/article/info:doi/10.1371/journal.pgen.1003709">
                                    doi: 10.1371/journal.pgen.1003709</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-6 col-md-8">
                        <div class="panel panel-default">
                            <div class="panel-heading"></div>
                            <div class="panel-body">
                                <a href="data/RVIS_Unpublished_ExAC_May2015.txt">Click Here</a> to download novel unpublished RVIS scores 
                                based on ExAC sequencing data release (accessed: January 13th 2015 [updated scores for release0.3]). 
                                Note, in addition to using a larger population of sequenced samples, this updated genic score 
                                differs from the original implementation in two major ways: the 'common' MAF is assigned as 0.05% 
                                and it now utilizes the stratified ethnicity data provided within ExAC.Genes on the X chromosome 
                                are assessed independently of the autosomal genes.
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <br/>

            <%@include file="counter.jsp" %>  

            <%@include file="base/footer.jsp" %>  
        </div>
    </body>
</html>
