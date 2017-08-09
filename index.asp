<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=<%DMTranslate("charset");%>" />

		<title><% DMPrintAppName(); %></title>
		<link rel="stylesheet" href="/CStyle/Theme.css" type="text/css" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="expires" content="0" />
<meta http-equiv="Pragma" content="no-cache" />


		<script type="text/javascript">
		<!--

		function isAlreadyLoggedIn()
		{
			bloggedin = '<%DMIPLoggedIn();%>';
			if (bloggedin == "true")
			{
				window.location = '/Contents/index.asp';
			}
		}

		isAlreadyLoggedIn();

		function setFocusField()
		{
			var usernameDisplayed = "<%DMPrintConfigVar("LastLoginEnabled");%>";
			if (usernameDisplayed == "true")
				document.LoginForm.Password.focus();
			else
				document.LoginForm.Login.focus();
		}


		var message = '<%DMTranslate( DMGetServerVariable( "Message"));%>';

			function showMessage()
			{
				if (message != "" && message != " ")
					alert(message);
			}

			function getLanguages()
			{
				var count = 0;
				var langDescArray = new Array(0);
				var langSelectArray = new Array(0);
				var langValueArray = new Array(0);

				<% DMPrintLanguages( "
					if ('$0')
					{
						langDescArray.length = langDescArray.length + 1;
						langSelectArray.length = langSelectArray.length + 1;
						langValueArray.length = langValueArray.length + 1;
						langDescArray[count] = '$0';
						langSelectArray[count] = '$1';
						langValueArray[count] = '$3';
						count++;
					}
				"); %>

				if (count > 1)
				{
					document.write('<tr>');
					document.write('<td align="center">');
					document.write('<% DMTranslate( "Language"); %>');
					document.write('</td>');
					document.write('<td align="center">');
					document.write('<select size=1 name=Language maxLength=20>');
					for (i=0; i<langDescArray.length; i++)
					{
						document.write('<option value="' + langValueArray[i] + '"');
						if (langSelectArray[i] == 'true')
							document.write(' selected="selected"');
						document.write('>' + langDescArray[i] + '</option>');
					}
					document.write('</select>');
					document.write('</td>');
					document.write('</tr>');
				}
			}
		//-->
		</script>
</head>

<body class="content" style="margin-top: 30px;margin-left: 10px;margin-right: 5px;" <%	if ("true" == DMIsLoginRequired()) write( "onload=\"showMessage(); setFocusField();\">"); %>

	<!-- *** login page ****************************************************** -->

	<center>

	<form method="post" action="/goform/formLogin" name="LoginForm">

	<table width="400" align="center" cellspacing="0" cellpadding="0" border="1" class="dialogBackground" style="border-color:#000000;">
	  <tr>
		 <td valign="top">

			<!-- *** begin dialog box *** -->

			<table width="100%" align="center" cellspacing="0" cellpadding="0" border="0">

			  <!-- *** header bar *** -->
			  <tr>
				<td>
					<table width="100%" align="center" cellspacing="0" cellpadding="2" border="0">
						<tr>
							<td align="left" class="dialogHeader"><p style="padding:0px 5px 0px 5px;;">
								<% DMPrintAppName(); %>
								<!-- <% DMTranslate( "System Login"); %> -->
							</p></td>
						</tr>
					</table>
				</td>
			  </tr>

			  <!-- *** dialog box content *** -->
			  <tr>
				 <td>
					<table width="100%" cellspacing="0" cellpadding="10" border="0" class="dialogBackground">
						<tr>
							<td>
								<input type="hidden" name="HtmlOnly" value="true" />
								<table width="100%" cellspacing="0" cellpadding="0" border="0" class="dialogBackground">
									<%	if ("true" == DMIsLoginRequired())
										{
											write( "<tr><td align=\"center\">");
											DMTranslate( "Login Name");
											write( "</td><td align=\"center\"><input type=\"text\" name=\"Login\" size=\"20\" maxlength=\"20\" value=\"");
											if ("true" == DMGetConfigVar("LastLoginEnabled"))
												DMPrintUMVariable( "LastLoginUser");
											write( "\" /></td></tr><tr><td align=\"center\">");
											DMTranslate( "Password");
											write( "</td><td align=\"center\"><input type=\"password\" name=\"Password\" size=\"20\" maxlength=\"20\" /></td></tr>");
										}
									%>
								</table>
							</td>
						</tr>
						<tr>
							<td align="center">
										<input style="font-size:8pt; color:black;" type="submit" name="loginButton" value="<%DMTranslate( "Submit Login");%>" />
							</td>
						</tr>
					</table>

				</td>
			 </tr>
		  </table>
				</td>
			 </tr>
	</table>
	</form>
	</center>

</body>
</html>