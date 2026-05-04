<%--
  Created by IntelliJ IDEA.
  User: jinhoyon
  Date: 4/28/26
  Time: 1:14 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Fitzberg - Trainer Messages</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700&amp;display=swap" rel="stylesheet"/>
    <link
            href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
            rel="stylesheet"/>
    <script
            id="tailwind-config">tailwind.config = {
        darkMode: "class", theme: {
            extend: {
                colors: {
                    "surface-container-lowest": "#ffffff",
                    "on-error-container": "#93000a",
                    tertiary: "#9e3d00",
                    error: "#ba1a1a",
                    "error-container": "#ffdad6",
                    "on-primary-container": "#fefcff",
                    "on-tertiary": "#ffffff",
                    "primary-container": "#0070eb",
                    secondary: "#405e96",
                    "on-tertiary-fixed-variant": "#7c2e00",
                    "on-surface-variant": "#414755",
                    "on-error": "#ffffff",
                    "surface-dim": "#d9dade",
                    "on-secondary-fixed": "#001a41",
                    "on-background": "#1a1c1f",
                    "on-primary-fixed": "#001a41",
                    "on-tertiary-fixed": "#351000",
                    "secondary-fixed": "#d8e2ff",
                    "surface-container-high": "#e8e8ed",
                    "on-secondary-fixed-variant": "#26467d",
                    background: "#f9f9fe",
                    "surface-tint": "#005bc1",
                    "outline-variant": "#c1c6d7",
                    "surface-container-highest": "#e2e2e7",
                    "surface-variant": "#e2e2e7",
                    "on-surface": "#1a1c1f",
                    "on-primary": "#ffffff",
                    "tertiary-fixed-dim": "#ffb595",
                    "surface-container-low": "#f3f3f8",
                    "primary-fixed": "#d8e2ff",
                    "on-secondary-container": "#2d4c83",
                    "on-secondary": "#ffffff",
                    "tertiary-fixed": "#ffdbcc",
                    "on-tertiary-container": "#fffbff",
                    "tertiary-container": "#c64f00",
                    "surface-container": "#ededf2",
                    "on-primary-fixed-variant": "#004493",
                    "inverse-primary": "#adc6ff",
                    surface: "#f9f9fe",
                    "secondary-fixed-dim": "#adc6ff",
                    "primary-fixed-dim": "#adc6ff",
                    "secondary-container": "#a1befd",
                    outline: "#717786",
                    primary: "#0058bc",
                    "inverse-on-surface": "#f0f0f5",
                    "surface-bright": "#f9f9fe",
                    "inverse-surface": "#2e3034"
                },
                borderRadius: {DEFAULT: "0.125rem", lg: "0.25rem", xl: "0.5rem", full: "0.75rem"},
                fontFamily: {headline: ["Inter"], body: ["Inter"], label: ["Inter"], display: "Inter"}
            }
        }
    };</script>
    <style>
        body {
            font-family: 'Inter', sans-serif;
        }

        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
        }

        .message-bubble-trainer {
            background: linear-gradient(135deg, #0058bc 0%, #0070eb 100%);
        }
    </style>
</head>

<body class="bg-surface text-on-surface antialiased overflow-hidden" data-mode="connect">
<!-- Sidebar Navigation Shell -->
<!-- Sidebar Navigation -->

<!-- SideNavBar Shell -->
<aside
        class="fixed left-0 top-0 h-full w-64 bg-slate-50 dark:bg-slate-900 transition-colors duration-200 z-20 flex-col p-6 hidden lg:flex">
    <a href="" class="flex items-center gap-3 mb-10">
        <div class="w-10 h-10 bg-[#007AFF] rounded-xl flex items-center justify-center shrink-0">
            <span class="material-symbols-outlined text-white text-2xl" data-icon="" style="">exercise</span>
        </div>
        <h1 class="text-2xl font-bold tracking-tight text-on-surface" style="">Fitsbug</h1>
    </a>
    <nav class="flex-1 space-y-1" id="main-nav">

        <!-- 공통 nav item -->
        <!-- 내주변 -->
        <div class="relative">
            <!-- Parent toggle -->
            <a class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 transition-colors duration-200 rounded-lg cursor-pointer select-none"
               onclick="
                        this.parentElement.querySelector('.dropdown').classList.toggle('hidden');
                        this.querySelector('.chevron').classList.toggle('rotate-180');
                    " href="#">
                <span class="material-symbols-outlined">distance</span>
                내주변
                <span class="material-symbols-outlined ml-auto transition-transform duration-200 chevron"
                      style="font-size:18px">expand_more</span>
            </a>

            <!-- Dropdown children -->
            <div class="dropdown hidden flex-col pl-4">
                <!-- 헬스장 -->
                <a class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 transition-colors duration-200 rounded-lg"
                   href="#">
                    <span class="material-symbols-outlined" data-icon="">fitness_center</span>
                    헬스장
                </a>
                <!-- 트레이너 -->
                <a class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 transition-colors duration-200 rounded-lg"
                   href="#">
                    <span class="material-symbols-outlined" data-icon="">person</span>
                    트레이너
                </a>
            </div>
        </div>

        <!-- 대시보드 -->
        <a class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 transition-colors duration-200 rounded-lg"
           href="" style=""><span class="material-symbols-outlined" data-icon="" style="">dashboard</span>
            대시보드</a>

        <!-- 회원관리 -->
        <a class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 transition-colors duration-200"
           href="${pageContext.request.contextPath}/trainer/clients" style=""><span class="material-symbols-outlined"
                                                                            data-icon="" style="">group</span>
            회원
            관리</a>

        <!-- 일정 -->
        <a class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 transition-colors duration-200 rounded-lg"
           href="/calendar.html" style=""><span class="material-symbols-outlined" data-icon=""
                                                style="">calendar_today</span>
            일정</a>

        <!-- 메시지 -->
        <a class="flex items-center gap-3 px-4 py-3 text-sm font-semibold text-blue-700 border-r-4 border-blue-700 bg-slate-200/50 transition-colors duration-200 rounded-lg"
           href="/messages.html" style=""><span class="material-symbols-outlined" data-icon="" style="">chat</span> 메시지</a>

        <!-- 수익 -->
        <a class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 transition-colors duration-200 rounded-lg"
           href="earnings.html" style=""><span class="material-symbols-outlined" data-icon="" style="">payments</span>
            수익</a>
    </nav>

    <!--설정, 고객 지원-->
    <div class="mt-auto pt-6 border-slate-200 dark:border-slate-800 space-y-1">
        <a class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 transition-colors duration-200 rounded-lg"
           href="#" style=""><span class="material-symbols-outlined" data-icon="" style="">settings</span>
            설정</a>
        <a class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 transition-colors duration-200 rounded-lg"
           href="#" style=""><span class="material-symbols-outlined" data-icon="" style="">help</span> 고객
            지원</a>
        <div class="border-t border-slate-200 dark:border-slate-800 my-2"></div>
    </div>

    <!-- 마이프로필 -->
    <a href="${pageContext.request.contextPath}/trainer/profile"
       class=" flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 transition-colors duration-200 rounded-lg">
        <img alt="Alex Fischer" class="w-10 h-10 rounded-full object-cover shrink-0"
             src="${not empty sessionScope.loginUser.profileImg ? pageContext.request.contextPath.concat('/uploads/').concat(sessionScope.loginUser.profileImg) : pageContext.request.contextPath.concat('/img/profile_img.jpg')}"
             style=""/>
        <div class="overflow-hidden">
            <p class="text-sm font-bold text-on-surface truncate" style="">연진호</p>
            <p class="text-xs text-slate-500 truncate" style="">마이프로필</p>
        </div>
    </a>
</aside>

<!-- Main Content Area -->
<main class="lg:ml-64 flex flex-col h-screen bg-white">
    <!-- Messages Dashboard Body -->
    <div class="flex-1 flex overflow-hidden">
        <!-- Left Column: Conversation List -->
        <section class="w-80 lg:w-96 bg-surface-container-low border-r border-transparent flex flex-col">
            <div class="p-6">
                <div class="flex items-center justify-between mb-6">
                    <h1 class="text-2xl font-bold tracking-tight text-on-surface">Messages</h1>
                    <button
                            class="w-8 h-8 rounded-full bg-primary-container/10 text-primary flex items-center justify-center hover:bg-primary-container/20 transition-colors">
                            <span class="material-symbols-outlined text-[20px]"
                                  data-icon="edit_square">edit_square</span>
                    </button>
                </div>
                <div class="relative">
                        <span
                                class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-outline text-[18px]"
                                data-icon="search">search</span>
                    <input
                            class="w-full bg-surface-container-lowest border-none rounded-xl py-2.5 pl-10 pr-4 text-sm focus:ring-2 focus:ring-primary/20 placeholder:text-outline-variant"
                            placeholder="Search conversations" type="text"/>
                </div>
            </div>
            <div class="flex-1 overflow-y-auto px-3 space-y-1">
                <!-- Active Conversation -->
                <div
                        class="flex items-center gap-4 p-4 bg-surface-container-lowest rounded-2xl shadow-[0px_4px_12px_rgba(0,88,188,0.04)] cursor-pointer group">
                    <div class="relative">
                        <img alt="Kim Min-su" class="w-12 h-12 rounded-full object-cover"
                             data-alt="portrait of a young Korean man with athletic build, Kim Min-su, wearing white gym shirt, soft natural indoor lighting"
                             src="https://lh3.googleusercontent.com/aida-public/AB6AXuBTyTLBo9cAB1DyMP9XehvSp7O9IltDbHQsrtPfvKWD9wuTNQGgvvfxC7cMfU3OXKzJhnO2z02D-mVSO9wNtK3LpF_9pWb17mv7-yovZcQ_Mmg_o3xapUbWXPcHbBikISneRUKKNKIeN-aJnQK43VicGR6wfNGjLU1ZqfP0yx2h4AYeV1VMyg3nkX98NmojlpHx4zjnclMcxSXrt2Y2wRzM1HaKRmhrutEF5Zjaf33PYnf2T2vxZVA9kB4fPl0VAG8zm4mUqd8IwLkt"/>
                        <span
                                class="absolute bottom-0 right-0 w-3 h-3 bg-green-500 border-2 border-surface-container-lowest rounded-full"></span>
                    </div>
                    <div class="flex-1 min-w-0">
                        <div class="flex items-center justify-between mb-0.5">
                            <h3 class="text-sm font-semibold truncate text-on-surface">Kim Min-su</h3>
                            <span class="text-[10px] text-primary font-bold">2m ago</span>
                        </div>
                        <p class="text-xs text-on-surface font-medium truncate">The leg workout was intense today!
                        </p>
                    </div>
                    <div class="w-2 h-2 bg-primary rounded-full shrink-0"></div>
                </div>
                <!-- Conversation Item -->
                <div
                        class="flex items-center gap-4 p-4 hover:bg-surface-container-high rounded-2xl cursor-pointer transition-colors group">
                    <div class="relative">
                        <img alt="Lee Seo-yeon" class="w-12 h-12 rounded-full object-cover"
                             data-alt="portrait of a professional young woman Lee Seo-yeon in yoga attire, smiling gently, clean bright fitness studio background"
                             src="https://lh3.googleusercontent.com/aida-public/AB6AXuD8FQSYPQG1jr9b7KcPTptk1lmSI8Ng11UgBJj2Cdu-owlwDLX17-vbifbGhBz5P8xJoab7Qeh1NjyCdwadlRu509l2A44XSLi4HZWzfHc58lI8iHf9kwQyd_PMTjOUVTSHwotVkdvRy9AxSLf7q04bIhyqGuoyBVasU5SkJ5mhZpuMZLwSatLRHgOES2psB-J7XHzW0_PGzZQNaCQfni44iNF9KNpJdrN_nOk_jj9qOvoeMS4-ex2RyQd8_mRr_9cMbq_2knu7WQiF"/>
                    </div>
                    <div class="flex-1 min-w-0">
                        <div class="flex items-center justify-between mb-0.5">
                            <h3 class="text-sm font-semibold truncate text-on-surface">Lee Seo-yeon</h3>
                            <span class="text-[10px] text-outline font-medium">1h ago</span>
                        </div>
                        <p class="text-xs text-on-surface-variant truncate">Can we reschedule for tomorrow morning?
                        </p>
                    </div>
                </div>
                <!-- Conversation Item -->
                <div
                        class="flex items-center gap-4 p-4 hover:bg-surface-container-high rounded-2xl cursor-pointer transition-colors group">
                    <div class="relative">
                        <img alt="Park Jun-ho" class="w-12 h-12 rounded-full object-cover"
                             data-alt="portrait of an older male athlete Park Jun-ho in high-performance running gear, outdoors at dusk, professional bokeh effect"
                             src="https://lh3.googleusercontent.com/aida-public/AB6AXuB8AA1kiiISRDig-RkMtwIg4KKdpiKogZ6iMEXp-43c6TUXzhWHW9OIBtuevIfn4Kd5E1XxqhVJZ4eq426UhQtdRURr1U-gvC55REQAKQXRrA6O_5oHKgebg30ilFyBLOAKuhq3BMqPeiP72zXY3AVfKe3Lf5bAcu6mAteGSfRtTcACN8LH4I3bOFUicnXgbUXvx9Ee4V4ghPsRj29kP2nNbqszHx3KLFHA2dbI8SxVjdc2mtvs6AeQpv2kFBiimUMiw86tvNtOGh70"/>
                    </div>
                    <div class="flex-1 min-w-0">
                        <div class="flex items-center justify-between mb-0.5">
                            <h3 class="text-sm font-semibold truncate text-on-surface">Park Jun-ho</h3>
                            <span class="text-[10px] text-outline font-medium">Yesterday</span>
                        </div>
                        <p class="text-xs text-on-surface-variant truncate">Sent a photo of the nutrition label.</p>
                    </div>
                </div>
            </div>
        </section>
        <!-- Right Column: Chat Window -->
        <section class="flex-1 flex flex-col bg-surface-container-lowest">
            <!-- Chat Header -->
            <header
                    class="h-20 flex items-center justify-between px-8 border-b border-surface-container-low shadow-sm shadow-black/[0.01] z-10">
                <div class="flex items-center gap-4">
                    <div class="relative">
                        <img alt="Kim Min-su" class="w-10 h-10 rounded-full object-cover"
                             data-alt="portrait of a young Korean man with athletic build, Kim Min-su, wearing white gym shirt, soft natural indoor lighting"
                             src="https://lh3.googleusercontent.com/aida-public/AB6AXuBtMIwaiWsnOk3IQ_OJeVUvzMqncSiDY8q1gwTrzl4IzP16SnIy-yNjQS-ex7arP74YyKWbFlz_hsrf9s7a7l9PqkyAswxnBWIufcf5B889nrMLwQQbHSikxD-8B88MKRP01J-1PvlJodfW3geVvA7V03FS0T9CXlZsZxXRxept07WzDACnv66stDHVR__rqIsdVDGVTo_ZdIhUgcm7dSY-RxgIM-yTxSMyzHVh5m9g-sEh8st8XwBj6FkpCYaBsN3yaDeE4C5xdGT6"/>
                        <span
                                class="absolute bottom-0 right-0 w-2.5 h-2.5 bg-green-500 border-2 border-surface-container-lowest rounded-full"></span>
                    </div>
                    <div>
                        <h2 class="text-base font-bold text-on-surface">Kim Min-su</h2>
                        <p class="text-[10px] flex items-center gap-1 text-on-surface-variant font-medium">
                            <span class="w-1.5 h-1.5 bg-green-500 rounded-full"></span>
                            Online now
                        </p>
                    </div>
                </div>
                <div class="flex items-center gap-2">
                    <button
                            class="p-2.5 hover:bg-surface-container-low rounded-xl text-on-surface-variant transition-colors">
                        <span class="material-symbols-outlined" data-icon="videocam">videocam</span>
                    </button>
                    <button
                            class="p-2.5 hover:bg-surface-container-low rounded-xl text-on-surface-variant transition-colors">
                        <span class="material-symbols-outlined" data-icon="call">call</span>
                    </button>
                    <div class="w-px h-6 bg-outline-variant/30 mx-2"></div>
                    <button
                            class="px-4 py-2 hover:bg-surface-container-low rounded-xl text-primary text-xs font-bold transition-colors">
                        VIEW PROFILE
                    </button>
                </div>
            </header>
            <!-- Message History -->
            <div class="flex-1 overflow-y-auto p-8 space-y-6 flex flex-col scroll-smooth">
                <!-- Date Divider -->
                <div class="flex items-center justify-center">
                        <span
                                class="bg-surface-container-low px-4 py-1 rounded-full text-[10px] font-bold text-outline-variant tracking-widest uppercase">Today</span>
                </div>
                <!-- Client Message -->
                <div class="flex items-end gap-3 max-w-[80%]">
                    <img alt="Kim Min-su" class="w-8 h-8 rounded-full object-cover mb-1"
                         data-alt="portrait of a young Korean man with athletic build, Kim Min-su, wearing white gym shirt, soft natural indoor lighting"
                         src="https://lh3.googleusercontent.com/aida-public/AB6AXuBTYMnWLmYJn5R30kucWfcm0rvb9UGPDoID-3ZnuF0cnPr5L3MIoT1QlPNklwH42vTzeuFfJ746zJd4QzPCcD4cxwz629rKaa5ZWCI-oeuyuRCeL1AOLGvmxFaG5jp6N5Lwdgegd90fHrFpqjQuH46jcNFtJZyAvuVguszZJen3JP8ULD506EWOzLV4FmHw8k0ILgp70O3BOBYp4ffoyn84N99JTE204tZK_9sz2FEhzZhZoJ2UsQbjnf3OVO58OOVdReSQibNtiYjQ"/>
                    <div class="space-y-1">
                        <div
                                class="bg-surface-container-low px-4 py-3 rounded-2xl rounded-bl-none text-sm leading-relaxed text-on-surface">
                            Hey Coach Alex, I just finished the lower body session you assigned.
                        </div>
                        <span class="text-[10px] text-outline-variant font-medium px-1">09:12 AM</span>
                    </div>
                </div>
                <div class="flex items-end gap-3 max-w-[80%]">
                    <div class="w-8 shrink-0"></div>
                    <div class="space-y-1">
                        <div
                                class="bg-surface-container-low px-4 py-3 rounded-2xl rounded-bl-none text-sm leading-relaxed text-on-surface">
                            The leg workout was intense today! My quads are already feeling it. Should I increase my
                            protein intake for recovery today?
                        </div>
                        <span class="text-[10px] text-outline-variant font-medium px-1">09:13 AM</span>
                    </div>
                </div>
                <!-- Trainer Message -->
                <div class="flex items-end gap-3 flex-row-reverse max-w-[80%] self-end">
                    <div class="space-y-1 text-right">
                        <div
                                class="message-bubble-trainer px-4 py-3 rounded-2xl rounded-br-none text-sm leading-relaxed text-white">
                            Great job, Min-su! Consistency is key. Since we increased the volume today, definitely
                            aim for an extra 20-30g of protein.
                        </div>
                        <span class="text-[10px] text-outline-variant font-medium px-1">09:45 AM</span>
                    </div>
                </div>
                <div class="flex items-end gap-3 flex-row-reverse max-w-[80%] self-end">
                    <div class="space-y-1 text-right">
                        <div
                                class="message-bubble-trainer px-4 py-3 rounded-2xl rounded-br-none text-sm leading-relaxed text-white">
                            Also, don't forget to do the active recovery stretches I added to your dashboard. How
                            did your knee feel during the squats?
                        </div>
                        <div class="flex items-center justify-end gap-1 mt-1">
                            <span class="text-[10px] text-outline-variant font-medium">Seen</span>
                            <span class="material-symbols-outlined text-[12px] text-primary"
                                  data-icon="done_all">done_all</span>
                        </div>
                    </div>
                </div>
                <!-- Client Message -->
                <div class="flex items-end gap-3 max-w-[80%]">
                    <img alt="Kim Min-su" class="w-8 h-8 rounded-full object-cover mb-1"
                         data-alt="portrait of a young Korean man with athletic build, Kim Min-su, wearing white gym shirt, soft natural indoor lighting"
                         src="https://lh3.googleusercontent.com/aida-public/AB6AXuAB-BTrCvhNxvJHX1g2RdJTSJJwIvsNbayDVOwX--WQ82WyIIqdR9xIWGsBkX3rT07ajF2doj4XTmSq6EBoOg21mFEJGadOCtY8FXs04_7zbUzJxF1Y5UsMlH6INmAdl5E1nrADyn0dj-oB8ptms3gKdPut7UmNI3-vXt7mQEe1zQboyKqKhhZid46wjkSC8WIFzOYGROfEzUvtfypr29vsmfdm9ZukMQDj2Jf7faQV61zQOF7KvwGCmJDbQmskSC7Iir2xaEWpwybT"/>
                    <div class="space-y-1">
                        <div
                                class="bg-surface-container-low px-4 py-3 rounded-2xl rounded-bl-none text-sm leading-relaxed text-on-surface">
                            Knee felt much better after focusing on the foot drive like you showed me. I'll do those
                            stretches now!
                        </div>
                        <span class="text-[10px] text-outline-variant font-medium px-1">10:02 AM</span>
                    </div>
                </div>
            </div>
            <!-- Message Input Area -->
            <footer class="p-6 bg-surface-container-lowest">
                <div
                        class="flex items-end gap-3 bg-surface-container-low p-2 rounded-2xl border border-surface-container">
                    <div class="flex items-center gap-1">
                        <button
                                class="w-10 h-10 flex items-center justify-center text-on-surface-variant hover:bg-surface-container-high rounded-xl transition-colors">
                            <span class="material-symbols-outlined" data-icon="add_circle">add_circle</span>
                        </button>
                        <button
                                class="w-10 h-10 flex items-center justify-center text-on-surface-variant hover:bg-surface-container-high rounded-xl transition-colors">
                            <span class="material-symbols-outlined" data-icon="image">image</span>
                        </button>
                        <button
                                class="w-10 h-10 flex items-center justify-center text-on-surface-variant hover:bg-surface-container-high rounded-xl transition-colors">
                            <span class="material-symbols-outlined" data-icon="description">description</span>
                        </button>
                    </div>
                    <textarea
                            class="flex-1 bg-transparent border-none focus:ring-0 text-sm py-2.5 resize-none max-h-32 placeholder:text-outline"
                            placeholder="Message Kim Min-su..." rows="1"></textarea>
                    <button
                            class="w-10 h-10 flex items-center justify-center bg-primary text-white rounded-xl shadow-lg shadow-primary/20 active:scale-90 transition-all">
                        <span class="material-symbols-outlined text-[20px]" data-icon="send">send</span>
                    </button>
                </div>
            </footer>
        </section>
    </div>
</main>
</body>

</html>
