
<%@page import="java.util.HashSet"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/home.css" rel="stylesheet" type="text/css" />
        <title>Genic Intolerance</title>
    </head>
    <body>

        <%  ArrayList<String> genes = (ArrayList<String>) request.getAttribute("genes");
            HashSet<String> titleSet = (HashSet<String>) request.getAttribute("titleSet");
            Boolean isAllGene = (Boolean) request.getAttribute("isAllGene");
            Boolean isSelectAll = (Boolean) request.getAttribute("isSelectAll");

            if (genes == null) {
                genes = new ArrayList<String>();
                genes.add("SCN1A");
                genes.add("ATP1A3");
                genes.add("HLA-A");
                genes.add("MTOR");
                genes.add("MUC5B");

                titleSet = new HashSet<String>();
                titleSet.add("ALL_0.1%");
                titleSet.add("OEratio");
                titleSet.add("ExAC_0.05%");

                isAllGene = false;
                isSelectAll = false;
            }
        %>

        <div align="center">
            <div id="wrap">
                <DIV id=main>
                    <a href="http://humangenome.duke.edu/" target=_blank>
                        <img src="images/banner-CHGV.png"/>
                    </a>

                    <br/>

                    <div align="left" style="WIDTH: 740px;">
                        <h1>Genic Intolerance</h1>
                        <p>
                            RVIS (Residual Variation Intolerance Score) is a gene-based score intended to help 
                            in the interpretation of human sequence data.  The intolerance score in its 
                            current form is based upon allele frequency data as represented in whole 
                            exome sequence data from the NHLBI-ESP6500 data set.  The score is designed 
                            to rank genes in terms of whether they have more or less common functional 
                            genetic variation relative to the genome wide expectation given the amount 
                            of apparently neutral variation the gene has.  A gene with a positive score 
                            has more common functional variation, and a gene with a negative score has 
                            less and is referred to as "intolerant".   By convention we rank all genes 
                            in order from most intolerant to least.  As an example, a gene such as ATP1A3 
                            has a RVIS score of -1.53 and a percentile of 3.37%, meaning it is amongst the 
                            3.37% most intolerant of human genes.  Depending on what disease area you are a 
                            studying, you may way to consider either intolerant genes (neurodevelomental disease) 
                            or tolerant genes (some immunological diseases) as better candidates. 
                            Data sourced from: EVS-v.0.0.14, (June 20, 2012)
                        </p>

                        <p>
                            Currently this application accommodates genes within CCDS releases 9 to 15. 
                            It takes HGNC nomenclature for genes with at least one public CCDS transcript.
                        </p>

                        <span style="background-color: #e9e9e9">
                            Note that for genes with very low (Y), there may not be enough polymorphism data 
                            represented in EVS currently for an accurate assessment of genic intolerance, using 
                            the original formulation of RVIS.  For this reason, genes where Y is below 3 and 
                            X is relatively small (<30) have the additional option of a simple comparison reported 
                            based on the observed and expected functional variants in the gene ("OEratio" checkbox).  
                            In this formulation, allele frequency is ignored, and we simply compare all variants observed.   
                            Reported will be the score for this comparison and the genes corresponding genome-wide 
                            percentile for this comparison.  These percentiles are interpreted in the same 
                            ways as the original formation of RVIS. So that a gene with low Y value that 
                            scores as having a low ratio statistic is also judged "intolerant". We are currently 
                            working on a unified approach to capture those signals in a uniformed way across the genome.
                        </span>

                        <p>
                        <mark_underline>Update:</mark_underline> We now provide a revised RVIS (unpublished) based on the recently released ExAC 
                        sequencing data. The ExAC data can be found at 
                        (<a href="http://exac.broadinstitute.org/about">http://exac.broadinstitute.org/about</a>). 
                        <mark_bold>Note:</mark_bold> ExAC RVIS application is novel - any concerns or unexpected behavior please report to slave.petrovski@duke.edu
                        </p>

                        <p>
                            Citing use of RVIS (Genic Intolerance): 
                        </p>
                        <p>
                            Petrovski S., Wang Q., Heinzen E.L., Allen A.S., Goldstein D.B. (2013). 
                            Genic Intolerance to Functional Variation and the Interpretation of 
                            Personal Genomes. PLOS Genetics, 
                            <a href="http://www.plosgenetics.org/article/info:doi/10.1371/journal.pgen.1003709">doi: 10.1371/journal.pgen.1003709</a>
                        </p>

                        <p style="border-top: 1px solid #bbb;"></p>
                    </div>

                    <br/>

                    <div class="panel">
                        <form action="Controller" method="post" name="form">
                            <table>
                                <tr>
                                    <td align="right" title="Type your CCSD gene name line by line">Gene Name:</td>
                                    <td>
                                        <textarea wrap="soft" name="geneName" rows="6" cols="26" 
                                                  autofocus title="Type your CCSD gene name line by line"><%
                                                      for (String gene : genes) {
                                                          if (gene.isEmpty()) {
                                                              continue;
                                                          }

                                                          out.println(gene);
                                                      }
                                            %>
                                        </textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td align="left">
                                        <input type="checkbox" name="allGene" value="allGene" 
                                               <% if (isAllGene) {
                                                       out.print("checked");
                                                   }%>/> All Gene
                                    </td>
                                </tr>
                                <tr></tr>
                                <tr>
                                    <td align="right">All:</td>
                                    <td align="left">
                                        <input type="checkbox" name="titleSet" value="ALL_0.1%" 
                                               <% if (titleSet.contains("ALL_0.1%")) {
                                                       out.print("checked");
                                                   }%>/> 0.1% 
                                        <input type="checkbox" name="titleSet" value="ALL_1%" 
                                               <% if (titleSet.contains("ALL_1%")) {
                                                       out.print("checked");
                                                   }%>/> 1%
                                        <input type="checkbox" name="titleSet" value="ALL_0.01%"
                                               <% if (titleSet.contains("ALL_0.01%")) {
                                                       out.print("checked");
                                                   }%>/> 0.01% 
                                        <input type="checkbox" name="titleSet" value="PP2_ALL_0.1%" 
                                               <% if (titleSet.contains("PP2_ALL_0.1%")) {
                                                       out.print("checked");
                                                   }%>/> PP2 0.1%
                                    </td>
                                </tr>
                                <tr></tr>
                                <tr>
                                    <td align="right">EA:</td>
                                    <td align="left">
                                        <input type="checkbox" name="titleSet" value="EA_0.1%" 
                                               <% if (titleSet.contains("EA_0.1%")) {
                                                       out.print("checked");
                                                   }%>/> 0.1%
                                        <input type="checkbox" name="titleSet" value="EA_1%" 
                                               <% if (titleSet.contains("EA_1%")) {
                                                       out.print("checked");
                                                   }%>/> 1%
                                    </td>
                                </tr>
                                <tr></tr>
                                <tr>
                                    <td align="right">AA:</td>
                                    <td align="left">
                                        <input type="checkbox" name="titleSet" value="AA_0.1%" 
                                               <% if (titleSet.contains("AA_0.1%")) {
                                                       out.print("checked");
                                                   }%>/> 0.1%
                                        <input type="checkbox" name="titleSet" value="AA_1%" 
                                               <% if (titleSet.contains("AA_1%")) {
                                                       out.print("checked");
                                                   }%>/> 1%
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td align="left">
                                        <input type="checkbox" name="titleSet" value="OEratio" 
                                               <% if (titleSet.contains("OEratio")) {
                                                       out.print("checked");
                                                   }%>/> OEratio
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">ExAC:</td>
                                    <td align="left">
                                        <input type="checkbox" name="titleSet" value="ExAC_0.1%" 
                                               <% if (titleSet.contains("ExAC_0.1%")) {
                                                       out.print("checked");
                                                   }%>/> 0.1%
                                        <input type="checkbox" name="titleSet" value="ExAC_0.05%" 
                                               <% if (titleSet.contains("ExAC_0.05%")) {
                                                       out.print("checked");
                                                   }%>/> 0.05% (any population)
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td align="left">
                                        <input type="checkbox" name="selectAll" value="selectAll" 
                                               <% if (isSelectAll) {
                                                       out.print("checked");
                                                   }%>/> Select All (EA, AA, All, ExAC)
                                    </td>
                                </tr>
                                <tr></tr>
                                <tr>
                                    <td></td>
                                    <td align="right">                                
                                        <input class="blueButton" type="submit" name="submit" value="submit"/>&nbsp;
                                        <input class="redButton" type="button" name="reset" value="reset" onclick="location.href = 'index.jsp'"/>
                                    </td>
                                </tr>
                            </table>  
                        </form>
                    </div>

                    <%@include file="result.jsp" %>

                    <br/>

                    <div align="left" style="WIDTH: 740px;">
                        <p style="border-top: 1px solid #bbb"></p>

                        <p>
                        <mark_underline><a href="data/RVIS_PLoSGen_EVS_May2013.txt">Click Here</a></mark_underline> 
                        to download the full list of CCDS Release 9 RVIS scores. 
                        As published in <a href="http://www.plosgenetics.org/article/info:doi/10.1371/journal.pgen.1003709">doi: 10.1371/journal.pgen.1003709</a>
                        </p>

                        <p>
                        <mark_underline><a href="data/RVIS_Unpublished_ExAC_Nov2014.txt">Click Here</a></mark_underline> to download novel unpublished 
                        RVIS scores based on ExAC sequencing data release (accessed: October 20th 2014). 
                        Note, in addition to using a larger population of sequenced samples, 
                        this updated genic score differs from the original implementation in two major ways: 
                        the 'common' MAF is assigned as 0.05% and it now utilizes the stratified ethnicity data 
                        provided within ExAC.
                        </p>

                        <p style="border-top: 1px solid #bbb"></p>

                        <p>
                            Searches are available for precalculated genic intolerance scores, 
                            as adopted in the published manuscript that first introduced this gene-based 
                            quantitative scoring system. Options include the RVIS, RVIS-PP2 
                            (incorporating information from polyphen-2), EA or AA specific RVIS, and 0.01% or 1% RVIS. 
                            Output format consists of RVIS and the relative genome-wide intolerance percentile(%).
                        </p>
                    </div>
                </div>
            </DIV>

            <div class=counter>
                <a href="http://24counter.com/vmap/1374861066/" target=_blank>
                    <img src="http://24counter.com/map/view.php?type=180&id=1374861066" border="1" height="50">
                </a> 

                <br/>

                <!-- Start of StatCounter Code for Default Guide -->
                <script type="text/javascript">
                    var sc_project = 9126620;
                    var sc_invisible = 0;
                    var sc_security = "a763d730";
                    var scJsHost = (("https:" == document.location.protocol) ?
                            "https://secure." : "http://www.");
                    document.write("<sc" + "ript type='text/javascript' src='" +
                            scJsHost +
                            "statcounter.com/counter/counter.js'></" + "script>");
                </script>
                <noscript><div class="statcounter"><a title="web stats"
                                                      href="http://statcounter.com/free-web-stats/"
                                                      target="_blank"><img class="statcounter"
                                         src="http://c.statcounter.com/9126620/0/a763d730/0/"
                                         alt="web stats"></a></div></noscript>
                <!-- End of StatCounter Code for Default Guide -->
            </div>

            <DIV class=footer>
                <DIV class=footer-powerby>
                    <a href="http://humangenome.duke.edu/people/postdoctoral-associates#Slave_Petrovski" target=_blank>Slave Petrovski</a>, 
                    <a href="http://humangenome.duke.edu/faculty-and-staff/bioinformaticians#Zhong_Ren" target=_blank>Nick Ren</a>,  
                    <a href="http://humangenome.duke.edu/node/62" target=_blank>Dr. David Goldstein</a> 

                    <br/>

                    Copyright © 2014 Duke CHGV. All rights reserved.  
                </div>
            </DIV>
        </div>

    </body>
</html>
