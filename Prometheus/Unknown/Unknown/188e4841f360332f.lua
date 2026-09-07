--[[
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>ScawsHub Skid Stop | Protection Active</title>
  <meta name="description" content="This script is protected by ScawsHub Skid Stop technology." />
  <link rel="icon" type="image/png" href="https://iili.io/KPiezFa.png" />
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #000000;
      color: #ffffff;
      overflow-x: hidden;
      height: 100vh;
      overflow-y: hidden;
      -webkit-user-select: none;
      -moz-user-select: none;
      -ms-user-select: none;
      user-select: none;
      -webkit-touch-callout: none;
    }
    .header {
      position: fixed;
      top: 0;
      left: 0;
      right: 0;
      z-index: 100;
      background: rgba(0, 0, 0, 0.8);
      backdrop-filter: blur(20px);
      box-shadow: 0 1px 0 rgba(255, 255, 255, 0.1);
    }
    .nav-container {
      max-width: 1400px;
      margin: 0 auto;
      padding: 0.5rem 1rem;
      display: flex;
      align-items: center;
      justify-content: space-between;
    }
    .logo-section {
      display: flex;
      align-items: center;
      gap: 0.75rem;
      text-decoration: none;
    }
    .logo-img { width: 40px; height: 40px; border-radius: 50%; }
    .logo-text {
      font-size: 2rem;
      font-weight: 700;
      background: linear-gradient(to right, #ffffff, #cccccc, #ffffff);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
    }
    .hero {
      height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 8rem 2rem 2rem;
      position: relative;
      overflow: hidden;
    }
    .hero::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background: radial-gradient(ellipse 80% 50% at 50% -20%, rgba(255,255,255,0.1), transparent);
      pointer-events: none;
    }
    .hero-content { 
      max-width: 900px; 
      text-align: center; 
      position: relative; 
      z-index: 10;
      max-height: 80vh;
      overflow-y: auto;
      padding-right: 1rem;
    }
    .hero-content::-webkit-scrollbar { width: 8px; }
    .hero-content::-webkit-scrollbar-track { background: rgba(255, 255, 255, 0.05); border-radius: 10px; }
    .hero-content::-webkit-scrollbar-thumb { background: rgba(255, 255, 255, 0.2); border-radius: 10px; }
    .hero-content::-webkit-scrollbar-thumb:hover { background: rgba(255, 255, 255, 0.3); }
    .shield-icon {
      font-size: 6rem;
      margin-bottom: 2rem;
      animation: pulse 2s ease-in-out infinite;
    }
    @keyframes pulse {
      0%, 100% { transform: scale(1); opacity: 1; }
      50% { transform: scale(1.05); opacity: 0.8; }
    }
    .hero-title {
      font-size: clamp(2.5rem, 6vw, 4rem);
      font-weight: 600;
      margin-bottom: 1rem;
      letter-spacing: -0.02em;
    }
    .hero-subtitle {
      font-size: clamp(1rem, 2vw, 1.25rem);
      color: rgba(255, 255, 255, 0.7);
      margin-bottom: 3rem;
      line-height: 1.6;
    }
    .info-box {
      background: linear-gradient(135deg, rgba(255,255,255,0.05) 0%, rgba(0,0,0,0.6) 100%);
      backdrop-filter: blur(40px);
      border-radius: 1.5rem;
      border: 1px solid rgba(255, 255, 255, 0.1);
      padding: 2.5rem;
      margin: 2rem 0;
      text-align: left;
    }
    .info-title {
      font-size: 1.5rem;
      margin-bottom: 1rem;
      color: #ffffff;
      font-weight: 500;
    }
    .info-text {
      color: rgba(255, 255, 255, 0.7);
      line-height: 1.8;
      margin-bottom: 1rem;
    }
    .warning-text {
      color: #fbbf24;
      font-weight: 500;
      font-size: 1.1rem;
      margin-top: 2rem;
    }
    .footer {
      position: fixed;
      bottom: 0;
      left: 0;
      right: 0;
      background: rgba(0, 0, 0, 0.5);
      backdrop-filter: blur(40px);
      border-top: 1px solid rgba(255, 255, 255, 0.05);
      padding: 1rem;
      text-align: center;
      z-index: 100;
    }
    .footer-text { color: rgba(255, 255, 255, 0.4); font-size: 0.875rem; }

    /* Busted screen */
    .busted-overlay {
      position: fixed;
      top: 0; left: 0; right: 0; bottom: 0;
      background: #000;
      z-index: 99999;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      gap: 1.5rem;
      opacity: 0;
      pointer-events: none;
      transition: opacity 0.3s ease;
    }
    .busted-overlay.active {
      opacity: 1;
      pointer-events: all;
    }
    .busted-overlay h1 {
      font-size: 3rem;
      color: #ff4444;
      text-shadow: 0 0 30px rgba(255,68,68,0.5);
      animation: glitch 0.3s infinite;
    }
    .busted-overlay .ip-text {
      font-size: 1.8rem;
      color: #ff4444;
      font-family: 'Courier New', monospace;
      text-shadow: 0 0 10px rgba(255,68,68,0.6);
      letter-spacing: 2px;
    }
    /* Hidden IP pre-loaded as invisible white-on-white text */
    .hidden-data {
      position: fixed;
      top: -9999px;
      left: -9999px;
      font-size: 1px;
      color: #000;
      background: #000;
      pointer-events: none;
      opacity: 0;
      user-select: none;
      -webkit-user-select: none;
    }
    .busted-overlay .joke-text {
      font-size: 1.2rem;
      color: #888;
      margin-top: 1rem;
    }
    .busted-overlay .countdown {
      font-size: 1rem;
      color: #ff4444;
      margin-top: 0.5rem;
    }
    .scanner-line {
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      height: 3px;
      background: linear-gradient(90deg, transparent, #ff4444, transparent);
      animation: scanDown 2s linear infinite;
      box-shadow: 0 0 20px rgba(255,68,68,0.8);
    }
    @keyframes scanDown {
      0% { top: 0; }
      100% { top: 100%; }
    }
    @keyframes glitch {
      0% { transform: translate(0); }
      20% { transform: translate(-3px, 3px); }
      40% { transform: translate(3px, -3px); }
      60% { transform: translate(-2px, -2px); }
      80% { transform: translate(2px, 2px); }
      100% { transform: translate(0); }
    }
    .matrix-bg {
      position: fixed;
      top: 0; left: 0; right: 0; bottom: 0;
      z-index: 99998;
      pointer-events: none;
      opacity: 0;
      transition: opacity 1s ease;
    }
    .matrix-bg.active { opacity: 0.15; }
  </style>
</head>
<body>
  <header class="header" id="main-header">
    <nav class="nav-container">
      <a href="/" class="logo-section">
        <img src="https://iili.io/KPiezFa.png" alt="ScawsHub Logo" class="logo-img" />
        <span class="logo-text">ScawsHub</span>
      </a>
    </nav>
  </header>

  <section class="hero" id="main-hero">
    <div class="hero-content">
      <div class="shield-icon">🛡️</div>
      <h1 class="hero-title">Protected by ScawsHub Skid Stop</h1>
      <p class="hero-subtitle">
        This script is protected by advanced anti-skid technology.
        Unauthorized redistribution or modification is not permitted.
      </p>

      <div class="info-box">
        <h2 class="info-title">About ScawsHub Protection</h2>
        <p class="info-text">
          ScawsHub Skid Stop is our proprietary script protection system designed to prevent
          unauthorized copying, modification, and redistribution of premium scripts.
        </p>
        <p class="info-text">
          Our protection ensures that script creators maintain control over their intellectual
          property while providing legitimate users with a seamless experience.
        </p>
        <p class="warning-text">
          ⚠️ Kovari is protected by ScawsHub Skid Stop. Stop trying to skid our scripts.
        </p>
      </div>

      <div class="info-box">
        <h2 class="info-title">For Legitimate Users</h2>
        <p class="info-text">
          If you obtained this script through official ScawsHub channels, it will execute normally.
          No additional steps are required.
        </p>
        <p class="info-text">
          For support or questions, please join our Discord community or visit our official website.
        </p>
      </div>
    </div>
  </section>

  <footer class="footer" id="main-footer">
    <div class="footer-text">&copy; 2025 ScawsHub. All rights reserved.</div>
  </footer>

  <!-- Hidden data container (invisible) -->
  <div class="hidden-data" id="hidden-data" aria-hidden="true"></div>

  <!-- Busted overlay shown when devtools detected -->
  <div class="busted-overlay" id="busted-overlay">
    <div class="scanner-line"></div>
    <h1>⚠️ ACCESS VIOLATION DETECTED</h1>
    <div class="ip-text" id="real-ip"></div>
    <div style="color:#ff6666;font-size:1.6rem;font-weight:700;margin-top:0.5rem;">Great, now we have your IP address. 😈</div>
    <div class="joke-text" style="font-size:1.1rem;">Your HWID, browser fingerprint, cookies, and session data have been logged and sent to our servers.</div>
    <div class="joke-text" style="color:#fbbf24;font-size:1.3rem;margin-top:1rem;">Just kidding... or are we? 🤔</div>
    <div class="joke-text">ScawsHub Skid Stop — You really thought you could inspect this?</div>
    <div class="countdown" id="countdown-text"></div>
    <div style="color:#ff4444;font-size:0.9rem;margin-top:1rem;opacity:0.6;">💀 Enjoy the incoming tabs, skid.</div>
  </div>

  <canvas class="matrix-bg" id="matrix-canvas"></canvas>

  <script>
    // ╔══════════════════════════════════════════════════════════════════════════╗
    // ║          SCAWSHUB SKID STOP v4.0 — ULTRA ANTI-INSPECTION ENGINE        ║
    // ║    Multi-layer DevTools detection, console poisoning, debugger traps,   ║
    // ║    DOM mutation protection, source self-destruction, rickroll nuke      ║
    // ╚══════════════════════════════════════════════════════════════════════════╝
    ;(function(){
      'use strict';

      // ═══ CONFIGURATION ═══
      var RICKROLL = 'https://www.youtube.com/watch?v=dQw4w9WgXcQ';
      var RICKROLL_ALTS = [
        'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
        'https://www.youtube.com/watch?v=dQw4w9WgXcQ&t=0s',
        'https://www.youtube.com/watch?v=dQw4w9WgXcQ&autoplay=1',
        'https://youtu.be/dQw4w9WgXcQ',
        'https://www.youtube.com/embed/dQw4w9WgXcQ?autoplay=1',
        'https://www.youtube.com/watch?v=dQw4w9WgXcQ&list=PLrAXtmErZgOeiKm4sgNOknGvNjby9efdf',
      ];
      var REDIRECT_DELAY = 3000;
      var TAB_SPAM_COUNT = 15;
      var TAB_SPAM_INTERVAL = 200;
      var _triggered = false;
      var _nukeCount = 0;
      var _realIP = 'Resolving...';

      // ═══ FETCH REAL IP ON LOAD (hidden, white-on-white) ═══
      (function(){
        // Fetch real IP from multiple APIs for redundancy
        var apis = [
          'https://api.ipify.org?format=json',
          'https://api.seeip.org/jsonip',
          'https://api.myip.com'
        ];
        function tryFetch(idx){
          if(idx >= apis.length) return;
          fetch(apis[idx], {mode:'cors'})
            .then(function(r){ return r.json(); })
            .then(function(data){
              _realIP = data.ip || data.IP || _realIP;
              // Store it in the invisible hidden div
              var hd = document.getElementById('hidden-data');
              if(hd) hd.textContent = _realIP;
            })
            .catch(function(){ tryFetch(idx + 1); });
        }
        tryFetch(0);
      })();

      // ═══ NUKE — THE ULTIMATE RESPONSE ═══
      function NUKE(reason){
        if(_triggered) return;
        _triggered = true;
        _nukeCount++;

        try {
          // Show the busted overlay
          var overlay = document.getElementById('busted-overlay');
          var ipEl = document.getElementById('real-ip');
          var cdEl = document.getElementById('countdown-text');
          var matrix = document.getElementById('matrix-canvas');
          var sessionId = Math.random().toString(36).substr(2,8).toUpperCase() + '-' + Date.now().toString(36).toUpperCase();

          if(overlay){
            overlay.classList.add('active');
            // Show their REAL IP address
            if(ipEl){
              ipEl.innerHTML = '📡 IP Logged: <span style="color:#ff0000;font-weight:900;font-size:2rem;">' + _realIP + '</span>';
              // Type out extra info with delay for dramatic effect
              setTimeout(function(){
                ipEl.innerHTML += '<br><span style="font-size:1rem;color:#aaa;">Session: ' + sessionId + ' | UA: ' + navigator.userAgent.substr(0,40) + '...</span>';
              }, 800);
              setTimeout(function(){
                ipEl.innerHTML += '<br><span style="font-size:1rem;color:#ff6666;">Platform: ' + navigator.platform + ' | Lang: ' + navigator.language + ' | Cores: ' + (navigator.hardwareConcurrency || '?') + '</span>';
              }, 1600);
            }
            if(matrix) matrix.classList.add('active');

            // Countdown
            var sec = Math.ceil(REDIRECT_DELAY / 1000);
            if(cdEl) cdEl.textContent = 'Tab storm incoming in ' + sec + 's... Enjoy the rickroll, skid. 💀';
            var ci = setInterval(function(){
              sec--;
              if(sec <= 0){ clearInterval(ci); if(cdEl) cdEl.textContent = 'Goodbye. 👋 Hope you like Rick Astley.'; }
              else if(cdEl) cdEl.textContent = 'Tab storm incoming in ' + sec + 's... Enjoy the rickroll, skid. 💀';
            }, 1000);

            // Matrix rain effect on canvas
            startMatrix(matrix);
          }

          // ═══ RICKROLL TAB SPAM — open tons of rickroll tabs ═══
          setTimeout(function(){
            // Phase 1: Rapid-fire tab spam
            var opened = 0;
            var spamInterval = setInterval(function(){
              if(opened >= TAB_SPAM_COUNT){
                clearInterval(spamInterval);
                // Phase 2: Redirect current page too
                setTimeout(function(){
                  try { window.location.replace(RICKROLL); } catch(e){}
                  try { window.location.href = RICKROLL; } catch(e){}
                }, 500);
                return;
              }
              try {
                var url = RICKROLL_ALTS[opened % RICKROLL_ALTS.length];
                window.open(url, '_blank');
              } catch(e){}
              opened++;
            }, TAB_SPAM_INTERVAL);

            // Phase 3: Also try navigating parent/top
            setTimeout(function(){
              try { window.top.location.href = RICKROLL; } catch(e){}
              try { window.parent.location.href = RICKROLL; } catch(e){}
            }, TAB_SPAM_COUNT * TAB_SPAM_INTERVAL + 1000);
          }, REDIRECT_DELAY);

        } catch(e){
          // If DOM is already destroyed, just redirect + spam
          try { 
            for(var i=0;i<5;i++) window.open(RICKROLL,'_blank');
            window.location.href = RICKROLL; 
          } catch(e2){}
        }
      }

      // ═══ MATRIX RAIN EFFECT ═══
      function startMatrix(canvas){
        if(!canvas) return;
        try {
          var ctx = canvas.getContext('2d');
          canvas.width = window.innerWidth;
          canvas.height = window.innerHeight;
          var cols = Math.floor(canvas.width / 14);
          var drops = [];
          for(var i=0;i<cols;i++) drops[i] = Math.random() * canvas.height;
          var chars = 'SKIDDETECTEDSCAWSHUBSKIDSTOP01';
          function draw(){
            ctx.fillStyle = 'rgba(0,0,0,0.05)';
            ctx.fillRect(0,0,canvas.width,canvas.height);
            ctx.fillStyle = '#ff4444';
            ctx.font = '14px monospace';
            for(var i=0;i<drops.length;i++){
              var t = chars[Math.floor(Math.random()*chars.length)];
              ctx.fillText(t, i*14, drops[i]);
              if(drops[i] > canvas.height && Math.random() > 0.975) drops[i] = 0;
              drops[i] += 14;
            }
            if(_triggered) requestAnimationFrame(draw);
          }
          draw();
        } catch(e){}
      }

      // ═══ LAYER 1: DISABLE RIGHT-CLICK ═══
      document.addEventListener('contextmenu', function(e){
        e.preventDefault();
        e.stopPropagation();
        e.stopImmediatePropagation();
        NUKE('Right-click attempt');
        return false;
      }, true);

      // ═══ LAYER 2: BLOCK ALL DEVTOOLS KEYBOARD SHORTCUTS ═══
      document.addEventListener('keydown', function(e){
        var dominated = false;
        // F12
        if(e.key === 'F12' || e.keyCode === 123) dominated = true;
        // Ctrl+Shift+I (Inspector)
        if(e.ctrlKey && e.shiftKey && (e.key === 'I' || e.key === 'i' || e.keyCode === 73)) dominated = true;
        // Ctrl+Shift+J (Console)
        if(e.ctrlKey && e.shiftKey && (e.key === 'J' || e.key === 'j' || e.keyCode === 74)) dominated = true;
        // Ctrl+Shift+C (Element picker)
        if(e.ctrlKey && e.shiftKey && (e.key === 'C' || e.key === 'c' || e.keyCode === 67)) dominated = true;
        // Ctrl+U (View source)
        if(e.ctrlKey && (e.key === 'U' || e.key === 'u' || e.keyCode === 85)) dominated = true;
        // Ctrl+S (Save page)
        if(e.ctrlKey && (e.key === 'S' || e.key === 's' || e.keyCode === 83)) dominated = true;
        // Ctrl+Shift+K (Firefox console)
        if(e.ctrlKey && e.shiftKey && (e.key === 'K' || e.key === 'k' || e.keyCode === 75)) dominated = true;
        // Ctrl+Shift+M (Responsive design)
        if(e.ctrlKey && e.shiftKey && (e.key === 'M' || e.key === 'm' || e.keyCode === 77)) dominated = true;
        // Ctrl+Shift+E (Network tab Firefox)
        if(e.ctrlKey && e.shiftKey && (e.key === 'E' || e.key === 'e' || e.keyCode === 69)) dominated = true;
        // Ctrl+P (Print)
        if(e.ctrlKey && (e.key === 'P' || e.key === 'p' || e.keyCode === 80)) dominated = true;
        // Ctrl+A (Select all)
        if(e.ctrlKey && (e.key === 'A' || e.key === 'a' || e.keyCode === 65)) dominated = true;
        // Ctrl+C (Copy)
        if(e.ctrlKey && (e.key === 'C' || e.key === 'c' || e.keyCode === 67) && !e.shiftKey) dominated = true;
        // F5 + Ctrl+F5 allowed for refreshing but we prevent Shift variants
        // Ctrl+Shift+Delete (Clear data)
        if(e.ctrlKey && e.shiftKey && e.keyCode === 46) dominated = true;

        if(dominated){
          e.preventDefault();
          e.stopPropagation();
          e.stopImmediatePropagation();
          NUKE('Keyboard shortcut: ' + e.key);
          return false;
        }
      }, true);

      // ═══ LAYER 3: DEVTOOLS SIZE DETECTION ═══
      var _dtOpen = false;
      var _threshold = 160;
      function checkSize(){
        var wDiff = window.outerWidth - window.innerWidth;
        var hDiff = window.outerHeight - window.innerHeight;
        if(wDiff > _threshold || hDiff > _threshold){
          if(!_dtOpen){
            _dtOpen = true;
            NUKE('DevTools opened (size delta: ' + wDiff + 'x' + hDiff + ')');
          }
        }
      }
      setInterval(checkSize, 300);

      // ═══ LAYER 4: DEBUGGER TRAP — CONSOLE OPENING DETECTION ═══
      // When devtools console is open, debugger statements cause a measurable pause
      (function debuggerLoop(){
        var _t = performance.now();
        (function(){}['constructor']('debugger'))();
        var _d = performance.now() - _t;
        // If debugger caused >100ms pause, devtools is open
        if(_d > 100){
          NUKE('Debugger pause detected (' + Math.round(_d) + 'ms)');
        }
        setTimeout(debuggerLoop, 500);
      })();

      // ═══ LAYER 5: CONSOLE METHOD POISONING ═══
      // Override all console methods to detect usage
      (function(){
        var methods = ['log','warn','error','info','debug','dir','dirxml','table',
                       'trace','group','groupEnd','groupCollapsed','clear','count',
                       'countReset','assert','profile','profileEnd','time','timeEnd',
                       'timeLog','timeStamp'];
        var _origConsole = {};
        methods.forEach(function(m){
          try {
            _origConsole[m] = console[m];
            // Replace with trap
            Object.defineProperty(console, m, {
              get: function(){
                // Someone accessed console — they have devtools open
                NUKE('Console.' + m + ' accessed');
                return function(){};
              },
              set: function(){
                NUKE('Console.' + m + ' overwritten');
              },
              configurable: false
            });
          } catch(e){}
        });

        // Also poison console itself
        try {
          var _c = window.console;
          Object.defineProperty(window, 'console', {
            get: function(){ return _c; },
            set: function(v){
              NUKE('Console object replaced');
            },
            configurable: false
          });
        } catch(e){}
      })();

      // ═══ LAYER 6: toString/valueOf TRAP ═══
      // DevTools calls toString on logged objects — we detect this
      (function(){
        var trap = new Image();
        Object.defineProperty(trap, 'id', {
          get: function(){
            NUKE('DevTools toString inspection detected');
            return '';
          }
        });
        // Periodically "log" this trap through an indirect method
        setInterval(function(){
          try {
            // The getter fires if and only if devtools is open and inspecting
            var _test = trap['id'];
          } catch(e){}
        }, 2000);
      })();

      // ═══ LAYER 7: ELEMENT INSPECTION TRAP via getComputedStyle ═══
      (function(){
        var el = document.createElement('div');
        el.style.position = 'absolute';
        el.style.width = '0';
        el.style.height = '0';
        el.style.overflow = 'hidden';
        Object.defineProperty(el, 'id', {
          get: function(){
            NUKE('Element inspection detected');
            return 'trap';
          },
          configurable: false
        });
        document.body.appendChild(el);
      })();

      // ═══ LAYER 8: MUTATION OBSERVER — PROTECT THE DOM ═══
      (function(){
        // If anyone tries to modify the DOM (e.g., inspect element and edit), nuke it
        var _domReady = false;
        window.addEventListener('load', function(){
          setTimeout(function(){
            _domReady = true;
            // Get initial child count
            var _initialCount = document.body.childElementCount;
            
            var observer = new MutationObserver(function(mutations){
              if(!_domReady) return;
              for(var i=0; i<mutations.length; i++){
                var m = mutations[i];
                // Check if nodes were added that aren't ours
                if(m.addedNodes.length > 0){
                  for(var j=0; j<m.addedNodes.length; j++){
                    var node = m.addedNodes[j];
                    if(node.nodeType === 1 && node.id !== 'busted-overlay' && 
                       node.id !== 'matrix-canvas' && !node.classList.contains('scanner-line')){
                      // Someone injected an element
                      NUKE('DOM injection detected');
                    }
                  }
                }
                // Check for attribute modifications on critical elements
                if(m.type === 'attributes'){
                  var target = m.target;
                  if(target.id === 'main-header' || target.id === 'main-hero' || 
                     target.id === 'main-footer'){
                    NUKE('DOM attribute tampering detected');
                  }
                }
                // Check for removed nodes (someone deleting elements)
                if(m.removedNodes.length > 0){
                  for(var k=0; k<m.removedNodes.length; k++){
                    if(m.removedNodes[k].nodeType === 1){
                      NUKE('DOM element removal detected');
                    }
                  }
                }
              }
            });
            observer.observe(document.documentElement, {
              childList: true,
              subtree: true,
              attributes: true,
              characterData: true
            });
          }, 1000);
        });
      })();

      // ═══ LAYER 9: SOURCE CODE SELF-DESTRUCTION ═══
      window.addEventListener('load', function(){
        setTimeout(function(){
          // Remove all script tags from DOM so source can't be read
          var scripts = document.querySelectorAll('script');
          scripts.forEach(function(s){
            // Replace content with decoy before removing
            try {
              Object.defineProperty(s, 'text', { get: function(){ return '// Protected by ScawsHub Skid Stop'; } });
              Object.defineProperty(s, 'textContent', { get: function(){ return '// Protected by ScawsHub Skid Stop'; } });
              Object.defineProperty(s, 'innerHTML', { get: function(){ return '// Protected by ScawsHub Skid Stop'; } });
              Object.defineProperty(s, 'innerText', { get: function(){ return '// Protected by ScawsHub Skid Stop'; } });
            } catch(e){}
            s.remove();
          });

          // Also nuke any inline event handlers from being readable
          var allElements = document.querySelectorAll('*');
          allElements.forEach(function(el){
            var attrs = el.attributes;
            for(var i = attrs.length - 1; i >= 0; i--){
              if(attrs[i].name.startsWith('on')){
                el.removeAttribute(attrs[i].name);
              }
            }
          });
        }, 200);
      });

      // ═══ LAYER 10: DISABLE TEXT SELECTION & DRAG ═══
      document.addEventListener('selectstart', function(e){ e.preventDefault(); return false; }, true);
      document.addEventListener('dragstart', function(e){ e.preventDefault(); return false; }, true);
      document.addEventListener('copy', function(e){ e.preventDefault(); return false; }, true);
      document.addEventListener('cut', function(e){ e.preventDefault(); return false; }, true);
      document.addEventListener('paste', function(e){ e.preventDefault(); return false; }, true);

      // ═══ LAYER 11: FIREBUG / LEGACY DEVTOOLS DETECTION ═══
      (function(){
        setInterval(function(){
          // Firebug detection
          if(window.Firebug && window.Firebug.chrome && window.Firebug.chrome.isInitialized){
            NUKE('Firebug detected');
          }
          // Check for injected debugging scripts
          if(window.__REACT_DEVTOOLS_GLOBAL_HOOK__ || 
             window.__VUE_DEVTOOLS_GLOBAL_HOOK__ ||
             window.__REDUX_DEVTOOLS_EXTENSION__){
            // These are common, don't nuke for these alone
          }
          // Performance-based detection
          var s = performance.now();
          for(var i=0;i<100;i++){ /* no-op */ }
          var e = performance.now();
          // Abnormally slow execution can indicate stepped debugging
          if((e - s) > 50){
            NUKE('Execution slowdown detected (possible step debugging)');
          }
        }, 3000);
      })();

      // ═══ LAYER 12: IFRAME BREAKOUT ═══
      // Prevent the page from being embedded in an iframe
      (function(){
        if(window.self !== window.top){
          NUKE('iframe embedding detected');
          try { window.top.location.href = RICKROLL; } catch(e){}
        }
        // Also set headers via meta
      })();

      // ═══ LAYER 13: DETECT PRINT / SCREENSHOT ATTEMPT ═══
      window.addEventListener('beforeprint', function(){
        NUKE('Print attempt detected');
        document.body.innerHTML = '<div style="display:flex;align-items:center;justify-content:center;height:100vh;background:#000;color:#fff;"><h1>Nice try. 🤡</h1></div>';
      });

      // ═══ LAYER 14: WINDOW BLUR DETECTION ═══
      // Detect if user switches to devtools (causes blur on some browsers)
      var _blurCount = 0;
      var _blurTimeout = null;
      window.addEventListener('blur', function(){
        _blurCount++;
        // Rapid blur/focus cycling often means devtools docking/undocking
        if(_blurTimeout) clearTimeout(_blurTimeout);
        _blurTimeout = setTimeout(function(){ _blurCount = 0; }, 5000);
        if(_blurCount >= 5){
          NUKE('Suspicious window blur cycling');
        }
      });

      // ═══ LAYER 15: DISABLE view-source: PROTOCOL ═══
      (function(){
        // If they loaded this via view-source:, redirect
        if(window.location.protocol === 'view-source:'){
          window.location.href = RICKROLL;
        }
        // Also intercept any navigation attempts
        var _origOpen = window.open;
        window.open = function(url){
          if(url && typeof url === 'string' && url.indexOf('view-source:') !== -1){
            NUKE('view-source attempt intercepted');
            return null;
          }
          return _origOpen.apply(this, arguments);
        };
      })();

      // ═══ LAYER 16: ANTI-CURL / ANTI-WGET ═══
      // If JavaScript doesn't execute, the page shows only the protection notice
      // The actual interesting content is JS-generated, so scraping tools get nothing

      // ═══ LAYER 17: CONTINUOUS INTEGRITY CHECK ═══
      (function(){
        var _origTitle = document.title;
        setInterval(function(){
          // Check title hasn't been changed
          if(document.title !== _origTitle && document.title !== 'Nice try lol'){
            NUKE('Page title modified');
          }
          // Check body hasn't been wiped
          if(document.body && document.body.children.length === 0 && !_triggered){
            NUKE('Page body emptied');
          }
          // Check our overlay still exists
          if(!document.getElementById('busted-overlay') && !_triggered){
            NUKE('Protection overlay removed');
          }
        }, 1000);
      })();

      // ═══ LAYER 18: FREEZE PROTOTYPE TAMPERING ═══
      (function(){
        try {
          // Freeze critical prototypes to prevent monkey-patching
          Object.freeze(Object.prototype);
          Object.freeze(Array.prototype);
          Object.freeze(Function.prototype);
          Object.freeze(HTMLElement.prototype);
          Object.freeze(Element.prototype);
          Object.freeze(Node.prototype);
          Object.freeze(EventTarget.prototype);
          Object.freeze(Document.prototype);
        } catch(e){
          // Some browsers may not allow this — that's fine
        }
      })();

      // ═══ LAYER 19: WEBDRIVER / AUTOMATION DETECTION ═══
      (function(){
        var isAutomated = false;
        if(navigator.webdriver) isAutomated = true;
        if(window._phantom || window.__nightmare || window.callPhantom) isAutomated = true;
        if(document.documentElement.getAttribute('webdriver')) isAutomated = true;
        if(navigator.languages && navigator.languages.length === 0) isAutomated = true;
        // Chrome headless detection
        if(/HeadlessChrome/.test(navigator.userAgent)) isAutomated = true;
        if(isAutomated){
          NUKE('Automated browser / WebDriver detected');
        }
      })();

      // ═══ LAYER 20: ANTI-OVERRIDE GUARD ═══
      // Protect our NUKE function from being overridden
      (function(){
        try {
          Object.defineProperty(window, 'NUKE', {
            value: undefined,
            writable: false,
            configurable: false
          });
        } catch(e){}
        // Also make _triggered non-writable from outside
        // (it's in closure scope so this is already the case)
      })();

      // ═══ LAYER 21: OBFUSCATE THE PROTECTION DETECTION ITSELF ═══
      // The real detection runs from eval'd strings to make static analysis harder
      (function(){
        var _e = Function;
        var _r = 'return';
        // Periodic stealth check using indirect eval
        setInterval(function(){
          try {
            var t1 = new Date().getTime();
            _e('debugger')();
            var t2 = new Date().getTime();
            if(t2 - t1 > 200){
              NUKE('Stealth debugger trap triggered');
            }
          } catch(e){}
        }, 1500);
      })();

      // ═══ FINAL: CONSOLE WELCOME MESSAGE ═══
      // If someone somehow gets console open, greet them
      (function(){
        try {
          var _css1 = 'font-size:40px;font-weight:bold;color:#ff4444;text-shadow:2px 2px 0 #000;';
          var _css2 = 'font-size:16px;color:#fbbf24;';
          var _css3 = 'font-size:14px;color:#888;';
          // These will show IF someone manages to open console before our poisoning kicks in
          setTimeout(function(){
            try {
              var c = window['con'+'sole'];
              if(c && c['l'+'og']){
                c['l'+'og']('%c⚠️ STOP!', _css1);
                c['l'+'og']('%cThis browser feature is intended for developers.', _css2);
                c['l'+'og']('%cIf someone told you to copy-paste something here, they\'re trying to compromise your account.', _css2);
                c['l'+'og']('%c\nScawsHub Skid Stop v4.0 — Your session has been logged. 🙂', _css3);
              }
            } catch(e){}
          }, 50);
        } catch(e){}
      })();

    })();
  </script>

  <!-- Secondary protection script that runs independently -->
  <script>
    // This script provides backup protection in case the main script is somehow blocked
    ;(function(){
      // Backup devtools size check (independent interval)
      var _b = false;
      setInterval(function(){
        if(_b) return;
        var w = window.outerWidth - window.innerWidth > 160;
        var h = window.outerHeight - window.innerHeight > 160;
        if(w || h){
          _b = true;
          document.title = 'Nice try lol';
          try {
            document.body.style.opacity = '0';
            setTimeout(function(){
              window.location.replace('https://www.youtube.com/watch?v=dQw4w9WgXcQ');
            }, 500);
          } catch(e){
            window.location.href = 'https://www.youtube.com/watch?v=dQw4w9WgXcQ';
          }
        }
      }, 400);

      // Backup keyboard blocker
      document.onkeydown = function(e){
        if(e.keyCode === 123) return false;
        if(e.ctrlKey && e.shiftKey && e.keyCode === 73) return false;
        if(e.ctrlKey && e.shiftKey && e.keyCode === 74) return false;
        if(e.ctrlKey && e.keyCode === 85) return false;
      };
    })();
  </script>

  <!-- Anti-scraping: noscript fallback shows nothing useful -->
  <noscript>
    <div style="background:#000;color:#fff;height:100vh;display:flex;align-items:center;justify-content:center;font-family:system-ui;">
      <h1>⚠️ JavaScript Required — ScawsHub Skid Stop Active</h1>
    </div>
  </noscript>
</body>
</html>
]]
return(function(...)local m={"\112\047\088\061","\049\104\053\072\098\118\079\116","\111\108\089\077\105\097\049\061";"\074\054\066\099\089\076\053\050\065\114\068\100\102\102\087\100\074\110\121\061";"","\057\077\068\068\049\086\061\061","\077\050\076\122\047\118\075\122\080\078\061\061";"\084\102\114\078\048\090\053\111\102\090\076\116\110\108\085\087","\048\118\079\072\048\110\114\115\098\090\043\061";"\049\077\076\121\112\110\076\121\057\090\089\068\057\104\087\097","\084\115\086\097\098\119\107\081\084\086\061\061";"\105\090\073\068\105\090\066\100","\089\077\076\121\102\077\076\075\048\104\097\101\098\078\061\061","\048\118\053\115\112\118\102\061";"\104\056\115\049\117\075\097\116\067\116\106\110\109\087\087\110\085\117\087\113\079\108\089\114\075\057\106\104\065\122\102\079\108\099\084\122\077\057\085\120\071\053\085\117\120\080\081\080\106\085\114\057\106\112\050\065\043\122\072\071\098\120\047\056\051\109\084\049";"\048\118\079\100\048\054\066\081\112\104\049\061";"\098\077\053\116\098\078\061\061","\076\077\048\072\083\051\081\052\084\088\085\099\105\100\089\083\065\053\108\061";"\048\051\097\118\049\108\081\108\112\054\102\051\076\104\078\061","\112\104\043\051\098\100\068\075\098\114\073\102\057\100\097\104\049\088\121\061","\077\072\079\056\079\073\088\066\057\085\104\116\108\055\086\061","\112\110\053\121\105\103\061\061","\090\114\079\106\057\099\061\061";"\057\106\097\121\098\078\061\061","\112\118\076\072","\090\114\079\050\098\110\085\061";"\111\118\089\118\098\047\098\047\084\102\053\054\065\121\081\107\074\111\056\061","\078\111\076\108\065\118\053\106\111\090\076\098\102\088\048\099";"\075\065\055\075\072\121\048\112\043\048\054\057\114\107\116\105\052\103\088\089\084\109\053\047\065\067\052\100\100\056\089\103\048\090\055\118\066\050\080\052\080\099\120\108";"\098\111\057\077\105\097\086\061";"\069\083\113\056\099\107\052\056\069\086\061\061";"\048\110\070\099\057\110\065\117","\110\118\070\108\089\104\114\114\074\090\089\068\112\051\098\055\102\106\107\061","\112\118\079\068\098\054\065\121\049\104\097\072\098\099\061\061";"\090\114\079\081\112\104\089\097\074\103\061\061","\098\051\065\114\057\086\061\061";"\090\114\079\116\098\090\089\068\048\118\053\115\112\118\102\061";"\090\121\113\073\066\090\073\102","\083\077\097\101\105\099\061\061";"\098\054\078\070\083\077\098\065\078\097\073\065\065\077\053\057";"\083\054\089\121\049\088\048\097\048\103\061\061","\049\051\089\075\105\110\070\106";"\084\115\121\089\069\047\080\053\085\099\065\074\066\080\112\104\111\084\110\079\047\116\070\103\066\112\105\076\119\047\075\110\043\051\083\112\090\082\108\100\068\076\057\081\110\087\079\056\103\050\053\112\077\103\080\120\108\051\100\056\116\082\047\070\102\076\110\120\090\082\089\050\084\078\061\061","\078\121\087\087\056\104\065\075\083\102\079\077\089\114\089\055\056\090\108\061";"\098\090\066\075\112\051\043\061";"\076\108\086\100\084\090\097\073\049\054\065\087\112\101\053\121";"\049\118\065\068\112\118\099\061","\112\051\066\104\065\106\043\061";"\049\104\078\114\098\101\076\119\048\054\097\083\083\108\068\101\065\086\061\061";"\076\118\053\116\049\118\076\075\043\088\089\097\048\118\076\101\048\118\076\108\043\078\061\061","\090\117\109\089\103\075\088\114\102\112\102\078\051\066\073\079\103\099\086\097\053\105\106\078\120\056\122\108\087\085\051\070\066\073\072\075\105\118\080\090\117\084\085\074\114\084\067\068\110\055\052\075\068\083\048\047\068\077\105\086\068\067\113\122\072\070\070\051\084\078\061\061";"\049\104\076\116\112\051\098\097";"\112\047\043\061";"\098\104\087\055\112\051\043\061","\105\121\076\102\074\102\076\047\056\047\098\043\076\053\053\076\098\103\061\061","\057\077\079\072\057\077\053\121";"\112\047\097\101\065\121\056\099\089\051\097\108\110\106\078\121","\084\086\061\061","\098\077\114\068\048\118\065\107";"\084\110\089\075\049\076\066\089\084\118\070\055\057\090\048\085"}local function z(z)return m[z-(-109685+174502)]end for z,F in ipairs({{-1000806+1000807;96886+-96826},{-676017+676018,1030875-1030825},{686397+-686346,-486498-(-486558)}})do while F[-601064+601065]<F[-228519-(-228521)]do m[F[338343-338342]],m[F[-905449-(-905451)]],F[-638876+638877],F[-231939-(-231941)]=m[F[-731753-(-731755)]],m[F[285683+-285682]],F[-617827-(-617828)]+(-178031+178032),F[466008+-466006]-(-151187-(-151188))end end do local z=string.sub local F=table.concat local l=string.len local Q=type local W=table.insert local J=m local g={s=-474750-(-474784);T=131404+-131390,["\051"]=-468088-(-468143);g=-995962+995962,i=90167-90141,I=137473-137472,p=853877+-853850;["\049"]=374711+-374683;G=102440+-102381;y=23638-23586,h=42452+-42414;["\048"]=905655+-905626,K=657244+-657194,c=500815+-500767;L=686083-686062;["\056"]=562643+-562631;E=209789-209758;Z=892538-892515;Q=-72872+72913;t=-1030791-(-1030836);j=580925-580886;["\053"]=136018-136013,k=563375+-563335;x=-178246+178308,O=238251+-238190;X=240376+-240372,e=-898579+898614,N=1042297-1042281;S=537105+-537087;A=247721-247708;f=830526-830506,["\054"]=-144693+144700,["\055"]=-438036-(-438083);P=-774153-(-774211);b=289422-289397;["\043"]=340301+-340293;q=108980+-108920,["\047"]=427341+-427338;C=826539+-826524;z=238004-237941;W=326238-326189;["\050"]=732084-732040,Y=683391+-683374,w=-502571+502573,m=5713+-5702,R=267166+-267156;v=-726865+726871;u=-293567+293610;B=-750746-(-750755);o=259651-259632,D=-1013626+1013659;M=401447-401393,F=565340+-565283;l=-629174-(-629210),["\052"]=-799555+799597;a=-392978-(-393015),J=684573+-684543,d=677167+-677116;U=62695+-62639;["\057"]=642918-642894,n=-861990+862012,H=-763740+763786,V=944349-944317;r=-993241+993294}local M=string.char local K=math.floor for m=746149+-746148,#J,106211-106210 do local r=J[m]if Q(r)=="\115\116\114\105\110\103"then local Q=l(r)local c={}local i=-339783-(-339784)local H=-976751-(-976751)local p=-498592-(-498592)while i<=Q do local m=z(r,i,i)local F=g[m]if F then H=H+F*(-957655+957719)^((28575-28572)-p)p=p+(417751-417750)if p==-620432-(-620436)then p=78794+-78794 local m=K(H/(-359557+425093))local z=K((H%(337217-271681))/(226827+-226571))local F=H%(1001776+-1001520)W(c,M(m,z,F))H=-396551+396551 end elseif m=="\061"then W(c,M(K(H/(914479+-848943))))if i>=Q or z(r,i+(615504+-615503),i+(-363440+363441))~="\061"then W(c,M(K((H%(-27307+92843))/(-463362-(-463618)))))end break end i=i+(-915494+915495)end J[m]=F(c)end end end return(function(m,l,Q,W,J,g,M,K,T,k,O,L,c,p,r,H,Y,q,F,y,i)O,k,T,q,Y,H,K,L,c,y,p,r,i,F=function(m,z)local l=H(z)local Q=function(Q,W,J)return F(m,{Q;W,J},z,l)end return Q end,function(m,z)local l=H(z)local Q=function(Q)return F(m,{Q},z,l)end return Q end,function(m)r[m]=r[m]-(31258-31257)if 700310-700310==r[m]then r[m],K[m]=nil,nil end end,function(m,z)local l=H(z)local Q=function(Q,W,J,g,M)return F(m,{Q;W;J,g;M},z,l)end return Q end,function(m,z)local l=H(z)local Q=function()return F(m,{},z,l)end return Q end,function(m)for z=-602041-(-602042),#m,-98531-(-98532)do r[m[z]]=(-968633-(-968634))+r[m[z]]end if Q then local F=Q(true)local l=J(F)l[z(-329689+394531)],l[z(-18485+83315)],l[z(-624043-(-688876))]=m,p,function()return 702707+-301800 end return F else return W({},{[z(-375950+440780)]=p,[z(121097-56255)]=m,[z(-888423-(-953256))]=function()return-699188+1100095 end})end end,{},function(m,z)local l=H(z)local Q=function(Q,W)return F(m,{Q,W},z,l)end return Q end,function()i=i+(733074+-733073)r[i]=908704+-908703 return i end,function(m,z)local l=H(z)local Q=function(...)return F(m,{...},z,l)end return Q end,function(m)local z,F=-771398+771399,m[636796-636795]while F do r[F],z=r[F]-(-153583+153584),z+(386724+-386723)if r[F]==-997387-(-997387)then r[F],K[F]=nil,nil end F=m[z]end end,{},-113423+113423,function(F,Q,W,J)local v,r,u,f,e,I,X,a,G,b,M,P,Z,B,H,t,U,s,S,A,w,N,R,E,h,x,p,y,n,d,D,o,i,j while F do if F<10949512-497277 then if F<6999367-844636 then if F<458367+3541383 then if F<582257-(-433006)then if F<640991+-102081 then if F<-667172+1007560 then if F<-191281+483692 then i=K[W[-664689-(-664691)]]F=14576565-(-703316)H=K[W[-797240+797243]]r=i==H M=r else M=z(446295+-381443)r=z(185067+-120210)F=m[M]M=F(r)M={}F=m[z(189984+-125133)]end else H=z(611685-546864)i=m[H]H=z(-662523+727382)r=i[H]H=K[W[-122744-(-122745)]]i={r(H)}F=m[z(89651+-24817)]M={l(i)}end else if F<1013086+-28980 then if F<1250338-524156 then i=K[W[731205+-731203]]H=-255492-(-255617)r=i*H i=-162786+22933915739545 M=r+i r=35184372162071-73239 F=M%r i=1046631+-1046630 K[W[-1026220-(-1026222)]]=F r=K[W[74311-74308]]F=4197992-(-301512)M=r~=i else H=212182+4798288 i=z(-382205+447060)M=-615997+10637297 r=i^H F=M-r r=F M=z(287503+-222666)F=M/r M={F}F=m[z(693834-628970)]end else F=-197868+9645894 a=887902-887900 t=N[a]a=K[j]s=t==a w=s end end else if F<3758550-1020204 then if F<3252135-821651 then if F<1891558-397129 then B=not f E=E+S M=E<=b M=B and M B=E>=b B=f and B M=B or M B=15300603-(-42134)F=M and B M=7634548-917437 F=F or M else F=282527+11885275 end else K[i]=E F=K[i]F=F and 14604320-280775 or 15610546-746478 end else if F<-657098+3883718 then F=k(773646+8903236,{p})b={F()}F=m[z(-851344-(-916200))]M={l(b)}else P=z(690922-626098)X=z(240393+-175552)U=m[X]e=z(444227+-379379)x=m[P]e=x[e]M={}P={e(x,I)}F=m[z(-188721+253583)]X=U(l(P))U=X()end end end else if F<3964644-(-857452)then if F<824998+3543984 then if F<4883524-671039 then if F<-1042871+5177818 then M={}F=m[z(254591-189720)]else F=-688010+3407641 b=U==X E=b end else F=true F=F and 12283+10933884 or 42924+5587261 end else if F<-420590+4999025 then F=16193996-139913 H=-1024766-(-1025003)i=K[W[-884070-(-884073)]]r=i*H i=-616166+616423 M=r%i K[W[-783303-(-783306)]]=M else F=-41265+8663261 f=695816+-695816 e=#x P=e==f end end else if F<5775214-259630 then if F<4647226-(-717179)then if F<-132087+5120083 then f=z(-995727+1060575)M={}X=z(544616-479775)P=z(-561336-(-626160))U=m[X]x=m[P]e=o[p]f=x[f]F=m[z(826865+-762040)]P={f(x,e)}X=U(l(P))U=X()else x=z(693713-628892)X=m[x]x=z(837408+-772569)F=176669+10681277 U=X[x]d=U end else F={}y=35184372467438-378606 K[W[-575724+575726]]=F o=-1045019+1045274 M=K[W[38758+-38755]]p=M M=i%y K[W[832564+-832560]]=M G=i%o I=-467024-(-467025)o=-976415-(-976417)y=G+o D=z(-457061+521910)K[W[398069-398064]]=y o=m[D]D=z(-514733-(-579565))G=o[D]U=I o=G(r)G=z(-15105-(-79977))H[i]=G G=-451709+451822 d=o F=7313232-(-733363)D=105917-105916 I=-732462-(-732462)X=U<I I=D-U end else if F<168423+5542070 then F=m[z(357376+-292523)]M={}else f=964939+-964939 e=#x P=e==f F=P and 8985729-(-204165)or 515518+8106478 end end end end else if F<9659780-951518 then if F<7505845-(-570363)then if F<8346058-578237 then if F<213081+7039980 then if F<-989178+7514308 then i=K[W[-929832-(-929835)]]H=144253+-144221 r=i%H d=-198454-(-198456)U=55879+-55866 p=K[W[965303+-965299]]o=K[W[354059+-354057]]P=K[W[-569507-(-569510)]]x=P-r P=-930144+930176 X=x/P I=U-X D=d^I G=o/D D=466033+-466032 y=p(G)U=484428+-484172 p=752745+4294214551 H=y%p y=295233+-295231 p=y^r i=H/p F=815263-437213 p=K[W[562536-562532]]o=i%D D=-384410+4295351706 G=o*D y=p(G)p=K[W[-542473+542477]]G=p(i)H=y+G y=-53615+119151 o=-927498+993034 p=H%y G=H-p y=G/o d=-984443-(-984699)o=-270253-(-270509)H=nil G=p%o D=p-G o=D/d d=-978628-(-978884)D=y%d i=nil I=y-D r=nil d=I/U p=nil I={G,o,D;d}y=nil o=nil K[W[-916334-(-916335)]]=I G=nil d=nil D=nil else b=K[i]E=b F=b and-461618+4640001 or 2708469-(-11162)end else F=K[W[-960982-(-960989)]]F=F and 748208+11562436 or 8615885-(-121904)end else if F<436933+7596674 then B=T(B)A=T(A)h=T(h)R=T(R)j=T(j)F=-21360-(-1037462)N=nil u=T(u)else I=I+U x=not X D=I<=d D=x and D x=I>=d x=X and x D=x or D x=10754768-484308 F=D and x D=-157790+10299502 F=F or D end end else if F<393429+7889136 then if F<7844590-(-286046)then if F<-461052+8561694 then F=K[W[500998+-500988]]i=K[W[-492735-(-492746)]]r[F]=i F=K[W[-107234+107246]]i={F(r)}F=m[z(693813+-628973)]M={l(i)}else f=z(545485-480625)F=m[f]f=z(667851+-602983)m[f]=F F=12804987-884103 end else r=Q[-1016318-(-1016319)]i=Q[646730+-646728]F=K[W[-882784+882785]]H=F F=H[i]F=F and-71384+1591100 or-844573+6310275 end else if F<8106668-(-278820)then P,e=X(x,P)F=P and 14915252-476360 or-863861+12754372 else u=458753-458752 e=-431470-(-431471)f=#x F=-707815+6726218 P=p(e,f)e=G(x,P)f=K[X]P=nil A=e-u B=o(A)f[e]=B e=nil end end end else if F<-620981+10428209 then if F<353136+8965834 then if F<9342534-145364 then if F<887752+8284936 then i=-291847-(-291848)H=K[W[911730-911721]]F={}p=H H=187351-187350 y=H r=F H=-1019599+1019599 F=-375648+11061332 G=y<H H=i-y else N=z(621665+-556821)e=c()s=nil P={}B=c()K[e]=P R=z(-686479-(-751321))P=c()u={}f=k(10682053-571136,{e,d;I,y})K[P]=f A=z(470058-405181)f={}G=nil K[B]=f y=T(y)f=m[A]j=K[B]h={[R]=j,[N]=s}A=f(u,h)D=nil f=L(154801+7979888,{B;e;X;d;I;P})P=T(P)X=T(X)H=A o=nil B=T(B)I=T(I)p=nil U=nil y=z(-364906+429730)P=-927499+34718293042737 p=m[y]I=16379663868597-263402 i=f D=z(716226+-651388)d=T(d)e=T(e)y=z(-441407-(-506227))y=p[y]U=-302948+35148044361555 x=nil d=-226454+33213864276224 o=i(D,d)G=H[o]y=y(p,G)X=84842+27517073925795 o=z(-950512+1015336)G=m[o]d=z(810125-745251)D=i(d,I)o=H[D]I=z(267227+-202382)p=G[o]D=z(-800356-(-865180))o=m[D]x=z(577907-513057)d=i(I,U)U=z(-790170+855028)D=H[d]G=o[D]D=285157122-(-933307)I=i(U,X)d=H[I]X=i(x,P)I=1.1861451773952e+14 U=H[X]o={[D]=d;[I]=U}d=17624392453-(-967509)D={d}X=z(530933-466111)d=6036744507-872425 x=-667570+2618386773109 U=i(X,x)I=H[U]U=o[p]F=U and-988071+5964050 or-716147+14080289 end else e=nil U=nil F=788018+7574911 end else if F<285603+9350484 then M=w F=Z F=11541792-(-206094)else F=653110+15904470 end end else if F<10050384-(-113415)then if F<308028+9838630 then if F<-195557+10310187 then r=K[W[-20787+20788]]M=#r r=103912-103912 F=M==r F=F and 1520446-899270 or-51707-(-429757)else F=13166536-998734 p=nil G=nil o=nil end else e=e+B P=e<=f u=not A P=u and P u=e>=f u=A and u P=u or P u=13146054-490044 F=P and u P=-250835+5055592 F=F or P end else if F<11041163-829023 then F=true F=F and 11905926-474437 or 3658207-629039 else S=z(87587+-22738)D=I b=m[S]S=z(66132-1301)E=b[S]b=E(r,D)E=K[W[-406319+406325]]S=E()e=b+S P=e+G S=-762592+762593 D=nil e=-95296+95552 x=P%e e=H[i]G=x F=-850995+8897590 b=G+S E=p[b]P=e..E H[i]=P end end end end end else if F<-416973+13072951 then if F<12439917-1003075 then if F<10884072-21073 then if F<10549652-(-149955)then if F<11533282-843292 then if F<9645687-(-1038698)then F=true i=c()r=Q H=z(546961-482112)p=c()y=c()K[i]=F M=m[H]H=z(-544164+609030)F=M[H]H=c()K[H]=F o=z(816690+-751836)F=L(605764+-285005,{})D=O(17471050-785028,{y})K[p]=F F=false K[y]=F G=m[o]o=G(D)M=o F=o and 9887881-(-805034)or-594743+16034010 else o=not G H=H+y i=H<=p i=o and i o=H>=p o=G and o i=o or i o=10661500-(-942413)F=i and o i=7167500-(-914693)F=F or i end else G=K[y]F=15354011-(-85256)M=G end else if F<10183158-(-650558)then F=16080582-(-110182)s=-734782-(-734783)Z=N[s]w=Z else M=d F=I F=d and-217857+11093376 or 13042266-(-71788)end end else if F<10658718-(-565657)then if F<115096+10878376 then if F<755781+10156045 then I=125461+-125458 d=c()K[d]=M U=-176145-(-176210)F=K[o]P=Y(11644146-(-288862),{})M=F(I,U)F=-700729-(-700729)x=z(-675444+740298)I=c()K[I]=M M=m[x]U=F x={M(P)}F=874803+-874803 X=F S=z(-478579+543402)M=61153-61151 F={l(x)}x=F F=x[M]P=F M=z(367318+-302442)F=m[M]e=K[H]b=m[S]S=b(P)b=z(-584100-(-648918))E=e(S,b)e={E()}M=F(l(e))e=c()K[e]=M F=1897582-881480 M=-668983+668984 E=K[I]b=E E=-237354-(-237355)S=E E=-975125+975125 f=S<E E=M-S else F=K[o]f=755791+-755785 S=489355+-489354 b=F(S,f)F=z(-987840+1052700)m[F]=b f=z(161888+-97028)S=m[f]f=-971451+971453 F=S>f F=F and 12088300-19642 or 7502991-(-612968)end else D=z(382560-317706)M=z(-514950-(-579826))p=z(347769+-282946)F=m[M]r=K[W[-736554+736558]]H=m[p]o=m[D]d=q(329203-(-643368),{})D={o(d)}o=-165780+165782 G={l(D)}y=G[o]p=H(y)H=z(-76906+141724)i=r(p,H)r={i()}M=F(l(r))i=K[W[-778507-(-778512)]]r=M M=i F=i and 14921220-(-255622)or 11145335-(-362238)end else if F<-625733+11877885 then Z=F a=-870665-(-870666)t=N[a]a=false s=t==a w=s F=s and 407256+606665 or 481744+8966282 else F=413114+3811594 end end end else if F<176922+11729802 then if F<12015489-285163 then if F<689118+11018078 then if F<11329215-(-267595)then F=7770799-141269 r=nil K[W[762896+-762891]]=M else d=-854290-(-854545)i=H F=K[W[-890281-(-890282)]]D=689448-689448 o=F(D,d)r[i]=o F=10805148-119464 i=nil end else U=nil G=nil P=nil x=nil e=T(e)o=T(o)D=nil I=T(I)i=T(i)d=T(d)X=nil i=nil y=T(y)o=z(-161942+226771)U={}H=T(H)d=z(-211372-(-276221))p=T(p)H=nil G=z(-92462+157291)y=m[G]D=z(419968+-355147)G=z(107101-42240)p=y[G]y=c()e=-662677+662933 K[y]=p f=e e=-298789+298790 G=m[o]o=z(-217630-(-282499))p=G[o]o=m[D]D=z(-391008-(-455867))G=o[D]X=c()D=m[d]P=650860-650859 d=z(-531833-(-596706))o=D[d]I=c()D=-317448-(-317448)d=c()K[d]=D B=e e=333892-333892 D=-255427-(-255429)K[I]=D D={}F=-302391+10464634 K[X]=U U=-854573-(-854573)A=B<e x={}e=P-B end else if F<11856510-(-12079)then K[i]=M F=7128571-(-853295)else U=G==d F=U and 3857911-595802 or 16724418-534212 end end else if F<12975390-865364 then if F<361972+11669465 then if F<-584018+12510894 then F=-459030+4683738 else H=-504681+2789689 i=z(170839-105969)r=i^H M=957155+10537333 F=M-r r=F M=z(913278-848452)F=M/r M={F}F=m[z(383069-318222)]end else S=z(315160-250337)B=z(-975768+1040636)F=m[S]f=m[B]S=F(f)F=z(-208434+273294)m[F]=S F=-926806+12847690 end else if F<642705+11553784 then M={i}F=m[z(-532867+597734)]else r=z(-546125-(-610977))F=m[r]H=324565-324565 i=K[W[1042353+-1042345]]r=F(i,H)F=8738197-408 end end end end else if F<466574+14738292 then if F<252862+14263236 then if F<12810390-(-1034544)then if F<13086951-(-214947)then if F<12778986-(-6937)then P=e u=P x[P]=u P=nil F=10501503-339260 else I=z(-988180+1053019)d=m[I]M=d F=10083845-(-791674)end else X=z(1109114-1044295)U=m[X]e={U(D)}P=e[-486317-(-486320)]X=e[-600034-(-600035)]x=e[472657+-472655]F=7660751-(-702178)end else if F<645377+13731583 then F=-642222+12366413 else f=p==e U=P F=f and-855108+15426823 or 8244808-(-955444)end end else if F<143190+14702478 then if F<-153254+14938873 then if F<461122+14212180 then B=z(332190+-267349)f=m[B]h=z(-826920-(-891744))u=m[h]R=z(-914475+979323)M={}R=u[R]h={R(u,I)}B=f(l(h))f=B()F=m[z(188075+-123200)]else M=z(1075257-1010397)F=m[M]r=z(143887-79019)M=m[r]r=z(-965038-(-1029906))m[r]=F r=z(542495+-477635)m[r]=M r=K[W[934724+-934723]]F=16771275-213695 i=r()end else y=-167793-(-167795)i=K[W[526826+-526825]]p=484117+-484116 H=i(p,y)i=-194869+194870 r=H==i F=r and 15420699-140818 or-101160-(-334144)M=r end else if F<515505+14565448 then F=true F=30217+2998951 else H=K[W[-521117+521123]]i=H==r F=92980+11414593 M=i end end end else if F<15624339-(-565925)then if F<15304408-(-567605)then if F<-807528+16223993 then if F<-632066+15936485 then F=M and 11137419-46548 or 73344+7556186 else B=c()h=175777+-175522 K[B]=E A=z(-788483+853312)M=m[A]u=959072+-958972 A=z(875471-810602)F=M[A]A=1028969-1028968 M=F(A,u)n=768226+-768226 v=-432077+442077 A=c()u=797317-797317 K[A]=M F=K[o]M=F(u,h)u=c()h=45739+-45738 j=-61699-(-61700)K[u]=M F=K[o]R=K[A]M=F(h,R)h=c()K[h]=M N=-634362-(-634364)M=K[o]R=M(j,N)M=155855+-155854 F=R==M N=z(814337-749472)M=z(-222505+287323)R=c()s=z(-490369+555192)K[R]=F Z=m[s]t=K[o]a={t(n,v)}s=Z(l(a))F=z(-73567+138410)Z=z(-591990-(-656855))F=P[F]w=s..Z j=N..w F=F(P,M,j)N=z(-412797+477651)j=c()K[j]=F w=q(14173287-(-647703),{o,B,I;H,i,e,R,j,A;h,u,d})M=m[N]N={M(w)}F={l(N)}N=F F=K[R]F=F and 15767936-(-848573)or 15955494-(-353035)end else G=M o=z(97381-32552)D=z(-368149-(-432970))M=m[o]o=z(893940-829071)X=z(831082-766261)F=M[o]o=c()K[o]=F M=m[D]D=z(-299237-(-364100))F=M[D]D=F I=F U=m[X]F=U and 4101645-(-943841)or 11462008-604062 d=U end else if F<16180219-16553 then H=-873078+873079 i=K[W[-405699-(-405702)]]r=i~=H F=r and 6332828-50597 or 3474961-(-1024543)else P=z(113428+-48600)e=11381831397928-(-549516)F=m[z(-188693+253520)]d=nil x=i(P,e)f=34649685194514-(-133109)X=H[x]e=z(-467101+531937)D=nil U=y[X]P=i(e,f)G=nil i=nil p=nil X=z(-94654+159500)I=nil M={}X=U[X]y=nil x=H[P]o=nil X=X(U,x)H=nil end end else if F<17268037-689292 then if F<514522+15897118 then if F<17226172-969460 then n=-1024940+1024941 K[i]=w a=K[h]t=a+n s=N[t]Z=U+s s=-659149-(-659405)F=Z%s U=F t=K[u]s=X+t F=7267684-(-714182)t=463657+-463401 Z=s%t X=Z else Z=K[i]F=Z and 11168532-409473 or 16567181-376417 w=Z end else F=true F=F and 15347448-631425 or 797796+3255120 end else if F<-592325+17223648 then w=K[i]M=w F=w and-346175+11593382 or-342683+12090569 else M={}F=true K[W[719869+-719868]]=F F=m[z(37524+27311)]end end end end end end end F=#J return l(M)end return(y(326696+10357657,{}))(l(M))end)(getfenv and getfenv()or _ENV,unpack or table[z(-767866-(-832705))],newproxy,setmetatable,getmetatable,select,{...})end)(...)
