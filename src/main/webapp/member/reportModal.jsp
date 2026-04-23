<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고하기 모달</title>
<div id="reportModal" class="fixed inset-0 z-50 hidden items-center justify-center bg-black/40 backdrop-blur-sm">

    <div class="bg-white w-full max-w-md rounded-2xl shadow-xl">

        <!-- 제목 -->
        <div class="p-6 text-center">
            <h2 class="text-xl font-bold mb-2">신고 사유 선택</h2>
            <p class="text-sm text-gray-500">
                신고 사유를 선택해주세요
            </p>
        </div>

        <!-- 폼 -->
        <form action="report" method="post" class="px-6 pb-6">

            <input type="hidden" name="postId" id="reportPostId">

            <div class="space-y-2">

                <label class="flex items-center gap-2">
                    <input type="radio" name="reason" value="광고" required>
                    광고 / 홍보
                </label>

                <label class="flex items-center gap-2">
                    <input type="radio" name="reason" value="음란물">
                    음란물
                </label>

                <label class="flex items-center gap-2">
                    <input type="radio" name="reason" value="욕설">
                    욕설 / 비방
                </label>

                <label class="flex items-center gap-2">
                    <input type="radio" name="reason" value="개인정보">
                    개인정보 노출
                </label>

                <!-- 기타 -->
                <div>
                    <label class="flex items-center gap-2">
                        <input type="radio" name="reason" value="기타" onclick="toggleEtc(true)">
                        기타
                    </label>

                    <textarea id="etcBox" name="detail"
                        class="w-full mt-2 p-2 border rounded hidden"
                        placeholder="신고 사유 입력"></textarea>
                </div>

            </div>

            <!-- 버튼 -->
            <div class="flex gap-2 mt-6">
                <button type="button" onclick="closeModal()"
                        class="flex-1 py-2 border rounded">
                    취소
                </button>

                <button class="flex-1 py-2 bg-red-500 text-white rounded">
                    신고하기
                </button>
            </div>

        </form>

    </div>
</div>

</head>
</html>