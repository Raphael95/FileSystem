<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>Insert title here</title>
<style type="text/css">
        body {margin:0;padding:0;
        }
        #head {
            background-image: url(images/logo.png);
            background-color: black;
            height: 60px;
            width: 1365px;
            background-repeat: no-repeat;
            margin: 0;
            padding: 0;
        }
        #menu {
            color: white;
            font-size: 20px;
            margin: 0;
            padding: 0;
        }
            #menu table tr td {
                width: 120px;
                height: 58px;
                line-height: 58px;
                text-align:center;
                margin: 0;
                padding: 0;
            }
            #menu table tr td a{
            	color: white;
                width: 120px;
                height: 58px;
                line-height: 58px;
                text-align:center;
                margin: 0;
                padding: 0;
            }
            #menu table {
                position: relative;
                left: 230px;
                margin: 0;
                padding: 0;
            }
                #menu table tr td:hover {
                    background-color: gray;
                    margin: 0;
                    padding: 0;
                    cursor: pointer;
                }
        #inputSearch {
            position: relative;
            border:0px;
            left: 630px;
            top:-60px;
            margin: 0;
            padding: 0;
            height: 27px;
            padding: 2px 5px 3px 5px;
            width: 270px;
        }
        #searchlogo {
            position: relative;
            left: 593px;
            top: -47px;
        }
            #searchlogo:hover {
                cursor: pointer;
            }
        #submit1 {
            background-color: red;
            border-radius: 5px;
            width: 100px;
            height: 35px;
            color: white;
            font-size: 17px;
            border: none;
            position: relative;
            left: 1230px;
            top: -93px;
        }
            #submit1:hover {
                cursor: pointer;
                background-color: #CC0033;
            }
       
    </style>
</head>
<body>
<div id="head">
        <div id="menu">
            <table>
                <tr>
                    <td ><a href="TrainingPlan.jsp">培养方案</a></td>
                    <td><a href="Syllabus.jsp">教学大纲</a></td>
                    <td>其他文件</td>
                </tr>
            </table>
        </div>
        <div class="search">
            <input type="text" id="inputSearch" class="" value="" />
            <img id="searchlogo" src="images/search_icon.png" />
        </div>
        <div id="submit">
            <input id="submit1"type="submit" value="上传" />
        </div>
</div>
</body>
</html>