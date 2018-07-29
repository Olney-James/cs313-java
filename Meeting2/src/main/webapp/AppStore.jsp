<%-- 
    Document   : AppStore
    Created on : Mar 31, 2016, 7:04:22 PM
    Author     : james_olney
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <title>Meeting Page Ad</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <style>
        .mySlides {display:none}
        .w3-left, .w3-right, .w3-badge {cursor:pointer}
        .w3-badge {height:13px;width:13px;padding:0;background-color:transparent}
        p.copyright{
            text-align: center;
            color: cadetblue;
        }
    </style>
    <body>


        <div class="container">
            <h2>Meeting App</h2>
            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#home">Overview</a></li>
                <li><a data-toggle="tab" href="#menu1">Reviews</a></li>
                <li><a data-toggle="tab" href="#menu2">Instructions</a></li>
            </ul>

            <div class="tab-content">
                <div id="home" class="tab-pane fade in active">
                    <br>
                    <div class="w3-content w3-display-container" style="max-width:800px">
                        <img class="mySlides" src="AppStore.png" style="width:100%">
                        <img class="mySlides" src="AddHangout.png" style="width:100%">
                        <img class="mySlides" src="Hangout.png" style="width:100%">
                        <div class="w3-center w3-section w3-large w3-text-white w3-display-bottomleft" style="width:100%">
                            <div class="w3-left w3-padding-left w3-hover-text-khaki" onclick="plusDivs(-1)">❮</div>
                            <div class="w3-right w3-padding-right w3-hover-text-khaki" onclick="plusDivs(1)">❯</div>
                            <span class="w3-badge demo w3-border w3-hover-white" onclick="currentDiv(1)"></span>
                            <span class="w3-badge demo w3-border w3-hover-white" onclick="currentDiv(2)"></span>
                            <span class="w3-badge demo w3-border w3-hover-white" onclick="currentDiv(3)"></span>
                        </div>
                    </div>
                    <script>
                        var slideIndex = 1;
                        showDivs(slideIndex);

                        function plusDivs(n) {
                            showDivs(slideIndex += n);
                        }

                        function currentDiv(n) {
                            showDivs(slideIndex = n);
                        }

                        function showDivs(n) {
                            var i;
                            var x = document.getElementsByClassName("mySlides");
                            var dots = document.getElementsByClassName("demo");
                            if (n > x.length) {
                                slideIndex = 1
                            }
                            if (n < 1) {
                                slideIndex = x.length
                            }
                            ;
                            for (i = 0; i < x.length; i++) {
                                x[i].style.display = "none";
                            }
                            for (i = 0; i < dots.length; i++) {
                                dots[i].classList.remove("w3-white");
                            }
                            x[slideIndex - 1].style.display = "block";
                            dots[slideIndex - 1].classList.add("w3-white");
                        }
                    </script>
                    <hr>
                    <p>The original intent of this application was to create an online location where missionaries could set up a meeting where addicts/supporters could anonymously join a hangouts meeting that would essentially provide opportunity for anyone anywhere to join the meeting. What has been created instead, is perhaps better.</p>
                    <p>Because the Hangouts API prevented the Anonymity, this application changed paths to instead become a page for support, used as a tool to reach out to those in groups outside of meetings. They can contact one another, share meeting dates (and other dates such as firesides and temple dates) and other sources used for recovery.</p>
                    <hr>
                </div>
                <div id="menu1" class="tab-pane fade">
                    <hr>
                    <p><b>Sister Olney--></b> After reading "Every Other Monday" by John Kasich, I've been wanting to organize a bible study for friends and family. This application has made it possible to involve my friends face to face who don't live nearby.</p>
                    <hr>
                </div>
                <div id="menu2" class="tab-pane fade">
                    <h3>Instructions</h3>
                    <p>Enter a Comment and click Post button</br>
                        Shall write a message displayed in the messaging board</br>
                        Click Resources button to view resources</br>
                        Return to main page by clicking button in top left corner</br>
                        Click “Account:Guest”, click “Login as Admin” Enter “test” for the password, and click Login button</br>
                        Shall view “Start a Hangout” button that if clicked, will start a phone call.</br>
                    </p>
                    <hr>
                </div>

            </div>
        </div>
    <center><a href='index.jsp'>View Site</a></center>
    <hr>

    <p class="copyright">© 2016 by Olney. All rights reserved.</p>   

</body>
</html> 