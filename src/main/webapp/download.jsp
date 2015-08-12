<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="base/head.jsp" %>

    <body>
        <div class="container">

            <%@include file="base/header.jsp" %>

            <div class="container-main">
                <h3 class="page-header">Download</h3>

                <p>
                    <a href="data/SCORES_n12_4NR_v16May15.txt">
                        <i class="fa fa-file"></i>
                        SCORES_n12_4NR_v16May15.txt
                    </a> 
                    (full list of CCDS Release 9 RVIS gene score)
                </p>

                <p>
                    <a href="data/RVIS_Unpublished_ExAC_May2015.txt">
                        <i class="fa fa-file"></i>
                        RVIS_Unpublished_ExAC_May2015.txt
                    </a> 
                    (novel unpublished RVIS gene score 
                    based on ExAC sequencing data release (accessed: January 13th 2015 [updated scores for release0.3]). 
                    Note, in addition to using a larger population of sequenced samples, this updated genic score 
                    differs from the original implementation in two major ways: the 'common' MAF is assigned as 0.05% 
                    and it now utilizes the stratified ethnicity data provided within ExAC.Genes on the X chromosome 
                    are assessed independently of the autosomal genes.)
                </p>
            </div>

        </div>

        <%@include file="base/footer.jsp" %>    
    </body>
</html>