<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" type="text/css" href="webjars/bootstrap/3.3.7/css/bootstrap.min.css" />
    <!--
        <spring:url value="/css/main.css" var="springCss" />
        <link href="${springCss}" rel="stylesheet" />
         -->
    <c:url value="/css/main.css" var="jstlCss" />
    <link href="${jstlCss}" rel="stylesheet" />
</head>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">ZenDesk Code Challenge</a>
			</div>
		</div>
	</nav>

	<div class="container">
		<div class="starter-template">
			<h1>Please select the entity you would like to search</h1>
			<table>
                    <!-- <input type="submit" value="Users" name="user-options"/> -->
                    <input type="button" onclick="location.href='user-options';" value="Users" />
                    <input type="button" onclick="location.href='ticket-options';" value="Tickets" />
                    <input type="button" onclick="location.href='organization-options';" value="Organizations" />
            </table>
		</div>
	</div>
	<script type="text/javascript" src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>