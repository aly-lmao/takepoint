<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1 user-scalable=0">
		<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
		<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Expires" content="0">

		<title>Takepoint.io</title>

		<link rel="stylesheet" type="text/css" href="a.css" />
		<link rel="icon" type="image/png" href="img/favicon-16x16.png" sizes="16x16">
		<link rel="icon" type="image/png" href="img/favicon-32x32.png" sizes="32x32">
		<link rel="icon" type="image/png" href="img/favicon-96x96.png" sizes="96x96">

		<link href="https://fonts.googleapis.com/css?family=Orbitron:900" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">

	</head>
	<body oncontextmenu="return false;">
		<script>
			var aiptag = aiptag || {};
			aiptag.cmd = aiptag.cmd || [];
			aiptag.cmd.display = aiptag.cmd.display || [];
			aiptag.cmd.player = aiptag.cmd.player || [];
			aiptag.consented = true;

			aiptag.cmp = {
				show: true,
				position: "centered",
				button: true,
				buttonText: "Privacy settings",
				buttonPosition: "bottom-right"
			}
		</script>
		<script async src="//api.adinplay.com/libs/aiptag/pub/TKP/takepoint.io/tag.min.js"></script>

		<span id="loading" class="loading-connecting">Loading...</span>
		<span id="connecting" class="loading-connecting">Connecting...</span>
		<canvas id="canvas"></canvas>
		<canvas id="hud"></canvas>

		<div id="chatboxContainer">
			<input id="chatbox" autocomplete="off" placeholder="Type a message" maxlength="32" length="32" style="display:none;">
		</div>

		<div class="game-menu-container" id="enterGameContainer">
			<div class="featured-game-container">
				<a href="https://gulch.io?ref=takepoint" target="_blank"><img id="featuredGameThumbnail" src="img/featured-game-thumbnail.png"></a>
			</div>

			<img id="logo" src="/img/logo.png">

			<h2 id="gameFact"></h2>

			<div class="menu-container">
				<div class="menu-segment" id="a-left">
					<div id='takepoint-io_300x250'>
						<script type='text/javascript'>
							aiptag.cmd.display.push(function() { aipDisplayTag.display('takepoint-io_300x250'); });
						</script>
					</div>
				</div>
				<div class="menu-middle">
					<div class="menu-segment enter-game-container">
						<button type="button" class="play-button" id="p" onclick="eg()">Play</button>
						<div class="auth-button-row">
							<button type="button" class="authBtn" id="loginBtn" style="display:none;">Login</button>
							<button type="button" class="authBtn" id="registerBtn" style="display:none;">Register</button>
							<button type="button" class="authBtn center" id="logoutBtn" style="display:none;" onclick="logout()">Logout</button>
						</div>
						<div class="enter-game-row">
							<h3 id="authLabel">Not Logged In</h3>
						</div>
					</div>
					<div class="menu-segment server-selection">
						<h1 class="menu-title">Servers</h1>
						<div class="server-selector-container">
							<select id="serverSelector" class="server-selector" onchange="switchServer(this.value)"></select>
						</div>
					</div>
				</div>
				<div class="menu-segment info-scroller">
					<h1 class="menu-title">Top Scores Today</h1>
					<table id="highScoresTable" width="100%">
						<tbody id="highScoresTableBody"></tbody>
					</table>
					
					<h2 class="menu-title">How to play</h2>
					<p class="how-to-play-text">Capture and defend points from other teams, unlock weapons, upgrades and perks.</p>

					<h2 class="menu-title">Controls</h2>
					<p class="how-to-play-text">
						Move: WASD / Arrow Keys<br>
						Look: Mouse<br>
						Reload: R<br>
						Use Perk: Spacebar<br>
						Chat: Enter<br>
					</p>

					<h2 class="menu-title">Gameplay</h2>
					<p class="how-to-play-text">
						You have two health bars, orange and green. Orange is a non rechargeable shield. Green is your health, it will recharge over time.
					</p>
					<p class="how-to-play-text">
						You'll receive one upgrade point at each level from 1 to 10. After level 10, you'll be awarded an upgrade point every three levels.
					</p>	
					<p class="how-to-play-text">
						Better weapons are unlocked when you reach Level 10. They will automatically replace your pistol.
					</p>
					<p class="how-to-play-text">
						Perks are unlocked when you reach Level 15. Press Spacebar to use them.
					</p>
				</div>
			</div>
			<div class="menu-segment wide-ad-unit" id="a-bottom">
				<div id='takepoint-io_970x250'>
					<script type='text/javascript'>
						aiptag.cmd.display.push(function() { aipDisplayTag.display('takepoint-io_970x250'); });
					</script>
				</div>
			</div>
			
			<div class="discord-button-container">
				<a id="discordButton" target="_blank" href="https://discord.gg/vbZqzuv"></a>
			</div>

			<div id="footers">
				<div id="infoFooter">
					<a id="moreGamesLink" target="_blank" href="https://ioground.com">More Games</a> | 
					<a target="_blank" href="https://stats.takepoint.io">Stats</a> | 
					<a target="_blank" href="https://stats.takepoint.io/changelog">v1.13.1</a>
				</div>
			</div>
		</div>

		<div class="respawn-ad-container" id="respawn-ad-container">
			<div class="" id="a-bottom-respawn">
				<div id='takepoint-io_970x250_2'>
					<script type='text/javascript'>
						aiptag.cmd.display.push(function() { aipDisplayTag.display('takepoint-io_970x250_2'); });
					</script>
					
				</div>
			</div>
		</div>

		<div id="loginModal" class="modal">
			<div class="modal-content">
				<div class="modal-header">
					<span id="loginClose" class="close">&times;</span>
					<h2>Login</h2>
				</div>
				<div class="modal-body">
					<div class="input-group">
						<label for="usernameOrEmail"><b>Username or Email</b></label>
						<input type="text" name="usernameOrEmail" id="loginUsernameOrEmail" class="input" required>
					</div>
					<div class="input-group">
						<label for="password"><b>Password</b></label>
						<input type="password" name="password" id="loginPassword" class="input" required>
					</div>
					<label>
						<input type="checkbox" checked="checked" name="remember" id="rememberMe"> Remember me
					</label>

					<div class="input-group">
						<div class="errorMessage" id="loginError" style="display:none;"></div>
					</div>
					<p>Don't have an account? <a class="link" href="#" onclick="openRegister()">Register</a></p>
					<p>Forgot your password? <a class="link" href="https://account.takepoint.io/password/reset">Click here</a></p>
					<button class="modal-btn" id="loginSubmitBtn" onclick="login()">Login</button>
				</div>
			</div>
		</div>

		<div id="registerModal" class="modal">
			<div class="modal-content">
				<div class="modal-header">
					<span id="registerClose" class="close">&times;</span>
					<h2>Register</h2>
				</div>
				<div class="modal-body">
					<div class="input-group">
						<label for="username" class="label"><b>Username</b></label>
						<input type="text" name="username" id="registerUsername" class="input" maxlength=12 required>
						<div class="errorMessage" id="usernameError" style="display:none;"></div>
					</div>
					<div class="input-group">
						<label for="email" class="label"><b>Email</b></label>
						<input type="text" name="email" id="registerEmail" class="input" required>
						<div class="errorMessage" id="emailError" style="display:none;"></div>
					</div>
					<div class="input-group">
						<label for="password" class="label"><b>Password</b></label>
						<input type="password" name="password" id="registerPassword" class="input" required>
						<div class="errorMessage" id="passwordError" style="display:none;"></div>
					</div>
					<p>Already have an account? <a class="link" href="#" onclick="openLogin()">Log In</a></p>
					<button class="modal-btn" id="registerSubmitBtn" onclick="register()">Register</button>
				</div>
			</div>
		</div>

		<!-- Global site tag (gtag.js) - Google Analytics -->
		<script async src="https://www.googletagmanager.com/gtag/js?id=UA-85616256-6"></script>
		<script>
			window.dataLayer = window.dataLayer || [];
			function gtag(){dataLayer.push(arguments);}
			gtag('js', new Date());

			gtag('config', 'UA-85616256-6');
		</script>

		<script src="adsbygoogle.js"></script>
		<script src="https://www.google.com/recaptcha/api.js?render=6LcA3gsaAAAAAI-hzo7vC9uApeFk4SpfMKKTRAPs"></script>
		<script>
			(function(window, document){
				console.log("Loading game client...");
				var path = "client-1.13.1.js";
				if(window.WebAssembly){
					path = "client-1.13.1.wasm.js";
				}
				console.log("Game client set to: " + path);
				var clientScript = document.createElement('script');
				clientScript.type = 'text/javascript';
				clientScript.src = path;
				clientScript.async = true;
				clientScript.onerror = function(e){
					console.log(e);
					console.error("Script error, reloading page...");
					window.location.reload(true);
				};
				document.body.appendChild(clientScript);
			})(window, document);

			var loginModal = document.getElementById("loginModal"),
				registerModal = document.getElementById("registerModal"),
				loginOpen = !1,
				registerOpen = !1,
				loginBtn = document.getElementById("loginBtn"),
				registerBtn = document.getElementById("registerBtn"),
				logoutBtn = document.getElementById("logoutBtn"),
				loginClose = document.getElementById("loginClose"),
				registerClose = document.getElementById("registerClose");
			function openLogin() {
				registerOpen && closeRegister(), (loginModal.style.display = "block"), (loginModal.style.zIndex = "7"), (loginOpen = !0);
			}
			function closeLogin() {
				(loginModal.style.display = "none"), (loginOpen = !1);
			}
			function openRegister() {
				loginOpen && closeLogin(), (registerModal.style.display = "block"), (registerModal.style.zIndex = "7"), (registerOpen = !0);
			}
			function closeRegister() {
				(registerModal.style.display = "none"), (registerOpen = !1);
			}
			function login() {
				var e = document.getElementById("loginUsernameOrEmail").value,
					t = document.getElementById("loginPassword").value;
				if (((document.getElementById("loginError").style.display = "none"), vi(e) || vi(t)))
					return (document.getElementById("loginError").innerHTML = "Your username or password contains invalid characters!"), void (document.getElementById("loginError").style.display = "block");
				Module.loginUser(e, t, document.querySelector("#rememberMe").checked);
			}
			function loginViaCookie() {
				"" != gc("rc") && Module.loginUserViaCookie(gc("rc"));
			}
			function register() {
				var e = document.getElementById("registerUsername").value,
					t = document.getElementById("registerEmail").value,
					n = document.getElementById("registerPassword").value;
				return (
					(document.getElementById("usernameError").style.display = "none"),
					(document.getElementById("emailError").style.display = "none"),
					(document.getElementById("passwordError").style.display = "none"),
					vi(e)
						? ((document.getElementById("usernameError").innerHTML = "Your username contains invalid characters!"), void (document.getElementById("usernameError").style.display = "block"))
						: vi(t)
						? ((document.getElementById("emailError").innerHTML = "Your email contains invalid characters!"), void (document.getElementById("emailError").style.display = "block"))
						: vi(n)
						? ((document.getElementById("passwordError").innerHTML = "Your password contains invalid characters!"), void (document.getElementById("passwordError").style.display = "block"))
						: void Module.registerUser(e, t, n)
				);
			}
			function logout() {
				Module.logoutUser();
			}
			(loginBtn.onclick = function () {
				openLogin();
			}),
			(registerBtn.onclick = function () {
				openRegister();
			}),
			(logoutBtn.onclick = function () {
				logout();
			}),
			(loginClose.onclick = function () {
				closeLogin();
			}),
			(registerClose.onclick = function () {
				closeRegister();
			}),
			(window.onclick = function (e) {
				(e.target != loginModal && e.target != registerModal) || (closeLogin(), closeRegister());
			});

			function fillStateData(e) {
				for (var table = document.getElementById("highScoresTableBody"); table.firstChild; ) table.removeChild(table.firstChild);
				var rank = 0;
				for (var n in e){
					if (e[n].username) {
						rank += 1;
						var row = document.createElement("tr");

						var rankCell = document.createElement("td");
						rankCell.appendChild(document.createTextNode(rank + ". "));
						row.appendChild(rankCell);

						var usernameCell = document.createElement("td");
						usernameCell.appendChild(document.createTextNode(e[n].username));
						row.appendChild(usernameCell);

						var scoreCell = document.createElement("td");
						scoreCell.appendChild(document.createTextNode(e[n].score.toLocaleString()));
						row.appendChild(scoreCell);

						table.appendChild(row);
					} 
					else{
						try {
							document.getElementById("gameFact").innerHTML = e[n].toLocaleString() + " " + n + " today!";
						} catch (e) {
							return;
						}
					}
				}
			}

			function ai(e) {
				var t = "";
				for (var n in e) String(e[n]).match(/^[\x00-\x7F]*$/) ? (t += e[n]) : (t += "_");
				return t;
			}

			function vi(e) {
				return /[^A-Za-z0-9@._-]/.test(e);
			}

			function gc(e) {
				for (var t = e + "=", n = document.cookie.split(";"), o = 0; o < n.length; o++) {
					for (var r = n[o]; " " == r.charAt(0); ) r = r.substring(1);
					if (0 == r.indexOf(t)) return r.substring(t.length, r.length);
				}
				return "";
			}

			function eg() {
				loginOpen || registerOpen || Module.enterGame();
			}

			function sm() {
				Module.chat(ai(document.getElementById("chatbox").value));
			}
			
			function switchServer(e) {
				Module.switchServers(e);
			}
			
			var gameStateRequest = new XMLHttpRequest();

			gameStateRequest.onreadystatechange = function () {
				4 == this.readyState && 200 == this.status && fillStateData(JSON.parse(this.responseText));
			}
			gameStateRequest.open("GET", "https://stats.takepoint.io/gameState", !0);
			gameStateRequest.send();

			try{
				if(window.location.hostname == 'crazygames.com'){
					document.getElementById('moreGamesLink').href = "https://www.crazygames.com/c/io";
				}
			}
			catch(e){
				console.error(e);
			}
		</script>
	</body>
</html>
