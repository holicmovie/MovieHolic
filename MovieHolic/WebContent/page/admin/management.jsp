<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp" %>
<%@ include file="/template/boot_431.jsp" %>
<%@ include file="/template/nav.jsp" %>

<!-- Main -->
<div class="wrapper style1">

<!-- 날짜 -->

<link id="themecss" rel="stylesheet" type="text/css" href="//www.shieldui.com/shared/components/latest/css/light/all.min.css" />
<script type="text/javascript" src="//www.shieldui.com/shared/components/latest/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="//www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>


<script type="text/javascript">
    jQuery(function ($) {
        $(".datepicker").shieldDatePicker();
    });
</script>
<style>
    .container {
        background-image: url("/Content/img/datepicker/s4.png");
        background-position: center;
        background-repeat: no-repeat;
        height: 740px;
        text-align: center;
    }
    .top {
        padding-top: 290px;
    }
    #field {
        width: 200px;                
        line-height: 37px;        
        text-align: center;
        background-color: white;
        opacity:0.83;
        padding: 7px;
        margin: 0 auto;
    }
</style>
<div class="container">
	<div class="row">
		<div class="col-lg-4">
			<img src="/MovieHolic/images/endgame.jpg" class="img-thumbnail" alt="Cinque Terre" width="150" height="200"> 
		</div>
		<div class="col-lg-8">
			<div class="col-lg-12"></div>
			<div class="col-lg-12">
				<div class="input-group mb-3">
				    <input type="text" class="form-control" placeholder="name" id="name" name="name">
				<div class="input-group-append">
				    <button type="submit" class="btn btn-primary">Submit</button>
				</div>
			</div>
			<div class="col-lg-12">
				<div class="float-right">
				<span style="color:#D4D4D4; font-weight:900; font-size:17px; opacity:1;">Date:</span>
				<input class = "datepicker"/>
				<span style="color:#D4D4D4; font-weight:900; font-size:17px; opacity:1;">Date:</span>
				<input class = "datepicker"/>
				</div> 
			</div>
		</div>     
	</div>
</div>

</div>
<%@ include file="/template/footer.jsp" %>