<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>subRVIS</title>
        <meta charset="UTF-8">

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel='stylesheet' href='https://dq3p0g5ijakv8.cloudfront.net/assets/build-70/css/iframe.css' />
        <link rel="stylesheet" href="css/main.css">

        <script src="js/jquery-latest.min.js"></script>    
        <script src="js/bootstrap.min.js"></script>

        <link rel="shortcut icon" type="image/x-icon" href="favicon.ico">

        <script>var shinyapp_url = 'https://internal.shinyapps.io/ayalgussow/subrvis'</script>
        <script>var shinyapp_id = 70698</script>
        <script>var static_base_url = 'https://dq3p0g5ijakv8.cloudfront.net/assets/build-70'</script>
        <script src='https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js'></script>
        <script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js'></script>

    </head>

    <body>
        <div class="container">

            <%@include file="base/header.jsp" %>

            <div class="container-main">
                <div id='shinyapp'></div>
                <script type='text/javascript' src='https://dq3p0g5ijakv8.cloudfront.net/assets/build-70/js/pym.js'></script>
                <script type='text/javascript' src='https://dq3p0g5ijakv8.cloudfront.net/assets/build-70/js/iframe.js'></script>
            </div>
        </div>

        <footer>
            <nav class="navbar-fixed-bottom">        
                <div class="footer">
                    Ayal Gussow, Nick Ren, Dr. David Goldstein | Copyright © 2015
                    <a style="color: #aaa; " href="http://igm.columbia.edu" target="_blank">
                        Institute for Genomic Medicine</a>
                </div>
            </nav>
        </footer>
    </body>
</html>
