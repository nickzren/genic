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
                                a gene score based module intended to help in the interpretation of human sequence data.</small>
                        </p>
                    </div>
                    <div class="col-xs-6 col-md-6">
                        <p class="lead" style="color: black">
                            <span class="label label-default">News</span>
                            <small>We now provide a revised RVIS gene score (unpublished) based on the recently released ExAC v2 
                                (release 2.0). The data can be found at 
                                (<a href="http://gnomad.broadinstitute.org">gnomad.broadinstitute.org</a>).</small>
                        </p>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-8 col-md-8">
                        <form class="form-search" action="Search">
                            <div class="input-group">
                                <input name="query" class="form-control input-lg tt-input"
                                       type="text" placeholder="Search for a gene or gene list" >
                                <div class="input-group-btn">
                                    <button class="btn btn-default input-lg tt-input" 
                                            type="submit">
                                        <i class="glyphicon glyphicon-search"></i></button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <p class="text-muted" style="margin-left: 8px">
                    Examples - 
                    Gene: <a href="Search?query=SCN1A">SCN1A</a>, 
                    Gene list: <a href="Search?query=SCN1A, ATP1A3, HLA-A, MTOR, MUC5B">
                        SCN1A, ATP1A3, HLA-A, MTOR, MUC5B</a> (comma delimited),
                    <a href="Search?query=All.Gene">All.Gene</a>
                </p>

                <%@include file="result.jsp" %>

                <div class="row equal">
                    <div class="col-xs-6 col-md-8">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <i class="fa fa-download"></i> Download
                            </div>
                            <div class="panel-body">
                                <p>
                                    <a href="data/GenicIntolerance_v3_12Mar16.txt">Click Here</a> 
                                    to download the full list of CCDS Release 9 RVIS gene score. 
                                    Please cite <a href="http://www.plosgenetics.org/article/info:doi/10.1371/journal.pgen.1003709">
                                        doi: 10.1371/journal.pgen.1003709</a>
                                </p>

                                <p>
                                    <a href="data/RVIS_Unpublished_ExAC_May2015.txt">Click Here</a> to download novel unpublished RVIS gene score 
                                    based on ExAC sequencing data release (accessed: January 13th 2015 [updated scores for release0.3]).
                                </p>
                                
                                <p>
                                    <a href="data/RVIS_Unpublished_ExACv2_March2017.txt">Click Here</a> to download novel unpublished RVIS gene score 
                                    based on ExAC v2 release 2.0 (accessed: March 15th 2017). As of this release we use CCDS release 20 and Ensembl 
                                    release 87 annotations.
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="col-xs-6 col-md-4">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <i class="fa fa-link"></i> Pipelines known to incorporate RVIS
                            </div>
                            <div class="panel-body">
                                <ul>
                                    <li><a href="http://redmine.igm.cumc.columbia.edu/projects/atav/wiki" target="_blank">ATAV</a></li>
                                    <li><a href="http://phenolyzer.usc.edu/" target="_blank">Phenolyzer</a></li>
                                    <li><a href="https://sites.google.com/site/jpopgen/dbNSFP" target="_blank">dbNSFP</a></li>
                                    <li><a href="https://gemini.readthedocs.org/en/latest/" target="_blank">GEMINI</a></li>
                                    <li><a href="https://stage.scicrunch.org/browse/resources/SCR_013850" target="_blank">SciCrunch</a></li>
                                </ul>    
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
