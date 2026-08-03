--[===[
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SORONICE HUB</title>
    <link rel="icon" type="image/jpeg" href="https://image-share-68.preview.emergentagent.com/api/images/0a1c08a6-7bee-4bd2-93db-43a808d97efb">
    <style>
        /* Configuration du fond */
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #101010;
            overflow: hidden;
            position: relative;
            
            /* L'ASTUCE MAGIQUE ICI : On rend les commentaires Lua totalement invisibles sur le site */
            color: transparent; 
            font-size: 0; 
        }

        /* Le calque qui passe DERRIÃRE le panneau central */
        .shine-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            pointer-events: none;
            z-index: 1;
            overflow: hidden;
        }

        /* L'effet de reflet miroir */
        .shine-line {
            position: absolute;
            top: 0;
            left: -50%;
            width: 12%;
            height: 100%;
            background: linear-gradient(
                90deg, 
                rgba(255, 255, 255, 0) 0%, 
                rgb(255, 255, 255) 50%, 
                rgba(255, 255, 255, 0) 100%
            );
            transform: skewX(-20deg); 
            animation: mirrorShine 10s infinite linear;
        }

        /* Animation du reflet */
        @keyframes mirrorShine {
            0% { left: -50%; }
            25% { left: 150%; }
            100% { left: 150%; }
        }

        /* Le rectangle central principal */
        .central-box {
            width: 18cm;
            height: 4cm;
            background-color: #6d6d6d;
            border-radius: 50px; 
            border: 2px solid rgb(0, 0, 0); 
            box-shadow: 0 0 15px 5px rgba(255, 255, 255, 0.462); 
            z-index: 10;
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
            box-sizing: border-box;
        }

        /* L'encoche noire au milieu */
        .notch {
            position: absolute;
            top: -3px; 
            width: 6cm;
            height: 1.2cm;
            background-color: #101010;
            border-bottom-left-radius: 25px;
            border-bottom-right-radius: 25px;
            border-bottom: 3px solid red;
            border-left: 3px solid red;
            border-right: 3px solid red;
            border-top: none;
            z-index: 5;
            display: flex;
            justify-content: center;
            align-items: center;
            box-sizing: border-box;
        }

        /* Le texte "SORONICE HUB" */
        .hub-text {
            font-family: Arial, sans-serif;
            font-size: 0.9rem;
            font-weight: bold;
            color: #ffffff;
            letter-spacing: 2px;
            margin-bottom: 2px; 
        }

        /* Conteneur pour le texte et le bouton */
        .script-container {
            position: absolute;
            top: 55%;
            transform: translateY(-50%);
            width: 85%;
            background-color: #1e1e1e;
            border: 2px solid #000000;
            border-radius: 20px;
            padding: 10px 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-sizing: border-box;
        }

        /* Le texte du script */
        .script-text {
            font-family: monospace;
            font-size: 14px;
            color: #ffffff;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            flex-grow: 1;
            margin-right: 15px;
            user-select: all;
        }

        /* Le bouton avec l'image arrondie */
        .copy-btn {
            width: 32px; 
            height: 32px;
            background-image: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAcJbdRuqLV4ekNnUNhxQnG0YFfbcMPiBZS3RyDoSZvA&s');
            background-size: cover;
            background-position: center;
            background-color: transparent; 
            border: 2px solid #000000;
            border-radius: 50%; 
            cursor: pointer;
            flex-shrink: 0;
            transition: transform 0.2s ease, filter 0.2s ease;
        }

        .copy-btn:hover {
            transform: scale(1.1);
        }

        .copy-btn:active {
            transform: scale(0.9);
            filter: brightness(0.7); 
        }

    </style>
</head>
<body>

    <div class="shine-overlay">
        <div class="shine-line"></div>
    </div>

    <div class="central-box">
        <div class="notch">
            <div class="hub-text">SORONICE HUB</div>
        </div>

        <div class="script-container">
            <div class="script-text" id="lua-script">GÃ©nÃ©ration du script...</div>
            <button class="copy-btn" id="copy-btn" title="Copier le script"></button>
        </div>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const scriptTextElement = document.getElementById("lua-script");
            const copyBtn = document.getElementById("copy-btn");

            // RÃ©cupÃ¨re l'URL directe du site
            const currentUrl = window.location.href;

            // GÃ©nÃ¨re la commande de base que tout le monde connaÃ®t
            const luaCode = `loadstring(game:HttpGet('${currentUrl}'))()`;

            // Affiche la commande
            scriptTextElement.textContent = luaCode;

            // Copie la commande au clic
            copyBtn.addEventListener("click", function() {
                navigator.clipboard.writeText(luaCode).then(function() {
                    console.log("Script copiÃ© avec succÃ¨s !");
                }).catch(function(err) {
                    console.error("Erreur : ", err);
                    alert("Erreur lors de la copie.");
                });
            });
        });
    </script>

</body>
</html>
]===]

return(function(...)local F={"\075\077\114\078\075\052\070\071\081\099\053\061";"\052\079\081\068\054\105\075\122\054\118\114\120\098\067\054\108";"\098\108\100\085\112\052\120\082","\099\070\114\122\081\052\110\061","\088\082\079\053\073\106\083\099\048\067\083\082\048\079\079\119\073\082\051\061","\088\077\079\089\098\077\088\085\053\068\100\115\075\077\088\106\075\077\088\101\053\107\061\061","\121\110\043\107\087\073\067\099\051\051\077\055\081\051\119\050\082\078\115\101\057\118\100\057\049\102\057\057\047\074\101\103\072\121\065\052\114\097\083\110\107\053\088\086\053\073\110\109\077\116\107\118\116\109\077\111\054\054\083\069\100\047\065\048\084\070\105\108\103\048\070\073\120\076\090\119\073\098\070\106\121\121\082\049\088\106\082\070\068\100\088\085\111\050\074\072\117\119\080\122\072\054\072\074\100\114\111\089\077\070\083\048\049\090\122\083\118\083\075\076\114\084\049\075\103\056\061\061","\081\108\083\070\054\051\061\061";"\099\070\114\082\054\056\061\061","\048\074\100\105\098\068\075\115\075\116\061\061","\075\077\114\049\075\074\090\055\097\121\098\061","\099\070\114\055\097\121\100\115\086\116\061\061";"\066\051\061\061";"\052\101\110\105\048\079\079\056\118\068\118\049\050\067\083\053";"\097\102\053\061";"\112\050\104\106\050\118\115\118\088\101\114\081\073\070\111\078\107\082\113\061";"\097\052\079\105\112\116\061\061","\048\099\090\082\075\049\104\065\097\099\111\112\048\049\090\053\048\107\061\061";"\075\106\053\120\050\102\104\053\075\070\081\068\098\052\115\111\088\121\098\061","\098\067\088\105\097\052\088\105\054\099\100\104\054\121\069\115";"\099\070\114\089\081\099\100\104\075\077\079\071\097\077\118\061";"\097\102\068\061","\097\077\088\078","\075\077\079\071\097\077\118\061","\081\067\070\104\075\077\083\113";"\066\068\081\054\112\118\104\105\112\121\120\084\048\115\073\070\112\056\061\061";"\081\121\069\072\097\108\053\061","\098\077\083\104\097\077\056\061";"\083\115\116\120\050\077\104\053\088\099\075\119\107\067\089\089";"\054\067\114\078\054\067\079\105","\066\068\079\049\112\052\083\070\048\108\055\066\083\049\101\061";"\097\077\114\104\081\074\083\105\098\121\115\078\081\056\061\061";"\073\088\090\052\066\074\100\107\081\102\088\090\112\101\081\067\098\074\113\061","\066\071\051\115\081\119\113\055\066\051\061\061","\052\101\081\085\098\077\081\102\081\115\098\105\054\050\116\069\107\051\061\061";"\054\067\104\104\098\051\061\061","\054\082\115\105\081\107\061\061","\100\115\088\118\081\068\100\053\097\088\111\073\075\077\081\055","\081\099\090\085\097\108\053\061";"\081\067\079\089\081\107\061\061","\098\121\079\078\081\077\114\089";"\075\052\120\056\054\052\083\057","\098\121\088\089\097\108\081\115","","\100\049\111\115\107\070\068\120\118\088\100\105\073\107\061\061";"\088\082\088\113\098\105\105\105\073\118\105\067\100\077\051\070\081\088\113\120","\048\049\081\083\050\074\055\107\075\082\081\073\107\052\047\108"}for x,S in ipairs({{-749809+749810;850410+-850363},{984640-984639;-588776+588812};{-988229-(-988266);647984-647937}})do while S[825032-825031]<S[-352492-(-352494)]do F[S[-982525-(-982526)]],F[S[22745-22743]],S[-39721+39722],S[-467564-(-467566)]=F[S[460254-460252]],F[S[-980917-(-980918)]],S[1003676-1003675]+(937457+-937456),S[518522+-518520]-(-647362-(-647363))end end local function x(x)return F[x+(-493906-(-496285))]end do local x=math.floor local S=string.len local Z={["\053"]=1040305+-1040297;C=879827-879773,o=-691439-(-691440),P=-472435+472497,["\055"]=282196+-282155,["\049"]=592224+-592173;A=-875338-(-875349),b=213398+-213370;z=194464-194420,d=632229-632212,U=748644+-748594;["\047"]=883498-883438,["\048"]=-139448-(-139466),c=324508+-324485;y=841661-841623;v=27275+-27255;["\057"]=-1005260+1005303;s=818717+-818680;D=216613-216609;E=-268684-(-268733),Q=-842702-(-842727);N=-311740+311786;u=-279314+279345;x=-576426+576483;K=587979+-587950,L=-1009645-(-1009708);M=-12890-(-12896);m=-852956-(-852998),w=674441-674439,O=94780+-94775;T=299152+-299142;h=964269-964236;V=-574916-(-574946);W=-217272+217287;l=-82747-(-82802),p=-711406-(-711432),X=-183537-(-183558);i=-690084+690136,r=-905023-(-905084);t=-475320+475320;q=142482-142442,G=-1016301-(-1016335),["\051"]=-580567+580599;n=-1009793-(-1009849);B=65847-65833;R=-821173-(-821212);a=745679+-745652,["\050"]=-584308+584327;J=298288-298281;e=205705+-205669,Y=133740+-133695;["\054"]=-681900-(-681924),S=992257+-992244,Z=-393689-(-393698);["\056"]=534147-534099,H=998747+-998700;["\052"]=281635+-281613,["\043"]=830314+-830256,f=-145882+145885;j=226273+-226238;k=-180871-(-180887);F=724815-724762,g=-353356+353415;I=-336277+336289}local a=F local m=table.insert local P=table.concat local b=type local y=string.sub local t=string.char for F=-445375-(-445376),#a,-760490+760491 do local k=a[F]if b(k)=="\115\116\114\105\110\103"then local b=S(k)local i={}local g=-599877+599878 local s=27196-27196 local u=-507002+507002 while g<=b do local F=y(k,g,g)local S=Z[F]if S then s=s+S*(381294+-381230)^((888092-888089)-u)u=u+(370379-370378)if u==-681975-(-681979)then u=843520-843520 local F=x(s/(1099065-1033529))local S=x((s%(964321-898785))/(-1048356+1048612))local Z=s%(410222+-409966)m(i,t(F,S,Z))s=-96103-(-96103)end elseif F=="\061"then m(i,t(x(s/(-783456-(-848992)))))if g>=b or y(k,g+(487743+-487742),g+(671653-671652))~="\061"then m(i,t(x((s%(300320+-234784))/(977182+-976926))))end break end g=g+(33796-33795)end a[F]=P(i)end end end return(function(F,Z,a,m,P,b,y,A,t,S,u,c,C,g,h,R,s,k,e,W,i)g,W,A,s,t,c,S,u,k,R,i,C,h,e=524212+-524212,function(F,x)local Z=s(x)local a=function(a,m,P,b,y)return S(F,{a,m,P,b;y},x,Z)end return a end,function(F,x)local Z=s(x)local a=function(a,m)return S(F,{a,m},x,Z)end return a end,function(F)for x=470134+-470133,#F,189542+-189541 do k[F[x]]=(947132-947131)+k[F[x]]end if a then local S=a(true)local Z=P(S)Z[x(-513069-(-510691))],Z[x(820465-822799)],Z[x(-71241+68902)]=F,u,function()return 2546238-(-716182)end return S else return m({},{[x(284004-286338)]=u,[x(56153-58531)]=F,[x(236840-239179)]=function()return 2972646-(-289774)end})end end,{},function(F,x)local Z=s(x)local a=function(a)return S(F,{a},x,Z)end return a end,function(S,a,m,P)local O,w,s,B,u,Y,V,U,n,z,d,p,T,N,M,G,f,o,D,X,l,C,H,K,q,E,k,g,I,j,r,y,Q,J while S do if S<219904+8244451 then if S<-338602+3968741 then if S<2201680-149116 then if S<-264175-(-983422)then if S<-623205+1083227 then if S<-692729+1135422 then if S<498759+-305536 then S={}C=-536180+35184372625012 t[m[1005144+-1005142]]=S y=t[m[87644+-87641]]u=y I=x(499939-502279)y=g%C t[m[839882-839878]]=y G=669786-669531 z=g%G G=434895-434893 C=z+G t[m[-1017323+1017328]]=C G=F[I]I=x(454442+-456809)z=G[I]G=z(k)z=x(-204755+202409)s[g]=z O=G I=427786-427785 z=584592-584564 S=-327390+15597739 r=516098+-516097 M=r r=634253-634253 H=M<r r=I-M else X=M==H S=4624310-(-882924)E=X end else J=x(-456237-(-453869))d=x(-610214+607882)S=F[d]K=F[J]d=S(K)S=x(-712845-(-710470))F[S]=d S=15756640-781504 end else if S<814298-292595 then k=a[-1042119+1042120]S=t[m[22443+-22442]]s=S g=a[872854+-872852]S=s[g]S=S and 879833+13778802 or 238704+-98363 else s=-998466+998467 g=t[m[-364839+364842]]k=g~=s S=k and-190417+3459783 or 6848643-266051 end end else if S<340796+870027 then if S<-963251+1856622 then z=y G=x(138319-140692)I=x(-63163-(-60797))y=F[G]G=x(868097-870446)S=y[G]G=i()t[G]=S y=F[I]I=x(317172+-319532)S=y[I]I=S r=S H=x(872826-875192)M=F[H]O=M S=M and 1399892-(-305275)or-948381+4135920 else O=i()t[O]=y S=t[G]r=958240+-958237 M=-582186+582251 w=R(-728087+15237654,{})y=S(r,M)S=-114749+114749 T=x(-765465+763103)r=i()M=S t[r]=y S=396292-396292 y=F[T]T={y(w)}H=S S={Z(T)}T=S y=745167+-745165 S=T[y]y=x(643420-645762)d=x(-351337+349005)w=S S=F[y]Y=t[s]X=F[d]d=X(w)X=x(-141541+139185)E=Y(d,X)Y={E()}y=S(Z(Y))Y=i()t[Y]=y y=-377760+377761 E=t[r]X=E E=-621374-(-621375)d=E E=1019016-1019016 K=d<E E=y-d S=5196221-109899 end else if S<929510-(-832602)then T=x(431668+-434034)H=F[T]T=x(-292120+289772)M=H[T]S=113956+3073583 O=M else S=F[x(574438+-576810)]y={g}end end end else if S<1010576+2198611 then if S<907393+1899656 then if S<3242113-681874 then if S<1993106-(-373613)then s=t[m[-834891-(-834897)]]S=-599180+17013822 g=s==k y=g else H=nil I=nil M=nil r=e(r)g=e(g)Y=e(Y)C=e(C)M={}g=nil O=e(O)u=e(u)G=e(G)w=nil H=i()w=-12431+12432 s=e(s)T=nil z=nil z=x(309132-311505)G=x(-443088-(-440715))s=nil C=F[z]z=x(218030+-220393)u=C[z]C=i()t[C]=u T={}I=x(906422+-908788)z=F[G]G=x(458347+-460696)u=z[G]G=F[I]I=x(922554+-924901)z=G[I]O=x(-766852-(-764512))I=F[O]O=x(-1040167-(-1037813))G=I[O]O=i()r=i()Y=532072-531816 I=-358736+358736 S=-580125+12793875 t[O]=I I=-332536-(-332538)t[r]=I I={}t[H]=M M=-629124+629124 K=Y Y=-4047-(-4048)J=Y Y=839821-839821 q=J<Y Y=w-J end else t[g]=N Q=t[B]f=137083+-137082 V=Q+f l=U[V]o=M+l l=-774269+774525 S=o%l M=S V=t[j]l=H+V V=-788837+789093 o=l%V H=o S=11935871-910551 end else if S<3435316-247914 then u=745333+-745332 C=111545+-111543 g=t[m[-378437-(-378438)]]s=g(u,C)g=153137+-153136 k=s==g y=k S=k and 11038161-830970 or 8262977-779185 else y=O S=r S=O and 1239278-124647 or 13317876-653147 end end else if S<-886515+4276300 then if S<-642423+3905339 then l=47227-47226 o=U[l]S=2251230-(-499450)N=o else M=-931601+931614 s=547811+-547779 g=t[m[539356-539353]]k=g%s u=t[m[-148279-(-148283)]]O=949206-949204 G=t[m[-330999-(-331001)]]w=t[m[-199766-(-199769)]]T=w-k w=655578+-655546 H=T/w r=M-H I=O^r z=G/I I=-1033429-(-1033430)C=u(z)u=672311+4294294985 s=C%u M=856268+-856012 C=977887+-977885 u=C^k g=s/u u=t[m[-228698+228702]]G=g%I I=625961+4294341335 k=nil z=G*I G=-290553+356089 C=u(z)u=t[m[-271190-(-271194)]]z=u(g)s=C+z C=-763026-(-828562)u=s%C z=s-u C=z/G G=-709613+709869 z=u%G O=-542419-(-542675)I=u-z G=I/O g=nil O=661629+-661373 I=C%O S=487756+14748986 r=C-I O=r/M r={z;G,I;O}I=nil s=nil t[m[187270-187269]]=r u=nil C=nil G=nil z=nil O=nil end else if S<3163254-(-422173)then z=t[C]S=-998786+1743912 y=z else S=true S=S and 4345889-664501 or 7436933-253800 end end end end else if S<-977786+7010378 then if S<5425705-584786 then if S<-354389+4438218 then if S<2719470-(-991297)then if S<-330714+3994217 then S=true S=S and 16627785-443892 or 17662519-944278 else S=9226677-770687 end else q=x(-513616-(-511246))Y=i()K=h(-439185+8636997,{Y;O,r;C})w={}t[Y]=w w=i()u=nil j={}S=F[x(1011471-1013845)]M=nil t[w]=K K={}C=e(C)U=x(800731+-803100)p=x(878020-880398)y={}J=i()t[J]=K K=F[q]l=nil G=nil C=x(454316-456674)D=t[J]B={[p]=D;[U]=l}q=K(j,B)g=q z=nil T=nil K=W(148584-(-318829),{J,Y;H,O,r,w})Y=e(Y)s=K G=x(672424+-674774)J=e(J)u=F[C]I=nil z=F[G]w=e(w)H=e(H)O=e(O)r=e(r)M=18683017913136-(-835275)r=x(843526-845862)O=s(r,M)I=g[O]O=x(-852452-(-850119))g=nil s=nil O=z[O]G={O(z,I)}C=u(Z(G))u=C()end else if S<259181+4108789 then X=t[g]E=X S=X and-167178-(-607098)or-902965+6410199 else G=not z s=s+C g=s<=u g=G and g G=s>=u G=z and G g=G or g G=9240564-1002381 S=g and G g=-58466+10029348 S=S or g end end else if S<5756167-634522 then if S<684247+4359636 then k=x(-789842+787491)S=F[k]g=t[m[962687+-962679]]s=-1036488+1036488 k=S(g,s)S=620647+11159853 else J=not K E=E+d y=E<=X y=J and y J=E>=X J=K and J y=J or y J=1020515+13839895 S=y and J y=5047159-782838 S=S or y end else if S<431068+5074103 then t[g]=y S=3292+11022028 else t[g]=E S=t[g]S=S and 11156485-764691 or 12708928-488507 end end end else if S<215295+7606327 then if S<8125521-644777 then if S<7195466-345813 then if S<7391567-717603 then g=t[m[-165667-(-165670)]]s=-660596+660620 k=g*s g=-992165+992422 y=k%g t[m[919802-919799]]=y S=224244-(-456141)else N=t[g]S=N and 15765083-922499 or 5634530-192018 y=N end else S=W(877173+9184180,{u})X={S()}S=F[x(236813+-239177)]y={Z(X)}end else if S<261123+7467948 then g=t[m[447993-447991]]s=t[m[714898-714895]]S=9824080-(-383111)k=g==s y=k else K=-8364+8364 S=-637886+14036378 Y=#T w=Y==K end end else if S<725030+7502590 then if S<-881089+8716947 then s=743017-742908 g=t[m[-897020+897022]]k=g*s g=-528746+22217889413587 y=k+g g=688140+-688139 k=35184372305996-217164 S=y%k t[m[-581148+581150]]=S k=t[m[-355720-(-355723)]]S=7020653-438061 y=k~=g else k=t[m[933955+-933954]]y=#k k=848747-848747 S=y==k S=S and 63078+7758544 or 14444135-(-792607)end else if S<9315195-1020666 then g=s S=t[m[540905-540904]]I=118044+-118044 O=955475-955220 G=S(I,O)k[g]=G S=5114205-319179 g=nil else S=true S=S and-972637+10608617 or 14060324-(-1042697)end end end end end else if S<742909+12965745 then if S<10613532-(-827020)then if S<-131263+10433269 then if S<570795+9412634 then if S<-717288+10559421 then if S<8267249-(-1001836)then K=x(477262+-479637)S=F[K]K=x(-463636+461268)F[K]=S S=15123973-148837 else S=t[G]d=-568197+568198 K=152404-152398 X=S(d,K)K=x(401894-404269)S=x(811971+-814346)F[S]=X d=F[K]K=-990679+990681 S=d>K S=S and-824689+1276286 or 8674516-(-425810)end else S=t[m[-321076-(-321086)]]g=t[m[-493220-(-493231)]]k[S]=g S=t[m[214174-214162]]g={S(k)}S=F[x(-720595-(-718254))]y={Z(g)}end else if S<-963333+11087112 then S=3645574-(-575)else S=y and 11262308-(-279571)or 14500663-22731 end end else if S<11400744-387429 then if S<806456+10047367 then S=1792023-(-596083)else o=t[g]S=o and 4230320-967972 or 2173482-(-577198)N=o end else if S<-31295+11170715 then j=e(j)U=nil D=e(D)q=e(q)p=e(p)B=e(B)S=4293319-(-793003)J=e(J)else y=x(299248-301599)k=x(633292+-635629)S=F[y]y=S(k)S=F[x(-660076+657705)]y={}end end end else if S<13355144-1034831 then if S<12119283-212282 then if S<808639+10819050 then if S<11668690-147037 then y=N S=o S=864486+4578026 else u=x(531300-533632)y=x(245124+-247466)S=F[y]I=x(73397+-75759)k=t[m[712705-712701]]s=F[u]O=A(-797934+14514283,{})G=F[I]I={G(O)}z={Z(I)}G=-608975+608977 C=z[G]u=s(C)s=x(641568-643924)g=k(u,s)k={g()}y=S(Z(k))k=y g=t[m[846883-846878]]y=g S=g and 1817104-(-427782)or-708004+17122646 end else S={}k=S g=228336+-228335 s=t[m[6930-6921]]S=-290005+5085031 u=s s=899624-899623 C=s s=1026862+-1026862 z=C<s s=g-C end else if S<11310178-(-908779)then j=not q Y=Y+J w=Y<=K w=j and w j=Y>=K j=q and j w=j or w j=-434082+16579767 S=w and j w=7368129-(-453492)S=S or w else S=true S=-262324+7445457 end end else if S<642384+12524480 then if S<705102+11779655 then I=r d=x(1017014+-1019354)X=F[d]d=x(392743-395096)E=X[d]X=E(k,I)E=t[m[750219+-750213]]d=E()Y=X+d w=Y+z Y=563075+-562819 T=w%Y I=nil d=-836734+836735 z=T Y=s[g]X=z+d E=u[X]w=Y..E S=-271337+15541686 s[g]=w else r=x(-317946-(-315598))O=F[r]y=O S=2099+1112532 end else if S<13006991-(-355370)then s=x(-794009-(-791669))k=a g=i()S=true t[g]=S y=F[s]s=x(-170526+168161)S=y[s]C=i()s=i()t[s]=S S=W(674168+10760537,{})u=i()I=c(-327855+16661481,{C})t[u]=S S=false t[C]=S G=x(-972324+969962)z=F[G]G=z(I)y=G S=G and 2734302-(-774856)or 424155-(-320971)else K=#T Y=-338452-(-338453)w=u(Y,K)Y=z(T,w)j=-729956-(-729957)K=t[H]q=Y-j S=187663+14181873 w=nil J=G(q)K[Y]=J Y=nil end end end end else if S<14600056-(-302185)then if S<1015328+13482090 then if S<896149+13429056 then if S<14932362-1012374 then if S<14329920-506046 then s=455858+5237612 g=x(55062-57421)y=-705610+1539922 k=g^s S=y-k k=S y=x(-142302-(-139958))S=y/k y={S}S=F[x(118819-121157)]else Q=-420473-(-420475)V=U[Q]Q=t[D]S=12390636-928656 l=V==Q N=l end else G=nil z=nil u=nil S=1140054-(-636166)end else if S<-305593+14707121 then Y=#T K=-297413+297413 w=Y==K S=w and 3542065-(-168973)or 13472517-74025 else S=t[m[-578457-(-578464)]]S=S and 740919+4143641 or-236372+12016872 end end else if S<14382472-(-302676)then if S<867223+13751574 then y=-239602+2921634 s=569981+11477188 g=x(307533-309894)k=g^s S=y-k y=x(54960+-57305)k=S S=y/k y={S}S=F[x(920818-923175)]else S=2241949-465729 end else if S<503992+14351654 then Q=-343421-(-343422)V=U[Q]Q=false o=S l=V==Q S=l and 13609239-(-291210)or-583729+12045709 N=l else q=x(-9058+6685)J=i()D=414936-414935 t[J]=E j=-56451-(-56551)y=F[q]q=x(579047+-581396)S=y[q]q=997780-997779 l=x(879477-881809)y=S(q,j)q=i()j=-259233+259233 B=-590420-(-590675)t[q]=y S=t[G]f=140594-140594 U=769199-769197 y=S(j,B)j=i()B=-613306-(-613307)t[j]=y S=t[G]p=t[q]y=S(B,p)B=i()t[B]=y y=t[G]p=y(D,U)y=-104962+104963 S=p==y U=x(-611875+609498)p=i()n=317305-307305 y=x(-546359-(-544003))t[p]=S o=F[l]V=t[G]Q={V(f,n)}l=o(Z(Q))o=x(-628253+625876)N=l..o S=x(181314+-183649)D=U..N S=w[S]S=S(w,y,D)U=x(-405396+403034)D=i()t[D]=S N=h(2591206-(-570693),{G;J;r,s,g,Y,p;D;q;B;j,O})y=F[U]U={y(N)}S={Z(U)}U=S S=t[p]S=S and-893762+7685166 or 10668744-(-308042)end end end else if S<16559556-380623 then if S<15006184-(-246390)then if S<14242995-(-963066)then if S<-231233+15222850 then S=833316+7622674 else y={}S=F[x(-768053-(-765698))]end else s=x(421602-423968)S=F[x(-1045851+1043508)]g=F[s]s=x(701855-704202)k=g[s]s=t[m[-272956-(-272957)]]g={k(s)}y={Z(g)}end else if S<16375003-713485 then T=not H r=r+M I=r<=O I=T and I T=r>=O T=H and T I=T or I T=13091136-737044 S=I and T I=-848868+14875972 S=S or I else w=Y j=w S=12629485-415735 T[w]=j w=nil end end else if S<15890407-(-523014)then if S<-574458+16854552 then y=x(-626756-(-624381))S=F[y]k=x(639528+-641896)y=F[k]k=x(353649+-356017)F[k]=S k=x(704620-706995)F[k]=y k=t[m[-10185-(-10186)]]S=605490+3040659 g=k()else y={}S=true t[m[-739003-(-739004)]]=S S=F[x(-56320+53944)]end else if S<-423776+17016193 then t[m[731780-731775]]=y k=nil S=15304118-826186 else y={}S=F[x(-957844+955492)]end end end end end end end S=#P return Z(y)end,function(F)local x,S=383596-383595,F[886544+-886543]while S do k[S],x=k[S]-(-714688+714689),x+(-894862+894863)if 1007671+-1007671==k[S]then k[S],t[S]=nil,nil end S=F[x]end end,{},function(F,x)local Z=s(x)local a=function(a,m,P,b)return S(F,{a,m;P,b},x,Z)end return a end,function()g=g+(881616+-881615)k[g]=789404-789403 return g end,function(F,x)local Z=s(x)local a=function(...)return S(F,{...},x,Z)end return a end,function(F,x)local Z=s(x)local a=function()return S(F,{},x,Z)end return a end,function(F)k[F]=k[F]-(696783-696782)if 703721-703721==k[F]then k[F],t[F]=nil,nil end end return(C(381484+12858972,{}))(Z(y))end)(getfenv and getfenv()or _ENV,unpack or table[x(782594-784942)],newproxy,setmetatable,getmetatable,select,{...})end)(...)