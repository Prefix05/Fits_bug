function getMondayOfWeek(date) {
    const d = new Date(date);
    const day = d.getDay();
    const diff = (day === 0 ? -6 : 1 - day);
    d.setDate(d.getDate() + diff);
    return d;
}

function buildWeekDates(offset) {
    const today = new Date();
    today.setDate(today.getDate() + offset * 7);
    const monday = getMondayOfWeek(today);
    const dates = [];
    for (let i = 0; i < 7; i++) {
        const d = new Date(monday);
        d.setDate(d.getDate() + i);
        dates.push(d.toISOString().slice(0, 10));
    }
    return dates;
}

function buildLabels(barDates) {
    const dayNames = ['월', '화', '수', '목', '금', '토', '일'];
    return barDates.map(function(dateStr, i) {
        const d = new Date(dateStr + 'T00:00:00');
        return dayNames[i] + ' ' + (d.getMonth() + 1) + '/' + d.getDate();
    });
}

function updateWeekLabel(offset) {
    const dates = buildWeekDates(offset);
    const monday = new Date(dates[0] + 'T00:00:00');
    const sunday = new Date(dates[6] + 'T00:00:00');
    const fmt = function(d) {
        return d.toLocaleDateString('ko-KR', {month: 'short', day: 'numeric'});
    };
    document.getElementById('weekLabel').textContent = fmt(monday) + ' – ' + fmt(sunday);
    document.getElementById('btnNext').style.opacity = (currentWeekOffset >= 0) ? '0.3' : '1';
    document.getElementById('btnNext').style.pointerEvents = (currentWeekOffset >= 0) ? 'none' : 'auto';
}

function changeWeek(direction) {
    if (direction === 1 && currentWeekOffset >= 0) return;
    currentWeekOffset += direction;
    currentSelectedDate = '';
    loadData(currentWeekOffset, null);
}

function loadData(offset, selectedDate) {
    currentSelectedDate = selectedDate || '';
    let url = contextPath + '/trainer/meals?weekOffset=' + offset;
    if (selectedDate) url += '&selectedDate=' + selectedDate;

    fetch(url, {headers: {'Accept': 'application/json'}})
        .then(function(res) { return res.json(); })
        .then(function(data) {
            updateStats(data);
            updateMealList(data.meals);
            updateChart(data.chartData, offset, selectedDate);
        });
}

function updateChart(chartData, offset, selectedDate) {
    const barDates = buildWeekDates(offset);
    const labels = buildLabels(barDates);
    const calData = barDates.map(function(date) {
        return chartData[date] || 0;
    });
    const colors = barDates.map(function(d) {
        return (!selectedDate || d === selectedDate)
            ? 'rgba(0, 88, 188, 0.85)'
            : 'rgba(0, 88, 188, 0.25)';
    });

    myChart.data.labels = labels;
    myChart.data.datasets[0].data = calData;
    myChart.data.datasets[0].backgroundColor = colors;
    myChart.data.datasets[0]._barDates = barDates;
    myChart.update();
    updateWeekLabel(offset);
}

function updateStats(data) {
    const daily = data.isDailyView;
    document.getElementById('perfLabel').textContent  = daily ? 'Daily Performance' : 'Weekly Performance';
    document.getElementById('perfDate').textContent   = daily ? data.selectedDate : '';
    document.getElementById('labelCal').textContent   = daily ? 'Total Calories' : 'Avg Calories';
    document.getElementById('labelProt').textContent  = daily ? 'Total Protein'  : 'Avg Protein';
    document.getElementById('labelCarbs').textContent = daily ? 'Total Carbs'    : 'Avg Carbs';
    document.getElementById('labelFat').textContent   = daily ? 'Total Fats'     : 'Avg Fats';
    document.getElementById('valCal').textContent     = daily ? data.dayCal   : data.avgCal;
    document.getElementById('valProt').textContent    = daily ? data.dayProt  : data.avgProt;
    document.getElementById('valCarbs').textContent   = daily ? data.dayCarbs : data.avgCarbs;
    document.getElementById('valFat').textContent     = daily ? data.dayFat   : data.avgFat;
}

function updateMealList(meals) {
    const mealTypeLabel = {breakfast: '아침', lunch: '점심', dinner: '저녁', snack: '간식'};
    let lastType = null;
    let html = '';

    meals.forEach(function(meal) {
        if (meal.mealType !== lastType) {
            html += '<div class="flex items-center gap-3">'
                + '<span class="text-[10px] font-bold text-on-surface-variant uppercase tracking-widest whitespace-nowrap">'
                + (mealTypeLabel[meal.mealType] || meal.mealType)
                + '</span>'
                + '<div class="h-px bg-outline-variant/30 flex-1"></div>'
                + '</div>';
            lastType = meal.mealType;
        }
        html += '<div class="bg-surface-container-lowest rounded-2xl overflow-hidden flex shadow-[0_4px_24px_rgba(0,88,188,0.06)] border border-outline-variant/10">'
            + '<div class="w-28 h-32 flex-shrink-0">'
            + '<img src="' + meal.imageUrl + '" alt="' + meal.mealName + '" class="w-full h-full object-cover"/>'
            + '</div>'
            + '<div class="p-4 flex-grow flex flex-col justify-between min-w-0">'
            + '<div>'
            + '<div class="flex justify-between items-start gap-2">'
            + '<h4 class="font-bold text-on-surface text-sm leading-snug truncate">' + meal.mealName + '</h4>'
            + '<span class="text-[10px] font-medium text-on-surface-variant whitespace-nowrap shrink-0">' + meal.mealTime + '</span>'
            + '</div>'
            + '<p class="text-[11px] text-on-surface-variant mt-1 line-clamp-1">' + meal.description + '</p>'
            + '</div>'
            + '<div class="flex flex-wrap gap-x-3 gap-y-1 mt-2">'
            + '<div class="flex items-center gap-1">'
            + '<span class="text-xs font-bold text-on-surface">' + meal.calories + '</span>'
            + '<span class="text-[10px] text-on-surface-variant">kcal</span>'
            + '</div>'
            + '<div class="flex items-center gap-1 border-l border-outline-variant/30 pl-3">'
            + '<span class="text-xs font-bold text-primary">' + meal.protein + '</span>'
            + '<span class="text-[10px] text-on-surface-variant">단백질</span>'
            + '</div>'
            + '<div class="flex items-center gap-1 border-l border-outline-variant/30 pl-3">'
            + '<span class="text-xs font-bold text-orange-500">' + meal.carbs + '</span>'
            + '<span class="text-[10px] text-on-surface-variant">탄수화물</span>'
            + '</div>'
            + '<div class="flex items-center gap-1 border-l border-outline-variant/30 pl-3">'
            + '<span class="text-xs font-bold text-amber-500">' + meal.fat + '</span>'
            + '<span class="text-[10px] text-on-surface-variant">지방</span>'
            + '</div>'
            + '</div>'
            + '</div>'
            + '</div>';
    });

    document.getElementById('mealList').innerHTML = html;
}