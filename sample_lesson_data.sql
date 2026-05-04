-- ============================================================
-- Sample lesson data for calendar testing
-- Run these queries in order against fitbull_db
-- ============================================================

-- STEP 1: Find your trainer ID and existing members
-- Run this to see what data you already have:
--
-- SELECT t.id AS trainer_id, u.email, m.id AS member_id, m.name AS member_name
-- FROM trainer t
-- JOIN `user` u ON t.user_id = u.id
-- LEFT JOIN member m ON m.trainer_id = t.id
-- WHERE u.role = 'TRAINER' AND u.is_deleted = false;

-- STEP 2: If you have no members yet, insert sample ones.
-- Replace 1 with your actual trainer.id from the query above.

INSERT INTO member (trainer_id, name, age, goals, status, height, weight, lesson_count, total_lessons)
VALUES
(1, '김민수', 28, '체중 감량 및 유산소', 'ACTIVE', 175.0, 82.0, 0, 20),
(1, '박지수', 24, '근력 강화 및 체형 교정', 'ACTIVE', 162.0, 56.0, 0, 16),
(1, '이강호', 32, '근비대 - 하체 집중', 'ACTIVE', 180.0, 90.0, 0, 24);

-- STEP 3: Insert sample lessons for the next two weeks.
-- Replace client_id values with actual member IDs from STEP 1/2.
-- Assumes member IDs are 1, 2, 3 — adjust if different.

-- ── Week of 2026-05-04 (Mon) ──────────────────────────────────────────────
INSERT INTO lesson (lesson_date, start_time, end_time, goal, client_id, status) VALUES
('2026-05-04', '09:00:00', '10:00:00', '유산소 & 체중 감량',          1, 'COMPLETED'),
('2026-05-04', '11:00:00', '12:00:00', '상체 근력 강화',               2, 'COMPLETED'),
('2026-05-05', '10:00:00', '11:00:00', '하체 스쿼트 루틴',             3, 'COMPLETED'),
('2026-05-05', '14:00:00', '15:30:00', '전신 컨디셔닝',                1, 'COMPLETED'),
('2026-05-06', '09:30:00', '10:30:00', '코어 & 자세 교정',             2, 'BOOKED'),
('2026-05-07', '08:00:00', '09:00:00', '아침 유산소',                  3, 'BOOKED'),
('2026-05-07', '13:00:00', '14:00:00', '체중 감량 인터벌',             1, 'BOOKED'),
('2026-05-07', '16:00:00', '17:00:00', '상체 근비대',                  2, 'BOOKED'),
('2026-05-08', '10:00:00', '11:30:00', '필라테스 & 스트레칭',          3, 'BOOKED'),
('2026-05-09', '09:00:00', '10:00:00', '유산소 + 하체',                1, 'BOOKED'),
('2026-05-10', '11:00:00', '12:00:00', '주말 전신 운동',               2, 'BOOKED');

-- ── Week of 2026-05-11 (Mon) ──────────────────────────────────────────────
INSERT INTO lesson (lesson_date, start_time, end_time, goal, client_id, status) VALUES
('2026-05-11', '09:00:00', '10:00:00', '유산소 체중 감량',             1, 'BOOKED'),
('2026-05-12', '10:00:00', '11:00:00', '상체 근력',                    2, 'BOOKED'),
('2026-05-12', '15:00:00', '16:00:00', '하체 데드리프트',              3, 'BOOKED'),
('2026-05-13', '09:30:00', '11:00:00', '전신 서킷 트레이닝',           1, 'BOOKED'),
('2026-05-14', '08:00:00', '09:00:00', '코어 운동',                    2, 'BOOKED'),
('2026-05-14', '14:00:00', '15:00:00', '체형 교정 & 스트레칭',         3, 'BOOKED'),
('2026-05-15', '10:00:00', '11:00:00', '유산소 & 하체',                1, 'BOOKED'),
('2026-05-16', '11:00:00', '12:00:00', '주말 근력 훈련',               2, 'BOOKED'),
('2026-05-17', '10:00:00', '11:30:00', '주말 전신 운동',               3, 'BOOKED');

-- ── Week of 2026-05-18 (Mon) — extra data for month view dots ─────────────
INSERT INTO lesson (lesson_date, start_time, end_time, goal, client_id, status) VALUES
('2026-05-18', '09:00:00', '10:00:00', '유산소',         1, 'BOOKED'),
('2026-05-19', '10:00:00', '11:00:00', '상체 근력',      2, 'BOOKED'),
('2026-05-20', '14:00:00', '15:00:00', '하체',           3, 'BOOKED'),
('2026-05-21', '09:00:00', '10:00:00', '전신 운동',      1, 'BOOKED'),
('2026-05-21', '11:00:00', '12:00:00', '코어',           2, 'BOOKED'),
('2026-05-22', '15:00:00', '16:00:00', '스트레칭',       3, 'BOOKED');
