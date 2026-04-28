<%--
  Created by IntelliJ IDEA.
  User: jinhoyon
  Date: 4/28/26
  Time: 1:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="utf-8" />
  <meta content="width=device-width, initial-scale=1.0, viewport-fit=cover" name="viewport" />
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700&amp;display=swap" rel="stylesheet" />
  <link
          href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
          rel="stylesheet" />
  <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
  <script
          id="tailwind-config">tailwind.config = { darkMode: "class", theme: { extend: { colors: { "surface-container": "#ededf2", "surface-dim": "#d9dade", "on-tertiary-fixed": "#351000", "on-error": "#ffffff", "on-surface-variant": "#414755", "inverse-surface": "#2e3034", error: "#ba1a1a", "secondary-fixed": "#d8e2ff", "on-tertiary-container": "#fffbff", "on-primary-fixed-variant": "#004493", "surface-container-low": "#f3f3f8", "outline-variant": "#c1c6d7", "tertiary-fixed": "#ffdbcc", "primary-fixed-dim": "#adc6ff", "on-secondary": "#ffffff", "surface-tint": "#005bc1", "error-container": "#ffdad6", outline: "#717786", "on-primary": "#ffffff", "secondary-container": "#a1befd", "on-secondary-container": "#2d4c83", "tertiary-fixed-dim": "#ffb595", "on-error-container": "#93000a", background: "#f9f9fe", "primary-container": "#0070eb", "on-surface": "#1a1c1f", secondary: "#405e96", tertiary: "#9e3d00", "surface-container-lowest": "#ffffff", "on-primary-fixed": "#001a41", "on-secondary-fixed": "#001a41", "surface-bright": "#f9f9fe", "on-primary-container": "#fefcff", "on-tertiary": "#ffffff", "inverse-on-surface": "#f0f0f5", "on-tertiary-fixed-variant": "#7c2e00", "secondary-fixed-dim": "#adc6ff", "surface-container-high": "#e8e8ed", surface: "#f9f9fe", "surface-container-highest": "#e2e2e7", "tertiary-container": "#c64f00", "inverse-primary": "#adc6ff", "primary-fixed": "#d8e2ff", "on-secondary-fixed-variant": "#26467d", primary: "#0058bc", "on-background": "#1a1c1f", "surface-variant": "#e2e2e7" }, fontFamily: { headline: ["Inter"], body: ["Inter"], label: ["Inter"], display: "Inter" }, borderRadius: { DEFAULT: "0.125rem", lg: "0.25rem", xl: "0.5rem", full: "0.75rem" } } } };</script>
  <style>
    .material-symbols-outlined {
      font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
      display: inline-block;
      line-height: 1;
      text-transform: none;
      letter-spacing: normal;
      word-wrap: normal;
      white-space: nowrap;
      direction: ltr;
    }

    body {
      font-family: 'Inter', sans-serif;
      -webkit-font-smoothing: antialiased;
    }

    .glass-nav {
      backdrop-filter: blur(20px);
      -webkit-backdrop-filter: blur(20px);
    }

    .hide-scrollbar::-webkit-scrollbar {
      display: none;
    }

    .hide-scrollbar {
      -ms-overflow-style: none;
      scrollbar-width: none;
    }
  </style>
</head>

<body class="bg-surface text-on-surface">
<!-- Persistent Sidebar Navigation (Desktop) -->
<aside
        class="fixed left-0 top-0 h-full w-64 bg-surface-container-lowest border-r border-outline-variant/30 z-50 hidden md:flex flex-col">
  <div class="px-6 py-8">
    <div class="flex items-center gap-2 mb-10">
      <span class="text-2xl font-bold tracking-tighter text-slate-900 dark:text-slate-50">Fitzberg</span>
    </div>
    <nav class="space-y-2">
      <a class="flex items-center gap-3 px-4 py-3 rounded-xl text-on-surface-variant hover:bg-surface-container-high transition-all group"
         href="#">
        <span class="material-symbols-outlined group-hover:text-on-surface">dashboard</span>
        <span class="text-sm font-medium">Dashboard</span>
      </a>
      <a class="flex items-center gap-3 px-4 py-3 rounded-xl bg-primary/10 text-primary font-semibold transition-all group"
         href="#">
        <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1">group</span>
        <span class="text-sm">Clients</span>
      </a>
      <a class="flex items-center gap-3 px-4 py-3 rounded-xl text-on-surface-variant hover:bg-surface-container-high transition-all group"
         href="#">
        <span class="material-symbols-outlined group-hover:text-on-surface">calendar_today</span>
        <span class="text-sm font-medium">Schedule</span>
      </a>
      <a class="flex items-center gap-3 px-4 py-3 rounded-xl text-on-surface-variant hover:bg-surface-container-high transition-all group"
         href="#">
        <span class="material-symbols-outlined group-hover:text-on-surface">payments</span>
        <span class="text-sm font-medium">Earnings</span>
      </a>
    </nav>
  </div>
  <div class="mt-auto p-6 border-t border-outline-variant/30">
    <div class="flex items-center gap-3">
      <div class="w-10 h-10 rounded-full overflow-hidden bg-surface-container-highest">
        <img alt="Trainer profile avatar" class="w-full h-full object-cover"
             src="https://lh3.googleusercontent.com/aida-public/AB6AXuCQ7iuTfuKtf8GQwAE9doTeb4ki9I4uaP9nlkIfYR4C38jU_KLf0ORFIAzMIMfY_9V91SGFiPuR-iHtw8WOwM8lmJsNq9pYhYdrvMm05qkdqsN4UPWToKsIp3ROSnfOA7GUmcwe9WU50kRn0IDKqdPvDMUOAIEjBg7I_1Uxvrp9Iw5Usw2XpPh8Cn23nOx24aTaP4Tgv9YpwuWDlfebUHyY5oM-_7Rxvch_0z7uZUso921dL1qunrt7t4Ifiy5LEThxpcJlVBaTn1Hx" />
      </div>
      <div class="overflow-hidden">
        <p class="text-sm font-bold truncate">Jinho Park</p>
        <p class="text-xs text-on-surface-variant truncate">Master Trainer</p>
      </div>
    </div>
  </div>
</aside>
<div class="md:ml-64">
  <!-- TopAppBar -->
  <header
          class="fixed top-0 w-full md:w-[calc(100%-16rem)] z-50 bg-white/80 dark:bg-slate-900/80 backdrop-blur-xl flex items-center justify-between px-6 h-16 border-b border-outline-variant/10">
    <div class="flex items-center gap-4">
      <button
              class="flex items-center gap-1 text-primary active:scale-95 transition-transform hover:opacity-80">
        <span class="material-symbols-outlined" data-icon="arrow_back">arrow_back</span>
        <span class="text-sm font-semibold">Back</span>
      </button>
      <h1
              class="text-on-surface font-headline text-lg font-bold tracking-tight border-l border-outline-variant/30 pl-4">
        Diet Log</h1>
    </div>
    <button class="text-on-surface-variant hover:text-primary active:scale-95 transition-transform">
      <span class="material-symbols-outlined" data-icon="tune">tune</span>
    </button>
  </header>
  <main class="pt-20 pb-24 px-4 max-w-lg mx-auto space-y-6 md:max-w-4xl md:px-8">
    <!-- Summary Card: Bento Style -->
    <section class="bg-surface-container-lowest rounded-xl p-6 shadow-[0_4px_24px_rgba(0,88,188,0.04)]">
      <div class="flex items-end justify-between mb-2">
        <p class="text-on-surface-variant font-label text-[10px] uppercase tracking-widest font-bold">Weekly
          Performance</p>
      </div>
      <div class="grid gap-4 pt-2 grid-cols-2 md:grid-cols-4">
        <div class="space-y-1">
          <span class="text-on-surface-variant font-label text-[10px] font-medium">Avg Calories</span>
          <div class="flex items-baseline gap-1">
            <span class="text-2xl font-bold text-on-surface tracking-tighter">2,100</span>
            <span class="text-[10px] text-on-surface-variant font-medium">kcal</span>
          </div>
        </div>
        <div class="space-y-1">
          <span class="text-on-surface-variant font-label text-[10px] font-medium">Avg Protein</span>
          <div class="flex items-baseline gap-1">
            <span class="text-2xl font-bold text-on-surface tracking-tighter">135</span>
            <span class="text-[10px] text-on-surface-variant font-medium">g</span>
          </div>
        </div>
        <div class="space-y-1">
          <span class="text-on-surface-variant font-label text-[10px] font-medium">Avg Carbs</span>
          <div class="flex items-baseline gap-1">
            <span class="text-2xl font-bold text-on-surface tracking-tighter">220</span>
            <span class="text-[10px] text-on-surface-variant font-medium">g</span>
          </div>
        </div>
        <div class="space-y-1">
          <span class="text-on-surface-variant font-label text-[10px] font-medium">Avg Fats</span>
          <div class="flex items-baseline gap-1">
            <span class="text-2xl font-bold text-on-surface tracking-tighter">70</span>
            <span class="text-[10px] text-on-surface-variant font-medium">g</span>
          </div>
        </div>
      </div>
    </section>
    <!-- Trends Card -->
    <section
            class="bg-surface-container-lowest rounded-xl p-6 shadow-[0_4px_24px_rgba(0,88,188,0.04)] overflow-hidden">
      <div class="flex items-center justify-between mb-6">
        <h3 class="text-on-surface font-semibold text-base">Intake Trends</h3>
        <div class="bg-surface-container-low p-1 rounded-lg flex gap-1">
          <button
                  class="px-3 py-1 text-[10px] font-bold rounded-md bg-white shadow-sm text-primary">DAILY</button>
          <button
                  class="px-3 py-1 text-[10px] font-bold rounded-md text-on-surface-variant">WEEKLY</button>
        </div>
      </div>
      <!-- Minimal Line Graph (SVG) -->
      <div class="relative h-32 w-full mt-4">
        <div class="flex items-center gap-2">
          <button
                  class="flex items-center justify-center w-8 h-8 rounded-full text-on-surface-variant/40 hover:bg-surface-container-high hover:text-on-surface transition-colors active:scale-95">
            <span class="material-symbols-outlined text-xl">chevron_left</span>
          </button>
          <div class="flex-grow">
            <svg class="w-full h-32" preserveaspectratio="none" viewbox="0 0 400 120">
              <rect fill="#0058bc" height="80" rx="4" width="30" x="10" y="40"></rect>
              <rect fill="#0058bc" height="60" rx="4" width="30" x="65" y="60"></rect>
              <rect fill="#0058bc" height="90" rx="4" width="30" x="120" y="30"></rect>
              <rect fill="#0058bc" height="70" rx="4" width="30" x="175" y="50"></rect>
              <rect fill="#0058bc" height="100" rx="4" width="30" x="230" y="20"></rect>
              <rect fill="#0058bc" height="40" rx="4" width="30" x="285" y="80"></rect>
              <rect fill="#0058bc" height="75" rx="4" width="30" x="340" y="45"></rect>
              <text class="fill-on-surface-variant font-medium" style="font-size: 8px;"
                    text-anchor="middle" x="25" y="35">2100</text>
              <text class="fill-on-surface-variant font-medium" style="font-size: 8px;"
                    text-anchor="middle" x="80" y="55">1800</text>
              <text class="fill-on-surface-variant font-medium" style="font-size: 8px;"
                    text-anchor="middle" x="135" y="25">2200</text>
              <text class="fill-on-surface-variant font-medium" style="font-size: 8px;"
                    text-anchor="middle" x="190" y="45">1950</text>
              <text class="fill-on-surface-variant font-medium" style="font-size: 8px;"
                    text-anchor="middle" x="245" y="15">2400</text>
              <text class="fill-on-surface-variant font-medium" style="font-size: 8px;"
                    text-anchor="middle" x="300" y="75">1500</text>
              <text class="fill-on-surface-variant font-medium" style="font-size: 8px;"
                    text-anchor="middle" x="355" y="40">2050</text>
            </svg>
            <div
                    class="flex justify-between mt-2 text-[10px] font-medium text-on-surface-variant uppercase tracking-widest">
              <span>Mon</span>
              <span>Tue</span>
              <span>Wed</span>
              <span>Thu</span>
              <span>Fri</span>
              <span>Sat</span>
              <span>Sun</span>
            </div>
          </div>
          <button
                  class="flex items-center justify-center w-8 h-8 rounded-full text-on-surface-variant/40 hover:bg-surface-container-high hover:text-on-surface transition-colors active:scale-95">
            <span class="material-symbols-outlined text-xl">chevron_right</span>
          </button>
        </div>
      </div>
    </section>
    <!-- Meal Log Section -->
    <section class="space-y-8">
      <div class="flex items-center justify-between px-2">
        <h3 class="text-on-surface font-semibold text-base">Today's Meals</h3>
        <span class="text-on-surface-variant text-[12px] font-medium">May 24, Friday</span>
      </div>
      <!-- Breakfast Section -->
      <div class="space-y-4">
        <div class="flex items-center gap-4">
                        <span
                                class="text-[10px] font-bold text-on-surface-variant uppercase tracking-widest whitespace-nowrap">Breakfast</span>
          <div class="h-[1px] bg-outline-variant/30 w-full"></div>
        </div>
        <div
                class="bg-surface-container-lowest rounded-xl overflow-hidden flex shadow-[0_4px_24px_rgba(0,88,188,0.04)]">
          <div class="w-28 h-32 flex-shrink-0">
            <img alt="Protein Shake with Berries" class="w-full h-full object-cover"
                 src="https://lh3.googleusercontent.com/aida-public/AB6AXuD2yQxJQoJzJkpzua4HBJXZ4KUE-WLY5Mb0F4HY5UbbFUt7xET7CJDnLwJJXDW6_aBOataNPe045hqRHH9PMP1wNag-BrVJzfRLHTNur7ZK3T13nWqvXAk4LBrn7Nd33uXaqM7oG4uZPjPYLE7FCp1okg5Sok3uorOgkPZ2kNUJ6Qzc-vsWh7upQYgDztHTkMoAiP3JnYHYg25eIMvEc_AWYxSBBINM5bajQ6kS45s5AnstiegDzjNxEctBT1C45Tq_esjwkAbVR9SU" />
          </div>
          <div class="p-4 flex-grow flex flex-col justify-between">
            <div>
              <div class="flex justify-between items-start">
                <h4 class="font-bold text-on-surface text-sm">Protein Shake</h4>
                <span class="text-[10px] font-medium text-on-surface-variant">08:00 AM</span>
              </div>
              <p class="text-[11px] text-on-surface-variant mt-1 line-clamp-1">"Post-workout
                recovery."</p>
            </div>
            <div class="flex gap-4">
              <div class="flex items-center gap-1">
                <span class="text-xs font-bold text-on-surface">180</span>
                <span class="text-[10px] text-on-surface-variant">kcal</span>
              </div>
              <div class="flex items-center gap-1 border-l border-surface-container-highest pl-3">
                <span class="text-xs font-bold text-primary">25</span>
                <span class="text-[10px] text-on-surface-variant">Protein</span>
              </div>
              <div class="flex items-center gap-1 border-l border-surface-container-highest pl-3">
                <span class="text-xs font-bold text-orange-600">12</span>
                <span class="text-[10px] text-on-surface-variant">Carbs</span>
              </div>
              <div class="flex items-center gap-1 border-l border-surface-container-highest pl-3">
                <span class="text-xs font-bold text-amber-600">4</span>
                <span class="text-[10px] text-on-surface-variant">Fat</span>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- Lunch Section -->
      <div class="space-y-4">
        <div class="flex items-center gap-4">
                        <span
                                class="text-[10px] font-bold text-on-surface-variant uppercase tracking-widest whitespace-nowrap">Lunch</span>
          <div class="h-[1px] bg-outline-variant/30 w-full"></div>
        </div>
        <div
                class="bg-surface-container-lowest rounded-xl overflow-hidden flex shadow-[0_4px_24px_rgba(0,88,188,0.04)]">
          <div class="w-28 h-32 flex-shrink-0">
            <img alt="Korean Kimchi Stew" class="w-full h-full object-cover"
                 src="https://lh3.googleusercontent.com/aida-public/AB6AXuCbolKXgMoW1TTeT6TpRfa4o3zS1UGvhju0vsppFqWtZSxgR5K-P1K_L361JpQOaOwtWl9BLAopHyfncDlNC36NBfnp1vG6HJam--8zjdzQEX2WlfjcLmMx1BvHkaA21XsvjrYtN4Pocb57lwgiBVXDHyMIRnaqGHPPqwwkEg3hOmsinP19NcNASbVBNBI9bQWLqbDp6nNBQDQPhfvfbFm8Cpdmx4RMG3eS8IvrXqc8DMVm6v-CZP6eQN3V7LCG4kx-PFBeVQlcszKz" />
          </div>
          <div class="p-4 flex-grow flex flex-col justify-between">
            <div>
              <div class="flex justify-between items-start">
                <h4 class="font-bold text-on-surface text-sm">Kimchi Stew (김치찌개)</h4>
                <span class="text-[10px] font-medium text-on-surface-variant">12:30 PM</span>
              </div>
              <p class="text-[11px] text-on-surface-variant mt-1 line-clamp-1">"Added extra tofu for
                protein as requested."</p>
            </div>
            <div class="flex gap-4">
              <div class="flex items-center gap-1">
                <span class="text-xs font-bold text-on-surface">540</span>
                <span class="text-[10px] text-on-surface-variant">kcal</span>
              </div>
              <div class="flex items-center gap-1 border-l border-surface-container-highest pl-3">
                <span class="text-xs font-bold text-primary">28</span>
                <span class="text-[10px] text-on-surface-variant">Protein</span>
              </div>
              <div class="flex items-center gap-1 border-l border-surface-container-highest pl-3">
                <span class="text-xs font-bold text-orange-600">45</span>
                <span class="text-[10px] text-on-surface-variant">Carbs</span>
              </div>
              <div class="flex items-center gap-1 border-l border-surface-container-highest pl-3">
                <span class="text-xs font-bold text-amber-600">18</span>
                <span class="text-[10px] text-on-surface-variant">Fat</span>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- Dinner Section -->
      <div class="space-y-4">
        <div class="flex items-center gap-4">
                        <span
                                class="text-[10px] font-bold text-on-surface-variant uppercase tracking-widest whitespace-nowrap">Dinner</span>
          <div class="h-[1px] bg-outline-variant/30 w-full"></div>
        </div>
        <div
                class="bg-surface-container-lowest rounded-xl overflow-hidden flex shadow-[0_4px_24px_rgba(0,88,188,0.04)]">
          <div class="w-28 h-32 flex-shrink-0">
            <img alt="Healthy Bibimbap" class="w-full h-full object-cover"
                 src="https://lh3.googleusercontent.com/aida-public/AB6AXuDiay_D27hQ57kyCu5OfuQjdJWzPknPLdxFdBAjwOAKlMgJ9vdGQ72m25mUuCCRjtR_FQ8qNhcAW5ignmypPncD84VEV5TK3MBo-LgJCCoyIGh5IBOzC5bHiDT2wTM9tQWhqzJ-xRyjLseRUkeF6TUxWKDbyP4FBRHFWzgiZnIxPL33WorKPAOaCeRz36W8XVICYmr7wbFvwKnrCR5WCYQd2zYlwu8qTYfCQFGMD9y7e3DMLdFkNlwbz4LKhmEDzRS_9TbjGP2b_Y3M" />
          </div>
          <div class="p-4 flex-grow flex flex-col justify-between">
            <div>
              <div class="flex justify-between items-start">
                <h4 class="font-bold text-on-surface text-sm">Bibimbap (비빔밥)</h4>
                <span class="text-[10px] font-medium text-on-surface-variant">07:15 PM</span>
              </div>
              <p class="text-[11px] text-on-surface-variant mt-1 line-clamp-1">"Brown rice used, light
                gochujang sauce."</p>
            </div>
            <div class="flex gap-4">
              <div class="flex items-center gap-1">
                <span class="text-xs font-bold text-on-surface">620</span>
                <span class="text-[10px] text-on-surface-variant">kcal</span>
              </div>
              <div class="flex items-center gap-1 border-l border-surface-container-highest pl-3">
                <span class="text-xs font-bold text-primary">34</span>
                <span class="text-[10px] text-on-surface-variant">Protein</span>
              </div>
              <div class="flex items-center gap-1 border-l border-surface-container-highest pl-3">
                <span class="text-xs font-bold text-orange-600">75</span>
                <span class="text-[10px] text-on-surface-variant">Carbs</span>
              </div>
              <div class="flex items-center gap-1 border-l border-surface-container-highest pl-3">
                <span class="text-xs font-bold text-amber-600">12</span>
                <span class="text-[10px] text-on-surface-variant">Fat</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Daily Trainer Comment Card -->
    <section
            class="bg-surface-container-lowest rounded-xl p-6 shadow-[0_4px_24px_rgba(0,88,188,0.04)] space-y-4">
      <div class="flex flex-col">
        <h3 class="text-on-surface font-semibold text-lg">Daily Trainer Comment</h3>
        <p class="text-sm text-on-surface-variant">May 24, Friday</p>
      </div>
      <div class="relative">
                    <textarea
                            class="w-full bg-surface-container-low border-none rounded-xl p-4 text-sm focus:ring-2 focus:ring-primary/20 min-h-[120px] resize-none"
                            placeholder="Write your feedback for the day..."></textarea>
      </div>
      <div class="flex justify-end">
        <button
                class="bg-primary text-white px-6 py-2.5 rounded-full font-bold text-sm shadow-lg active:scale-95 transition-transform">
          Post Comment
        </button>
      </div>
    </section>
  </main>
  <!-- BottomNavBar (Mobile Only) -->
  <nav
          class="fixed bottom-0 w-full z-50 rounded-t-3xl bg-white/80 dark:bg-slate-900/80 backdrop-blur-xl border-t border-slate-100 dark:border-slate-800 shadow-[0_-4px_24px_rgba(0,88,188,0.04)] flex justify-around items-center h-20 px-4 pb-safe md:hidden">
    <button
            class="flex flex-col items-center justify-center text-slate-400 dark:text-slate-500 hover:text-blue-600 active:scale-90 transition-transform duration-200">
      <span class="material-symbols-outlined" data-icon="dashboard">dashboard</span>
      <span class="font-['Inter'] text-[10px] font-medium uppercase tracking-widest mt-1">Dashboard</span>
    </button>
    <button
            class="flex flex-col items-center justify-center text-blue-700 dark:text-blue-400 active:scale-90 transition-transform duration-200">
                <span class="material-symbols-outlined" data-icon="group"
                      style="font-variation-settings: 'FILL' 1;">group</span>
      <span class="font-['Inter'] text-[10px] font-medium uppercase tracking-widest mt-1">Clients</span>
    </button>
    <button
            class="flex flex-col items-center justify-center text-slate-400 dark:text-slate-500 hover:text-blue-600 active:scale-90 transition-transform duration-200">
      <span class="material-symbols-outlined" data-icon="calendar_today">calendar_today</span>
      <span class="font-['Inter'] text-[10px] font-medium uppercase tracking-widest mt-1">Schedule</span>
    </button>
    <button
            class="flex flex-col items-center justify-center text-slate-400 dark:text-slate-500 hover:text-blue-600 active:scale-90 transition-transform duration-200">
      <span class="material-symbols-outlined" data-icon="payments">payments</span>
      <span class="font-['Inter'] text-[10px] font-medium uppercase tracking-widest mt-1">Earnings</span>
    </button>
  </nav>
</div>
</body>
</html>
