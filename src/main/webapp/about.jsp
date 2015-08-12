<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="base/head.jsp" %>

    <body>
        <div class="container">

            <%@include file="base/header.jsp" %>

            <div class="container-main">
                <h3 class="page-header">About</h3>

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

                <p>
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
                </p>                
            </div>
        </div>

        <%@include file="base/footer.jsp" %>    
    </body>
</html>