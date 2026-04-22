<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성 모달</title>
<!-- 게시글 작성 모달 -->
<div id="postModal" class="fixed inset-0 z-50 hidden items-center justify-center bg-black/40 backdrop-blur-sm">
    <div class="bg-white w-full max-w-2xl rounded-2xl shadow-xl flex flex-col">
        <!-- 헤더 -->
        <div class="flex justify-between items-center px-6 py-4 border-b">
            <h2 class="text-xl font-bold">새 게시글 작성</h2>
            <button onclick="closePostModal()">
                <span class="material-symbols-outlined">close</span>
            </button>
        </div>

        <!-- 폼 -->
        <form action="post" method="post" enctype="multipart/form-data"
              class="p-6 flex flex-col gap-6">

            <!-- 카테고리 -->
            <div>
                <p class="text-xs font-semibold text-gray-500 mb-2">카테고리 선택</p>

                <div class="flex gap-2">
                    <button type="button" id="owunBtn"
                        onclick="selectCategory('owun')"
                        class="bg-blue-600 text-white px-4 py-2 rounded-full text-sm flex items-center gap-1">
                        ✔ 오운완
                    </button>

                    <button type="button" id="freeBtn"
                        onclick="selectCategory('free')"
                        class="bg-gray-200 px-4 py-2 rounded-full text-sm">
                        자유게시판
                    </button>
                </div>

                <input type="hidden" name="category" id="category" value="owun">
            </div>

            <!-- 제목 -->
            <input name="title" placeholder="제목을 입력하세요"
                   class="w-full p-3 border rounded-lg">

            <!-- 이미지 -->
            <div>
                <p class="text-xs font-semibold text-gray-500 mb-2">사진 업로드</p>

                <label class="w-full border-2 border-dashed rounded-xl p-8 flex flex-col items-center cursor-pointer hover:bg-gray-50">
                    <span class="material-symbols-outlined text-3xl mb-2">add_a_photo</span>

                    <span id="uploadText" class="text-sm text-gray-500">
                        운동 인증샷을 공유해보세요!
                    </span>

                    <input type="file" name="image" class="hidden">
                </label>
            </div>

            <!-- 내용 -->
            <textarea name="content"
                placeholder="내용을 입력하세요"
                class="w-full p-3 border rounded-lg resize-none"></textarea>

            <!-- 해시태그 -->
            <input name="hashtags" id="hashtagInput"
                placeholder="#등운동 #오운완"
                class="w-full p-3 border rounded-lg">

            <!-- 버튼 -->
            <div class="flex justify-end gap-2 mt-4">
                <button type="button" onclick="closePostModal()"
                    class="px-4 py-2 border rounded-lg">취소</button>

                <button type="submit"
                    class="px-6 py-2 bg-blue-600 text-white rounded-lg">
                    등록하기
                </button>
            </div>
            
        </form>
      </div>
    </div>
</head>
</html>