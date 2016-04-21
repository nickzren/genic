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
                    represented in EVS currently for an accurate assessment of genic intolerance, 
                    using the original formulation of RVIS. For this reason, genes where Y is below 3 
                    and X is relatively small (<30) have the additional option of a simple comparison 
                    reported based on the observed and expected functional variation in the gene ("OEratio" 
                    checkbox). In this formulation, allele frequency is ignored, and we simply compare the 
                    ‘rate of Observed non-synonymous variation’ over the ‘rate of Expected non-synonymous 
                    variation.’ The “Expected ratio” is determined by simulating all possible single 
                    nucleotide substitutions from the underlying protein-coding sequence context of the gene. 
                    The reported OEratio score reflects how divergent the observed ratio is from the expected 
                    ratio, and this is converted to a genome-wide percentile. These percentiles are 
                    interpreted in the same ways as the original formation of RVIS. So that a gene with low 
                    Y value that scores as having a low OEratio statistic is also judged "intolerant". 
                    We are currently working on a unified approach to capture those signals in a uniformed 
                    way across the genome.
                </p>
                
                <hr>
                
                <p>
                    ExAC_LoF_FDR: To generate the loss-of-function (LoF) deficiency measure “ExAC_LoF_FDR”, 
                    we apply our previously described methodology from 
                    <em><a href="http://www.sciencemag.org/lookup/doi/10.1126/science.aaa3650" target="_blank">Petrovski et al. (2015)</a></em> 
                    on the larger ExAC cohort.
                </p>
                
                <p>
                    We took each gene's missense, synonymous and loss-of-function mutation rates (See: Exome Aggregation Consortium et al., 
                    2016 (pre-print publication)) to calculate the gene’s expected frequency of protein-coding LoF variants (Ps). 
                    This was achieved by dividing the mutation rate associated with the simulated LoF variants to the overall genic 
                    mutation rate (sum of the three aforementioned mutation classes). The result is an estimate of the percentage 
                    of observed variants in a gene that we expect to be annotated as a LoF effect. We then use the ExAC database 
                    (release 0.3) to extract for each gene both the total number of observed unique variants (n) and specifically 
                    the number of observed unique LoF variants reported in that gene (x). This is the observed rate of LoF variants given all 
                    the protein-coding variation found in the gene within the ExAC reference cohort. Taking a gene’s expected rate of distinct 
                    LoF variation under neutrality as calculated by (Ps), a subset of 3,760 genes were identified as being significantly deficient 
                    of LoF variants using a one-sided binomial exact test with Benjamini & Hochberg false discovery rate multiple-testing correction 
                    (FDR = 1%) (See <em><a href="http://www.sciencemag.org/lookup/doi/10.1126/science.aaa3650" target="_blank">Petrovski et al. (2015)</a></em> 
                    for more information based on the EVS implementation).
                </p>
                
                <p>
                    While a fraction of the exome non-informative for LoF deficiency due to insufficient resolution (power) and will improve 
                    with a larger reference cohort, the list of genes that are already significantly LoF deficient based on the ExAC data 
                    release is already a valuable resource.
                </p>
            </div>
        </div>

        <%@include file="base/footer.jsp" %>    
    </body>
</html>