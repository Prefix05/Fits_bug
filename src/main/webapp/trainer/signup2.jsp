<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Trainer Profile - Step 2</title>

    <style>
        .tag-btn {
            display: inline-block;
            padding: 8px 14px;
            border: 1px solid #ccc;
            border-radius: 20px;
            cursor: pointer;
            margin: 4px;
        }

        input[type="checkbox"] {
            display: none;
        }

        input[type="checkbox"]:checked + label {
            background-color: #3b82f6;
            color: white;
            border-color: #3b82f6;
        }
    </style>
</head>
<body>

<h2>프로필 정보 입력</h2>

<form action="${pageContext.request.contextPath}/trainer/signup/step2"
      method="post"
      enctype="multipart/form-data">

    <!-- Description -->
    <div>
        <label>소개</label><br>
        <textarea name="description" rows="5"></textarea>
    </div>

    <br>

    <!-- Specialization -->
    <div>
        <label>전문 분야</label><br>

        <input type="checkbox" id="yoga" name="specializations" value="YOGA">
        <label for="yoga" class="tag-btn">Yoga</label>

        <input type="checkbox" id="weightloss" name="specializations" value="WEIGHT_LOSS">
        <label for="weightloss" class="tag-btn">Weight Loss</label>

        <input type="checkbox" id="musclegain" name="specializations" value="MUSCLE_GAIN">
        <label for="musclegain" class="tag-btn">Muscle Gain</label>

        <input type="checkbox" id="body_recomposition" name="specializations" value="BODY_RECOMPOSITION">
        <label for="body_recomposition" class="tag-btn">Body Recomposition</label>

        <input type="checkbox" id="strength_training" name="specializations" value="STRENGTH_TRAINING">
        <label for="strength_training" class="tag-btn">Strength Training</label>

        <input type="checkbox" id="functional_training" name="specializations" value="FUNCTIONAL_TRAINING">
        <label for="functional_training" class="tag-btn">Functional Training</label>

        <input type="checkbox" id="posture_correction" name="specializations" value="POSTURE_CORRECTION">
        <label for="posture_correction" class="tag-btn">Posture Correction</label>

        <input type="checkbox" id="Pilates" name="specializations" value="PILATES">
        <label for="Pilates" class="tag-btn">Pilates</label>

        <input type="checkbox" id="crossfit" name="specializations" value="CROSSFIT">
        <label for="crossfit" class="tag-btn">Crossfit</label>

        <input type="checkbox" id="rehab" name="specializations" value="REHABILITATION">
        <label for="rehab" class="tag-btn">Rehabilitation</label>

        <input type="checkbox" id="atheletic_performance" name="specializations" value="ATHLETIC_PERFORMANCE">
        <label for="atheletic_performance" class="tag-btn">Athletic Performance</label>
    </div>

    <br>

    <!-- Strength -->
    <div>
        <label>강점</label><br>

        <input type="checkbox" id="kind" name="traits" value="KIND">
        <label for="kind" class="tag-btn">Kind</label>

        <input type="checkbox" id="beginner_friendly" name="traits" value="BEGINNER_FRIENDLY">
        <label for="beginner_friendly" class="tag-btn">Beginner Friendly</label>

        <input type="checkbox" id="fun" name="traits" value="FUN">
        <label for="fun" class="tag-btn">Fun</label>

        <input type="checkbox" id="motivational" name="traits" value="MOTIVATIONAL">
        <label for="motivational" class="tag-btn">Motivational</label>

        <input type="checkbox" id="detail_oriented" name="traits" value="DETAIL_ORIENTED">
        <label for="detail_oriented" class="tag-btn">Detail Oriented</label>

        <input type="checkbox" id="patient" name="traits" value="PATIENT">
        <label for="patient" class="tag-btn">Patient</label>

        <input type="checkbox" id="result_focused" name="traits" value="RESULT_FOCUSED">
        <label for="result_focused" class="tag-btn">Result Focused</label>

        <input type="checkbox" id="flexible" name="traits" value="FLEXIBLE">
        <label for="flexible" class="tag-btn">Flexible</label>

        <input type="checkbox" id="communicative" name="traits" value="COMMUNICATIVE">
        <label for="communicative" class="tag-btn">Communicative</label>

    </div>

    <br>

    <!-- Profile Image -->
    <div>
        <label>프로필 이미지</label><br>
        <input type="file" name="profileImage" accept="image/*">
    </div>

    <br><br>

    <button type="submit">다음</button>

</form>

</body>
</html>