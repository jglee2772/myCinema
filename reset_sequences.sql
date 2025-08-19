-- PostgreSQL 시퀀스 리셋 스크립트
-- 데이터 마이그레이션 후 실행

-- customer 테이블 시퀀스 리셋
SELECT setval('customer_id_seq', (SELECT MAX(id) FROM customer));

-- movie 테이블 시퀀스 리셋
SELECT setval('movie_id_seq', (SELECT MAX(id) FROM movie));

-- moviepay 테이블 시퀀스 리셋
SELECT setval('moviepay_id_seq', (SELECT MAX(id) FROM moviepay));

-- moviedelete 테이블 시퀀스 리셋
SELECT setval('moviedelete_id_seq', (SELECT MAX(id) FROM moviedelete));

-- appearance_info 테이블 시퀀스 리셋
SELECT setval('appearance_info_id_seq', (SELECT MAX(id) FROM appearance_info));

-- cart 테이블 시퀀스 리셋
SELECT setval('cart_id_seq', (SELECT MAX(id) FROM cart));

-- chartarray 테이블 시퀀스 리셋
SELECT setval('chartarray_id_seq', (SELECT MAX(id) FROM chartarray));

-- commentarray 테이블 시퀀스 리셋
SELECT setval('commentarray_id_seq', (SELECT MAX(id) FROM commentarray));

-- faq 테이블 시퀀스 리셋
SELECT setval('faq_id_seq', (SELECT MAX(id) FROM faq));

-- inquiry 테이블 시퀀스 리셋
SELECT setval('inquiry_id_seq', (SELECT MAX(id) FROM inquiry));

-- item 테이블 시퀀스 리셋
SELECT setval('item_id_seq', (SELECT MAX(id) FROM item));

-- news 테이블 시퀀스 리셋
SELECT setval('news_id_seq', (SELECT MAX(id) FROM news));

-- review 테이블 시퀀스 리셋
SELECT setval('review_id_seq', (SELECT MAX(id) FROM review));

-- room 테이블 시퀀스 리셋
SELECT setval('room_id_seq', (SELECT MAX(id) FROM room));

-- schedules 테이블 시퀀스 리셋
SELECT setval('schedules_id_seq', (SELECT MAX(id) FROM schedules));

-- seatinfo 테이블 시퀀스 리셋
SELECT setval('seatinfo_id_seq', (SELECT MAX(id) FROM seatinfo));

-- storepay 테이블 시퀀스 리셋
SELECT setval('storepay_id_seq', (SELECT MAX(id) FROM storepay));

-- storepaydelete 테이블 시퀀스 리셋
SELECT setval('storepaydelete_id_seq', (SELECT MAX(id) FROM storepaydelete));
