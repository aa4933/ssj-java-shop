<%--
  Created by IntelliJ IDEA.
  User: xiaoqiang
  Date: 2017/1/4
  Time: 下午3:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<link rel="stylesheet" href="static/font/css/responsiveslides.css">
<script src="static/font/js/responsiveslides.min.js"></script>
<script>
    // You can also use "$(window).load(function() {"
    $(function () {
        // Slideshow 1
        $("#slider1").responsiveSlides({
            maxwidth: 2500,
            speed: 600
        });
    });
</script>

<!--start-image-slider---->
<div class="image-slider">
    <!-- Slideshow 1 -->
    <ul class="rslides" id="slider1">
        <li><img src="static/font/images/001.jpg" alt=""></li>
        <li><img src="static/font/images/002.jpg" alt=""></li>
        <li><img src="static/font/images/003.jpg" alt=""></li>
        <li><img src="static/font/images/004.jpg" alt=""></li>
    </ul>
</div>
<!--End-image-slider---->
