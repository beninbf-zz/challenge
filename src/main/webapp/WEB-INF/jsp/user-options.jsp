<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.zendesk.challenge.data.domain.jpa.User" %>
<%@ page import="java.lang.reflect.Field" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<html lang="en">
    <head>
        <style>
            table, th, td {
              border: 1px black;
            }
        </style>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script type="text/javascript" src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="webjars/bootstrap/3.3.7/css/bootstrap.min.css" />
        <c:url value="/css/main.css" var="jstlCss" />
        <link href="${jstlCss}" rel="stylesheet" />
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">User Search Options</a>
                </div>
                <div id="navbar" class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="/">Back</a></li>
                    </ul>
                </div>
            </div>
        </nav>
       <div class="container">
            <div class="starter-template">
                <h1>Choose the field and type in the value you wish to search by</h1>
                <%
                    User user = new User();
                    Field[] fields = user.getClass().getDeclaredFields();
                    List<String> fieldNames = new ArrayList<>();
                    for(Field field: fields) {
                        if (field.getName().equals("id") || field.getName().equals("serialVersionUID")) {
                            continue;
                        }
                        fieldNames.add(field.getName());
                    }
                    request.setAttribute("fieldNames", fieldNames);
                 %>
                 <form id="userForm" action="/user">
                    <table>
                        <tbody>
                            <tr>
                                <td>
                                    <select id="userField" name="field">
                                        <option value="Select">Select the User Field</option>
                                        <c:forEach var="fieldName" items="${fieldNames}">
                                                <option value="${fieldName}"> ${fieldName} </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <td>
                                    User Field Value: <input type="text" id="value" name="value"><br>
                                </td>
                            </tr>
                            <tr>
                                <td><button id="submit">Submit</button></td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
        <script type="text/javascript">
            $("#userForm").submit(function(e) {
              if ($('#userField').val() == 'Select') {
                alert('You must select a valid field');
                e.preventDefault(e);
              }
            });
        </script>
    </body>
</html>
