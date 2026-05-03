<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Trainer Signup - 정산 정보</title>
    <style>
        .section { margin-bottom: 20px; }
        .section label { display: block; margin-bottom: 4px; font-weight: bold; }
        .section input[type="text"],
        .section input[type="number"],
        .section select { width: 300px; padding: 8px; border: 1px solid #ccc; border-radius: 4px; }
        .hidden { display: none; }
        .radio-group label { font-weight: normal; margin-right: 16px; }
        .sub-section { margin-left: 20px; margin-top: 12px; padding: 12px; border-left: 3px solid #3b82f6; }
        .info-notice { background: #eff6ff; border: 1px solid #bfdbfe; border-radius: 6px; padding: 12px; color: #1e40af; font-size: 14px; margin-top: 12px; }
    </style>
</head>
<body>

<h2>정산 정보 입력</h2>
<p style="color:red">${error}</p>

<form action="${pageContext.request.contextPath}/trainer/signup/step3" method="post">

    <!-- Trainer base type -->
    <div class="section">
        <label>트레이너 유형</label>
        <div class="radio-group">
            <label><input type="radio" name="baseType" value="FREELANCE" onchange="onBaseTypeChange()" required> 개인/프리랜서</label>
            <label><input type="radio" name="baseType" value="GYM" onchange="onBaseTypeChange()"> 헬스장 소속</label>
        </div>
    </div>

    <!-- Freelance sub-section -->
    <div id="freelanceSection" class="sub-section hidden">
        <div class="section">
            <label>사업자 등록 여부</label>
            <div class="radio-group">
                <label><input type="radio" name="freelanceType" value="FREELANCE_BUSINESS" onchange="onFreelanceTypeChange()"> 사업자 있음</label>
                <label><input type="radio" name="freelanceType" value="FREELANCE_INDIVIDUAL" onchange="onFreelanceTypeChange()"> 사업자 없음</label>
            </div>
        </div>

        <div id="businessNumSection" class="section hidden">
            <label>사업자 등록번호</label>
            <input type="text" name="businessRegistrationNum" placeholder="000-00-00000"/>
        </div>

        <div id="residentNumSection" class="section hidden">
            <label>주민등록번호 <span style="color:#888;font-size:12px;">(원천징수 처리 목적)</span></label>
            <input type="text" name="residentRegistrationNum" placeholder="000000-0000000"/>
        </div>
    </div>

    <!-- Gym sub-section -->
    <div id="gymSection" class="sub-section hidden">
        <div class="section">
            <label>소속 형태</label>
            <div class="radio-group">
                <label><input type="radio" name="gymType" value="GYM_EMPLOYEE" onchange="onGymTypeChange()"> 직원 (급여)</label>
                <label><input type="radio" name="gymType" value="GYM_COMMISSION" onchange="onGymTypeChange()"> 위탁 (수수료 분배)</label>
                <label><input type="radio" name="gymType" value="GYM_RENTAL" onchange="onGymTypeChange()"> 시설 임대 (독립 운영)</label>
            </div>
        </div>

        <div class="section">
            <label>헬스장 코드</label>
            <input type="text" name="gymCode" placeholder="헬스장에서 받은 코드 입력"/>
        </div>

        <div id="commissionSection" class="section hidden">
            <label>트레이너 수수료 비율 (%)</label>
            <input type="number" name="commissionRate" placeholder="예: 70" min="1" max="99"/>
            <span style="font-size:13px;color:#666;">헬스장이 나머지를 가져갑니다</span>
        </div>

        <!-- Shown for GYM_EMPLOYEE and GYM_COMMISSION -->
        <div id="gymPaymentNotice" class="info-notice hidden">
            정산 금액은 헬스장으로 입금됩니다. 헬스장이 급여 또는 수수료를 별도로 지급합니다.
        </div>
    </div>

    <!-- Bank info — shown for FREELANCE types and GYM_RENTAL only -->
    <div id="bankSection" class="hidden">
        <hr style="margin: 20px 0;">
        <h3>정산 계좌 정보</h3>

        <div class="section">
            <label>은행명</label>
            <select name="bankName">
                <option value="">선택하세요</option>
                <option value="KB국민은행">KB국민은행</option>
                <option value="신한은행">신한은행</option>
                <option value="우리은행">우리은행</option>
                <option value="하나은행">하나은행</option>
                <option value="NH농협은행">NH농협은행</option>
                <option value="IBK기업은행">IBK기업은행</option>
                <option value="카카오뱅크">카카오뱅크</option>
                <option value="토스뱅크">토스뱅크</option>
                <option value="케이뱅크">케이뱅크</option>
                <option value="SC제일은행">SC제일은행</option>
                <option value="씨티은행">씨티은행</option>
                <option value="우체국">우체국</option>
            </select>
        </div>

        <div class="section">
            <label>계좌번호</label>
            <input type="text" name="accountNumber" placeholder="계좌번호 (숫자만)"/>
        </div>
    </div>

    <!-- Submit — shown once any sub-type is selected -->
    <div id="submitSection" class="hidden">
        <button type="submit">완료</button>
    </div>

</form>

<script>
    function onBaseTypeChange() {
        var base = document.querySelector('input[name="baseType"]:checked').value;

        // hide everything
        document.getElementById('freelanceSection').classList.add('hidden');
        document.getElementById('gymSection').classList.add('hidden');
        document.getElementById('bankSection').classList.add('hidden');
        document.getElementById('submitSection').classList.add('hidden');
        document.getElementById('businessNumSection').classList.add('hidden');
        document.getElementById('residentNumSection').classList.add('hidden');
        document.getElementById('commissionSection').classList.add('hidden');
        document.getElementById('gymPaymentNotice').classList.add('hidden');

        if (base === 'FREELANCE') {
            document.getElementById('freelanceSection').classList.remove('hidden');
            // bank + submit shown after freelanceType is chosen
        } else {
            document.getElementById('gymSection').classList.remove('hidden');
            // bank + submit shown after gymType is chosen
        }
    }

    function onFreelanceTypeChange() {
        var type = document.querySelector('input[name="freelanceType"]:checked').value;

        document.getElementById('businessNumSection').classList.add('hidden');
        document.getElementById('residentNumSection').classList.add('hidden');

        if (type === 'FREELANCE_BUSINESS') {
            document.getElementById('businessNumSection').classList.remove('hidden');
        } else {
            document.getElementById('residentNumSection').classList.remove('hidden');
        }

        document.getElementById('bankSection').classList.remove('hidden');
        document.getElementById('submitSection').classList.remove('hidden');
    }

    function onGymTypeChange() {
        var type = document.querySelector('input[name="gymType"]:checked').value;

        document.getElementById('commissionSection').classList.add('hidden');
        document.getElementById('bankSection').classList.add('hidden');
        document.getElementById('gymPaymentNotice').classList.add('hidden');

        if (type === 'GYM_COMMISSION') {
            document.getElementById('commissionSection').classList.remove('hidden');
        }

        if (type === 'GYM_RENTAL') {
            // rents space, collects money directly → needs own bank account
            document.getElementById('bankSection').classList.remove('hidden');
        } else {
            // GYM_EMPLOYEE or GYM_COMMISSION → gym receives payment
            document.getElementById('gymPaymentNotice').classList.remove('hidden');
        }

        document.getElementById('submitSection').classList.remove('hidden');
    }
</script>

</body>
</html>
