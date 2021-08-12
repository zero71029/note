<!-- <%@page import="java.util.HashMap"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%> -->
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style>
        html,
        body {
            /* background-image: url("./Starry-stars-space-night_1920x1080.jpg"); */
            margin: 0%;
            height: 100%;
        }

        header {
            position: absolute;
            top: 0%;
            left: 0%;
            width: 100%;
            height: 100px;
            background-color: rgba(0, 0, 0, 0.5);
        }

        #leftDiv {
            position: absolute;
            top: 100px;
            /* float: left; */
            width: 10%;
            height: 100%;
            background-color: rgba(255, 0, 0, 0.5);
        }

        #centerDiv {
            position: absolute;
            left: 10%;
            top :100px;
            width: 90%;
            height: 100%;
            background-color: rgba(255, 127, 80, 0.5);
            text-align: center;
            bottom: 0;
        }

        .AAA {
            margin: 30px;
            float: left;
            width: 150px;
            height: 190px;
            background-color: chartreuse;

            font-size: 20px;
        }
</style>
</head>
<body>
<canvas id="stars"></canvas>
<script src="star.js"></script>

	<header>AAA</header>
	<div id="leftDiv">
		<ul id="leftUl">


			<li><a href=""></a></li>

		</ul>
	</div>
	<div id="centerDiv">
		<div class="AAA">centerDiv</div>

		<!-- <%
		//Ū����r
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String pa = "java";
		int index = 0;
		String url = "jdbc:mysql://www.wizard71029.synology.me:3306/AAA?useSSL=false&serverTimezone=UTC&useFractionalSeconds=true";
		String user = "EEIT24";
		String passWord = "AAAbbb111222@";
		HashMap<String, String> hm = new HashMap();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			conn = DriverManager.getConnection(url, user, passWord);
			stmt = conn.createStatement();

			String sql = "Select en,cn from wordcard where package ='" + pa + "'";
			//System.out.println(sql);
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				index++;
				String en = rs.getString("en");
				String cn = rs.getString("cn");
				System.out.println(en + " : " + cn);
				hm.put(en, cn);
				if (en != null) {
			out.print("<div class='AAA'>" + en + "</div>");
				}
			}
		} catch (SQLException throwables) {
			throwables.printStackTrace();
		}
		if (rs != null) {
			try {
				// System.out.println("rs.close()");
				rs.close();
			} catch (SQLException throwables) {
				throwables.printStackTrace();
			}
		}
		if (stmt != null) {
			try {
				//System.out.println("stmt.close()");
				stmt.close();
			} catch (SQLException throwables) {
				throwables.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				System.out.println("conn.close()");
				conn.close();
			} catch (SQLException throwables) {
				throwables.printStackTrace();
			}
		}
		%> -->


	</div>


	<script>
		var inleft = [ "AAA", "BBB", "CCC", "DDD" ];

		var leftUl = document.getElementById("leftUl");
		for (let i = 0; i < inleft.length; i++) {
			leftUl.appendChild(document.createElement("li"));
		}
		var leftLi = document.getElementsByTagName("li");
		for (let i = 0; i < leftLi.length; i++) {
			let temp = document.createElement("a")
			temp.href = "aaa/ssss";
			temp.innerText = inleft[i];
			leftLi[i].appendChild(temp);
		}
		var word = {
			"AAA" : "aaa",
			"BBB" : "bbb",
			"CCC" : "ccc",
			"DDD" : "ddd",
			"EEE" : "eee",
			"FFF" : "fff",
			"GGG" : "ggg",
		}
		let en = Object.keys(word);
		var centerDiv = getElementById("centerDiv");
		for (let i = 0; i < en.length; i++) {
			let temp = document.createElement("div")
			temp.innerHTML = en[i]
			centerDiv.appendChild(temp);
		}
	</script>








</body>
</html>